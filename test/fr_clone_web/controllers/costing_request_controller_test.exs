defmodule FrCloneWeb.CostingRequestControllerTest do
  use FrCloneWeb.ConnCase

  alias FrClone.CostingRequests

  @create_attrs %{
    box_file_location: "some box_file_location",
    opportunity_id: "some opportunity_id"
  }
  @update_attrs %{
    box_file_location: "some updated box_file_location",
    opportunity_id: "some updated opportunity_id"
  }
  @invalid_attrs %{box_file_location: nil, opportunity_id: nil}

  def fixture(:costing_request) do
    {:ok, costing_request} = CostingRequests.create_costing_request(@create_attrs)
    costing_request
  end

  describe "index" do
    test "lists all costing_requests", %{conn: conn} do
      conn = get(conn, Routes.costing_request_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Costing requests"
    end
  end

  describe "new costing_request" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.costing_request_path(conn, :new))
      assert html_response(conn, 200) =~ "New Costing request"
    end
  end

  describe "create costing_request" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.costing_request_path(conn, :create), costing_request: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.costing_request_path(conn, :show, id)

      conn = get(conn, Routes.costing_request_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Costing request"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.costing_request_path(conn, :create), costing_request: @invalid_attrs)

      assert html_response(conn, 200) =~ "New Costing request"
    end
  end

  describe "edit costing_request" do
    setup [:create_costing_request]

    test "renders form for editing chosen costing_request", %{
      conn: conn,
      costing_request: costing_request
    } do
      conn = get(conn, Routes.costing_request_path(conn, :edit, costing_request))
      assert html_response(conn, 200) =~ "Edit Costing request"
    end
  end

  describe "update costing_request" do
    setup [:create_costing_request]

    test "redirects when data is valid", %{conn: conn, costing_request: costing_request} do
      conn =
        put(conn, Routes.costing_request_path(conn, :update, costing_request),
          costing_request: @update_attrs
        )

      assert redirected_to(conn) == Routes.costing_request_path(conn, :show, costing_request)

      conn = get(conn, Routes.costing_request_path(conn, :show, costing_request))
      assert html_response(conn, 200) =~ "some updated box_file_location"
    end

    test "renders errors when data is invalid", %{conn: conn, costing_request: costing_request} do
      conn =
        put(conn, Routes.costing_request_path(conn, :update, costing_request),
          costing_request: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Costing request"
    end
  end

  describe "delete costing_request" do
    setup [:create_costing_request]

    test "deletes chosen costing_request", %{conn: conn, costing_request: costing_request} do
      conn = delete(conn, Routes.costing_request_path(conn, :delete, costing_request))
      assert redirected_to(conn) == Routes.costing_request_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.costing_request_path(conn, :show, costing_request))
      end
    end
  end

  defp create_costing_request(_) do
    costing_request = fixture(:costing_request)
    %{costing_request: costing_request}
  end
end
