defmodule FrCloneWeb.CostingRequestController do
  use FrCloneWeb, :controller

  alias FrClone.CostingRequests
  alias FrClone.CostingRequests.CostingRequest

  def index(conn, _params) do
    costing_requests = CostingRequests.list_costing_requests()
    render(conn, "index.html", costing_requests: costing_requests)
  end

  def new(conn, _params) do
    changeset = CostingRequests.change_costing_request(%CostingRequest{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"costing_request" => costing_request_params}) do
    case CostingRequests.create_costing_request(costing_request_params) do
      {:ok, costing_request} ->
        conn
        |> put_flash(:info, "Costing request created successfully.")
        |> redirect(to: Routes.costing_request_path(conn, :show, costing_request))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    costing_request = CostingRequests.get_costing_request!(id)
    render(conn, "show.html", costing_request: costing_request)
  end

  def edit(conn, %{"id" => id}) do
    costing_request = CostingRequests.get_costing_request!(id)
    changeset = CostingRequests.change_costing_request(costing_request)
    render(conn, "edit.html", costing_request: costing_request, changeset: changeset)
  end

  def update(conn, %{"id" => id, "costing_request" => costing_request_params}) do
    costing_request = CostingRequests.get_costing_request!(id)

    case CostingRequests.update_costing_request(costing_request, costing_request_params) do
      {:ok, costing_request} ->
        conn
        |> put_flash(:info, "Costing request updated successfully.")
        |> redirect(to: Routes.costing_request_path(conn, :show, costing_request))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", costing_request: costing_request, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    costing_request = CostingRequests.get_costing_request!(id)
    {:ok, _costing_request} = CostingRequests.delete_costing_request(costing_request)

    conn
    |> put_flash(:info, "Costing request deleted successfully.")
    |> redirect(to: Routes.costing_request_path(conn, :index))
  end
end
