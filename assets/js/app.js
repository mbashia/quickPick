// We import the CSS which is extracted to its own file by esbuild.
// Remove this line if you add a your own CSS build pipeline (e.g postcss).

// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "./vendor/some-package.js"
//
// Alternatively, you can `npm install some-package` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", info => topbar.show())
window.addEventListener("phx:page-loading-stop", info => topbar.hide())


// const x = document.getElementById("demo");
console.log("im here")
// function getLocationAndSendUpdate() {
//   // Get the current location using the Geolocation API
//   navigator.geolocation.getCurrentPosition(
//     position => {
//       const { latitude, longitude } = position.coords;
//       const currentLocation = { latitude, longitude };
// console.log(currentLocation);
//       // Update the location on the server
//     },
//     error => {
//       console.error('Error getting location:', error.message);
//     }
//   );
// }
// console.log("currentlocationbelow")
// getLocationAndSendUpdate();

function getDetails() {
  var x, y;
  // Wait for the entire page to load
  window.onload = function () {
      // Select the elements by their IDs
      var element1 = document.getElementById('user_id');
      var element2 = document.getElementById('user_type');

      if (element1 && element2) {
        // Assign innerHTML values to variables
        x = element1.innerHTML;
        y = element2.innerHTML;
        console.log(x)
        console.log(y)

    } else {
        console.error('One or both elements not found!');
    }
  };
  return x, y;

}
function getLocationAndSendUpdate(user_id, user_type) {
  // Get the current location using the Geolocation API
  navigator.geolocation.getCurrentPosition(
    position => {
      const { latitude, longitude } = position.coords;
      const currentLocation = { latitude, longitude };
      // Send a POST request to the server to update the location
      fetch('http://localhost:4000/api/userlocations', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          user_id: user_id,
          user_type: user_type,
          latitude: latitude,
          longitude: longitude,
        }),
      })
        .then(response => {
          if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
          }
          return response.json();
        })
        .then(data => {
          // Handle the response data if needed
          console.log('Location update successful:', data);
        })
        .catch(error => {
          console.error('Error updating location:', error.message);
        });
    },
    error => {
      console.error('Error getting location:', error.message);
    }
  );
} 
// user_id,user_type = getDetails();
// console.log("user_id below");
// console.log(user_id);
 const user_id=document.getElementById('user_id').innerHTML;
 const user_type=document.getElementById('user_type').innerHTML;
console.log(user_id)
console.log("user_id above")
setInterval(() => {
  // Get the current location and update on the server
  getLocationAndSendUpdate(user_id, user_type);
}, 7000);
let Hooks = {};
Hooks.Map = {
  mounted() {
    const input1 = document.getElementById("location1");
    const input2 = document.getElementById("location2");
    const latitude_from_input = document.getElementById("latitude_from_input");
    const longitude_from_input = document.getElementById(
      "longitude_from_input"
    );
    const latitude_to_input = document.getElementById("latitude_to_input");
    const longitude_to_input = document.getElementById("longitude_to_input");
    const options = {
      fields: ["address_components", "geometry", "icon", "name"],
      componentRestrictions: { country: "ke" },
    };

    const autocomplete1 = new google.maps.places.Autocomplete(input1, options);
    autocomplete1.addListener("place_changed", () => {
      const place1 = autocomplete1.getPlace();
      console.log(place1.geometry.location.lat());
      latitude_from_input.value = place1.geometry.location.lat();
      longitude_from_input.value = place1.geometry.location.lng();
    });

    const autocomplete2 = new google.maps.places.Autocomplete(input2, options);
    autocomplete2.addListener("place_changed", () => {
      const place2 = autocomplete2.getPlace();
      console.log(place2.geometry.location.lat());
      latitude_to_input.value = place2.geometry.location.lat();
      longitude_to_input.value = place2.geometry.location.lng();
    });
  },
  updated() {
    const input1 = document.getElementById("location1");
    const input2 = document.getElementById("location2");
    const latitude_from_input = document.getElementById("latitude_from_input");
    const longitude_from_input = document.getElementById(
      "longitude_from_input"
    );
    const latitude_to_input = document.getElementById("latitude_to_input");
    const longitude_to_input = document.getElementById("longitude_to_input");
    const options = {
      fields: ["address_components", "geometry", "icon", "name"],
      componentRestrictions: { country: "ke" },
    };

    const autocomplete1 = new google.maps.places.Autocomplete(input1, options);
    autocomplete1.addListener("place_changed", () => {
      const place1 = autocomplete1.getPlace();
      console.log(place1.geometry.location.lat());
      latitude_from_input.value = place1.geometry.location.lat();
      longitude_from_input.value = place1.geometry.location.lng();
    });

    const autocomplete2 = new google.maps.places.Autocomplete(input2, options);
    autocomplete2.addListener("place_changed", () => {
      const place2 = autocomplete2.getPlace();
      console.log(place2.geometry.location.lat());
      latitude_to_input.value = place2.geometry.location.lat();
      longitude_to_input.value = place2.geometry.location.lng();
    });
  },
};

  
  
// connect if there are any LiveViews on the page
let liveSocket = new LiveSocket("/live", Socket, {
    hooks: Hooks,
    params: { _csrf_token: csrfToken },
  });

liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket
