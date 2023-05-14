defmodule AvProject.InventoryTest do
  use AvProject.DataCase

  alias AvProject.Inventory

  describe "inventory_log_items" do
    alias AvProject.Inventory.InventoryLogItem

    import AvProject.InventoryFixtures

    @invalid_attrs %{purchase_price: nil, quantity: nil}

    test "list_inventory_log_items/0 returns all inventory_log_items" do
      inventory_log_item = inventory_log_item_fixture()
      assert Inventory.list_inventory_log_items() == [inventory_log_item]
    end

    test "get_inventory_log_item!/1 returns the inventory_log_item with given id" do
      inventory_log_item = inventory_log_item_fixture()
      assert Inventory.get_inventory_log_item!(inventory_log_item.id) == inventory_log_item
    end

    test "create_inventory_log_item/1 with valid data creates a inventory_log_item" do
      valid_attrs = %{purchase_price: 120.5, quantity: 42}

      assert {:ok, %InventoryLogItem{} = inventory_log_item} = Inventory.create_inventory_log_item(valid_attrs)
      assert inventory_log_item.purchase_price == 120.5
      assert inventory_log_item.quantity == 42
    end

    test "create_inventory_log_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_inventory_log_item(@invalid_attrs)
    end

    test "update_inventory_log_item/2 with valid data updates the inventory_log_item" do
      inventory_log_item = inventory_log_item_fixture()
      update_attrs = %{purchase_price: 456.7, quantity: 43}

      assert {:ok, %InventoryLogItem{} = inventory_log_item} = Inventory.update_inventory_log_item(inventory_log_item, update_attrs)
      assert inventory_log_item.purchase_price == 456.7
      assert inventory_log_item.quantity == 43
    end

    test "update_inventory_log_item/2 with invalid data returns error changeset" do
      inventory_log_item = inventory_log_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_inventory_log_item(inventory_log_item, @invalid_attrs)
      assert inventory_log_item == Inventory.get_inventory_log_item!(inventory_log_item.id)
    end

    test "delete_inventory_log_item/1 deletes the inventory_log_item" do
      inventory_log_item = inventory_log_item_fixture()
      assert {:ok, %InventoryLogItem{}} = Inventory.delete_inventory_log_item(inventory_log_item)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_inventory_log_item!(inventory_log_item.id) end
    end

    test "change_inventory_log_item/1 returns a inventory_log_item changeset" do
      inventory_log_item = inventory_log_item_fixture()
      assert %Ecto.Changeset{} = Inventory.change_inventory_log_item(inventory_log_item)
    end
  end

  describe "inventory_logs" do
    alias AvProject.Inventory.InventoryLog

    import AvProject.InventoryFixtures

    @invalid_attrs %{}

    test "list_inventory_logs/0 returns all inventory_logs" do
      inventory_log = inventory_log_fixture()
      assert Inventory.list_inventory_logs() == [inventory_log]
    end

    test "get_inventory_log!/1 returns the inventory_log with given id" do
      inventory_log = inventory_log_fixture()
      assert Inventory.get_inventory_log!(inventory_log.id) == inventory_log
    end

    test "create_inventory_log/1 with valid data creates a inventory_log" do
      valid_attrs = %{}

      assert {:ok, %InventoryLog{} = inventory_log} = Inventory.create_inventory_log(valid_attrs)
    end

    test "create_inventory_log/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_inventory_log(@invalid_attrs)
    end

    test "update_inventory_log/2 with valid data updates the inventory_log" do
      inventory_log = inventory_log_fixture()
      update_attrs = %{}

      assert {:ok, %InventoryLog{} = inventory_log} = Inventory.update_inventory_log(inventory_log, update_attrs)
    end

    test "update_inventory_log/2 with invalid data returns error changeset" do
      inventory_log = inventory_log_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_inventory_log(inventory_log, @invalid_attrs)
      assert inventory_log == Inventory.get_inventory_log!(inventory_log.id)
    end

    test "delete_inventory_log/1 deletes the inventory_log" do
      inventory_log = inventory_log_fixture()
      assert {:ok, %InventoryLog{}} = Inventory.delete_inventory_log(inventory_log)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_inventory_log!(inventory_log.id) end
    end

    test "change_inventory_log/1 returns a inventory_log changeset" do
      inventory_log = inventory_log_fixture()
      assert %Ecto.Changeset{} = Inventory.change_inventory_log(inventory_log)
    end
  end
end
