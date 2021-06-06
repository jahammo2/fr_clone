defmodule FrClone.CostingRequestLineItemsTest do
  use FrClone.DataCase

  alias FrClone.CostingRequestLineItems

  describe "costing_request_line_items" do
    alias FrClone.CostingRequestLineItems.CostingRequestLineItem

    @valid_attrs %{notes: "some notes", units: "some units"}
    @update_attrs %{notes: "some updated notes", units: "some updated units"}
    @invalid_attrs %{notes: nil, units: nil}

    def costing_request_line_item_fixture(attrs \\ %{}) do
      {:ok, costing_request_line_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CostingRequestLineItems.create_costing_request_line_item()

      costing_request_line_item
    end

    test "list_costing_request_line_items/0 returns all costing_request_line_items" do
      costing_request_line_item = costing_request_line_item_fixture()

      assert CostingRequestLineItems.list_costing_request_line_items() == [
               costing_request_line_item
             ]
    end

    test "get_costing_request_line_item!/1 returns the costing_request_line_item with given id" do
      costing_request_line_item = costing_request_line_item_fixture()

      assert CostingRequestLineItems.get_costing_request_line_item!(costing_request_line_item.id) ==
               costing_request_line_item
    end

    test "create_costing_request_line_item/1 with valid data creates a costing_request_line_item" do
      assert {:ok, %CostingRequestLineItem{} = costing_request_line_item} =
               CostingRequestLineItems.create_costing_request_line_item(@valid_attrs)

      assert costing_request_line_item.notes == "some notes"
      assert costing_request_line_item.units == "some units"
    end

    test "create_costing_request_line_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               CostingRequestLineItems.create_costing_request_line_item(@invalid_attrs)
    end

    test "update_costing_request_line_item/2 with valid data updates the costing_request_line_item" do
      costing_request_line_item = costing_request_line_item_fixture()

      assert {:ok, %CostingRequestLineItem{} = costing_request_line_item} =
               CostingRequestLineItems.update_costing_request_line_item(
                 costing_request_line_item,
                 @update_attrs
               )

      assert costing_request_line_item.notes == "some updated notes"
      assert costing_request_line_item.units == "some updated units"
    end

    test "update_costing_request_line_item/2 with invalid data returns error changeset" do
      costing_request_line_item = costing_request_line_item_fixture()

      assert {:error, %Ecto.Changeset{}} =
               CostingRequestLineItems.update_costing_request_line_item(
                 costing_request_line_item,
                 @invalid_attrs
               )

      assert costing_request_line_item ==
               CostingRequestLineItems.get_costing_request_line_item!(
                 costing_request_line_item.id
               )
    end

    test "delete_costing_request_line_item/1 deletes the costing_request_line_item" do
      costing_request_line_item = costing_request_line_item_fixture()

      assert {:ok, %CostingRequestLineItem{}} =
               CostingRequestLineItems.delete_costing_request_line_item(costing_request_line_item)

      assert_raise Ecto.NoResultsError, fn ->
        CostingRequestLineItems.get_costing_request_line_item!(costing_request_line_item.id)
      end
    end

    test "change_costing_request_line_item/1 returns a costing_request_line_item changeset" do
      costing_request_line_item = costing_request_line_item_fixture()

      assert %Ecto.Changeset{} =
               CostingRequestLineItems.change_costing_request_line_item(costing_request_line_item)
    end
  end
end
