defmodule FrClone.LineItemsTest do
  use FrClone.DataCase

  alias FrClone.LineItems

  describe "line_items" do
    alias FrClone.LineItems.LineItem

    @valid_attrs %{notes: "some notes"}
    @update_attrs %{notes: "some updated notes"}
    @invalid_attrs %{notes: nil}

    def line_item_fixture(attrs \\ %{}) do
      {:ok, line_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> LineItems.create_line_item()

      line_item
    end

    test "list_line_items/0 returns all line_items" do
      line_item = line_item_fixture()
      assert LineItems.list_line_items() == [line_item]
    end

    test "get_line_item!/1 returns the line_item with given id" do
      line_item = line_item_fixture()
      assert LineItems.get_line_item!(line_item.id) == line_item
    end

    test "create_line_item/1 with valid data creates a line_item" do
      assert {:ok, %LineItem{} = line_item} = LineItems.create_line_item(@valid_attrs)
      assert line_item.notes == "some notes"
    end

    test "create_line_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LineItems.create_line_item(@invalid_attrs)
    end

    test "update_line_item/2 with valid data updates the line_item" do
      line_item = line_item_fixture()
      assert {:ok, %LineItem{} = line_item} = LineItems.update_line_item(line_item, @update_attrs)
      assert line_item.notes == "some updated notes"
    end

    test "update_line_item/2 with invalid data returns error changeset" do
      line_item = line_item_fixture()
      assert {:error, %Ecto.Changeset{}} = LineItems.update_line_item(line_item, @invalid_attrs)
      assert line_item == LineItems.get_line_item!(line_item.id)
    end

    test "delete_line_item/1 deletes the line_item" do
      line_item = line_item_fixture()
      assert {:ok, %LineItem{}} = LineItems.delete_line_item(line_item)
      assert_raise Ecto.NoResultsError, fn -> LineItems.get_line_item!(line_item.id) end
    end

    test "change_line_item/1 returns a line_item changeset" do
      line_item = line_item_fixture()
      assert %Ecto.Changeset{} = LineItems.change_line_item(line_item)
    end
  end
end
