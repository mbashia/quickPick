defmodule QuickPick.DeliveriesTest do
  use QuickPick.DataCase

  alias QuickPick.Deliveries

  describe "deliveries" do
    alias QuickPick.Deliveries.Delivery

    import QuickPick.DeliveriesFixtures

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

    test "list_deliveries/0 returns all deliveries" do
      delivery = delivery_fixture()
      assert Deliveries.list_deliveries() == [delivery]
    end

    test "get_delivery!/1 returns the delivery with given id" do
      delivery = delivery_fixture()
      assert Deliveries.get_delivery!(delivery.id) == delivery
    end

    test "create_delivery/1 with valid data creates a delivery" do
      valid_attrs = %{
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

      assert {:ok, %Delivery{} = delivery} = Deliveries.create_delivery(valid_attrs)
      assert delivery.customer_name == "some customer_name"
      assert delivery.customer_phone == "some customer_phone"
      assert delivery.description == "some description"
      assert delivery.from == "some from"
      assert delivery.lats == "some lats"
      assert delivery.long == "some long"
      assert delivery.price == "some price"
      assert delivery.status == "some status"
      assert delivery.to == "some to"
    end

    test "create_delivery/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Deliveries.create_delivery(@invalid_attrs)
    end

    test "update_delivery/2 with valid data updates the delivery" do
      delivery = delivery_fixture()

      update_attrs = %{
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

      assert {:ok, %Delivery{} = delivery} = Deliveries.update_delivery(delivery, update_attrs)
      assert delivery.customer_name == "some updated customer_name"
      assert delivery.customer_phone == "some updated customer_phone"
      assert delivery.description == "some updated description"
      assert delivery.from == "some updated from"
      assert delivery.lats == "some updated lats"
      assert delivery.long == "some updated long"
      assert delivery.price == "some updated price"
      assert delivery.status == "some updated status"
      assert delivery.to == "some updated to"
    end

    test "update_delivery/2 with invalid data returns error changeset" do
      delivery = delivery_fixture()
      assert {:error, %Ecto.Changeset{}} = Deliveries.update_delivery(delivery, @invalid_attrs)
      assert delivery == Deliveries.get_delivery!(delivery.id)
    end

    test "delete_delivery/1 deletes the delivery" do
      delivery = delivery_fixture()
      assert {:ok, %Delivery{}} = Deliveries.delete_delivery(delivery)
      assert_raise Ecto.NoResultsError, fn -> Deliveries.get_delivery!(delivery.id) end
    end

    test "change_delivery/1 returns a delivery changeset" do
      delivery = delivery_fixture()
      assert %Ecto.Changeset{} = Deliveries.change_delivery(delivery)
    end
  end
end
