defmodule QuickPickWeb.DeliveryLiveTest do
  use QuickPickWeb.ConnCase

  import Phoenix.LiveViewTest
  import QuickPick.DeliveriesFixtures

  @create_attrs %{
    customer_name: "some customer_name",
    customer_phone: "some customer_phone",
    description: "some description",
    from: "some from",
    lats: "some lats",
    long: "some long",
    price: "some price",
    status: "some status",
    to: "some to"
  }
  @update_attrs %{
    customer_name: "some updated customer_name",
    customer_phone: "some updated customer_phone",
    description: "some updated description",
    from: "some updated from",
    lats: "some updated lats",
    long: "some updated long",
    price: "some updated price",
    status: "some updated status",
    to: "some updated to"
  }
  @invalid_attrs %{
    customer_name: nil,
    customer_phone: nil,
    description: nil,
    from: nil,
    lats: nil,
    long: nil,
    price: nil,
    status: nil,
    to: nil
  }

  defp create_delivery(_) do
    delivery = delivery_fixture()
    %{delivery: delivery}
  end

  describe "Index" do
    setup [:create_delivery]

    test "lists all deliveries", %{conn: conn, delivery: delivery} do
      {:ok, _index_live, html} = live(conn, Routes.delivery_index_path(conn, :index))

      assert html =~ "Listing Deliveries"
      assert html =~ delivery.customer_name
    end

    test "saves new delivery", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.delivery_index_path(conn, :index))

      assert index_live |> element("a", "New Delivery") |> render_click() =~
               "New Delivery"

      assert_patch(index_live, Routes.delivery_index_path(conn, :new))

      assert index_live
             |> form("#delivery-form", delivery: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#delivery-form", delivery: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.delivery_index_path(conn, :index))

      assert html =~ "Delivery created successfully"
      assert html =~ "some customer_name"
    end

    test "updates delivery in listing", %{conn: conn, delivery: delivery} do
      {:ok, index_live, _html} = live(conn, Routes.delivery_index_path(conn, :index))

      assert index_live |> element("#delivery-#{delivery.id} a", "Edit") |> render_click() =~
               "Edit Delivery"

      assert_patch(index_live, Routes.delivery_index_path(conn, :edit, delivery))

      assert index_live
             |> form("#delivery-form", delivery: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#delivery-form", delivery: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.delivery_index_path(conn, :index))

      assert html =~ "Delivery updated successfully"
      assert html =~ "some updated customer_name"
    end

    test "deletes delivery in listing", %{conn: conn, delivery: delivery} do
      {:ok, index_live, _html} = live(conn, Routes.delivery_index_path(conn, :index))

      assert index_live |> element("#delivery-#{delivery.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#delivery-#{delivery.id}")
    end
  end

  describe "Show" do
    setup [:create_delivery]

    test "displays delivery", %{conn: conn, delivery: delivery} do
      {:ok, _show_live, html} = live(conn, Routes.delivery_show_path(conn, :show, delivery))

      assert html =~ "Show Delivery"
      assert html =~ delivery.customer_name
    end

    test "updates delivery within modal", %{conn: conn, delivery: delivery} do
      {:ok, show_live, _html} = live(conn, Routes.delivery_show_path(conn, :show, delivery))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Delivery"

      assert_patch(show_live, Routes.delivery_show_path(conn, :edit, delivery))

      assert show_live
             |> form("#delivery-form", delivery: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#delivery-form", delivery: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.delivery_show_path(conn, :show, delivery))

      assert html =~ "Delivery updated successfully"
      assert html =~ "some updated customer_name"
    end
  end
end
