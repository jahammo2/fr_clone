defmodule FrCloneWeb.Api.CostingRequestControllerTest do
  use FrCloneWeb.ConnCase

  alias FrClone.CostingRequests

  @valid_crli_attrs %{
    notes: "some notes",
    units: "mm",
  }
  @create_attrs %{
    box_file_location: "some box_file_location",
    opportunity_id: "some opportunity_id",
    line_items: [@valid_crli_attrs],
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
    test "returns all costing_requests", %{conn: conn} do
      [%{costing_request: %{id: id}} | _] = 0..3 |> Enum.map(fn _ -> create_costing_request() end)

      conn = get(conn, Routes.costing_request_path(conn, :index))

      %{"costing_requests" => costing_requests} = json_response(conn, 200)
      [%{"id" => ^id} | _] = costing_requests

      assert length(costing_requests) == 4
    end
  end

  describe "create costing_request" do
    test "returns the CR and its line items if it is valid", %{conn: conn} do
      conn =
        post(conn, Routes.costing_request_path(conn, :create), costing_request: @create_attrs)

      # TODO: elixir this up
      assert %{"id" => id, "line_items" => line_items} = json_response(conn, 200)
      refute is_nil(id)
      assert length(line_items) > 0
      refute is_nil(Enum.at(line_items, 0)["id"])
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.costing_request_path(conn, :create), costing_request: @invalid_attrs)

      assert json_response(conn, 422) == %{
               "data" => %{
                 "code" => "validation_error",
                 "errors" => %{
                   "box_file_location" => ["can't be blank"],
                   "opportunity_id" => ["can't be blank"]
                 }
               }
             }
    end

    # test "renders errors when data is valid but it is missing a line item", %{conn: conn} do
    #   attrs = %{
    #     box_file_location: "some box_file_location",
    #     opportunity_id: "some opportunity_id"
    #   }
    #
    #   conn =
    #     post(conn, Routes.costing_request_path(conn, :create), costing_request: attrs)
    #
    #   assert json_response(conn, 422) == %{
    #            "data" => %{
    #              "code" => "validation_error",
    #              "errors" => %{
    #                "box_file_location" => ["can't be blank"],
    #                "opportunity_id" => ["can't be blank"]
    #              }
    #            }
    #          }
    # end
    # test "when units are not correct"
  end

  describe "update costing_request" do
    setup [:create_costing_request]

    @tag :skip
    test "redirects when data is valid", %{conn: conn, costing_request: costing_request} do
      conn =
        put(conn, Routes.costing_request_path(conn, :update, costing_request),
          costing_request: @update_attrs
        )

      assert redirected_to(conn) == Routes.costing_request_path(conn, :show, costing_request)

      conn = get(conn, Routes.costing_request_path(conn, :show, costing_request))
      assert html_response(conn, 200) =~ "some updated box_file_location"
    end

    @tag :skip
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

    @tag :skip
    test "deletes chosen costing_request", %{conn: conn, costing_request: costing_request} do
      conn = delete(conn, Routes.costing_request_path(conn, :delete, costing_request))
      assert redirected_to(conn) == Routes.costing_request_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.costing_request_path(conn, :show, costing_request))
      end
    end
  end

  defp create_costing_request() do
    costing_request = fixture(:costing_request)
    %{costing_request: costing_request}
  end

  defp create_costing_request(_), do: create_costing_request()
end
