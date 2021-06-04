defmodule FrClone.CostingRequestsTest do
  use FrClone.DataCase

  alias FrClone.CostingRequests

  describe "costing_requests" do
    alias FrClone.CostingRequests.CostingRequest

    @valid_attrs %{box_file_location: "some box_file_location", opportunity_id: "some opportunity_id"}
    @update_attrs %{box_file_location: "some updated box_file_location", opportunity_id: "some updated opportunity_id"}
    @invalid_attrs %{box_file_location: nil, opportunity_id: nil}

    def costing_request_fixture(attrs \\ %{}) do
      {:ok, costing_request} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CostingRequests.create_costing_request()

      costing_request
    end

    test "list_costing_requests/0 returns all costing_requests" do
      costing_request = costing_request_fixture()
      assert CostingRequests.list_costing_requests() == [costing_request]
    end

    test "get_costing_request!/1 returns the costing_request with given id" do
      costing_request = costing_request_fixture()
      assert CostingRequests.get_costing_request!(costing_request.id) == costing_request
    end

    test "create_costing_request/1 with valid data creates a costing_request" do
      assert {:ok, %CostingRequest{} = costing_request} = CostingRequests.create_costing_request(@valid_attrs)
      assert costing_request.box_file_location == "some box_file_location"
      assert costing_request.opportunity_id == "some opportunity_id"
    end

    test "create_costing_request/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CostingRequests.create_costing_request(@invalid_attrs)
    end

    test "update_costing_request/2 with valid data updates the costing_request" do
      costing_request = costing_request_fixture()
      assert {:ok, %CostingRequest{} = costing_request} = CostingRequests.update_costing_request(costing_request, @update_attrs)
      assert costing_request.box_file_location == "some updated box_file_location"
      assert costing_request.opportunity_id == "some updated opportunity_id"
    end

    test "update_costing_request/2 with invalid data returns error changeset" do
      costing_request = costing_request_fixture()
      assert {:error, %Ecto.Changeset{}} = CostingRequests.update_costing_request(costing_request, @invalid_attrs)
      assert costing_request == CostingRequests.get_costing_request!(costing_request.id)
    end

    test "delete_costing_request/1 deletes the costing_request" do
      costing_request = costing_request_fixture()
      assert {:ok, %CostingRequest{}} = CostingRequests.delete_costing_request(costing_request)
      assert_raise Ecto.NoResultsError, fn -> CostingRequests.get_costing_request!(costing_request.id) end
    end

    test "change_costing_request/1 returns a costing_request changeset" do
      costing_request = costing_request_fixture()
      assert %Ecto.Changeset{} = CostingRequests.change_costing_request(costing_request)
    end
  end
end
