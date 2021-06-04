defmodule FrClone.CostingRequests do
  @moduledoc """
  The CostingRequests context.
  """

  import Ecto.Query, warn: false
  alias FrClone.Repo

  alias FrClone.CostingRequests.CostingRequest

  @doc """
  Returns the list of costing_requests.

  ## Examples

      iex> list_costing_requests()
      [%CostingRequest{}, ...]

  """
  def list_costing_requests do
    Repo.all(CostingRequest)
  end

  @doc """
  Gets a single costing_request.

  Raises `Ecto.NoResultsError` if the Costing request does not exist.

  ## Examples

      iex> get_costing_request!(123)
      %CostingRequest{}

      iex> get_costing_request!(456)
      ** (Ecto.NoResultsError)

  """
  def get_costing_request!(id), do: Repo.get!(CostingRequest, id)

  @doc """
  Creates a costing_request.

  ## Examples

      iex> create_costing_request(%{field: value})
      {:ok, %CostingRequest{}}

      iex> create_costing_request(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_costing_request(attrs \\ %{}) do
    %CostingRequest{}
    |> CostingRequest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a costing_request.

  ## Examples

      iex> update_costing_request(costing_request, %{field: new_value})
      {:ok, %CostingRequest{}}

      iex> update_costing_request(costing_request, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_costing_request(%CostingRequest{} = costing_request, attrs) do
    costing_request
    |> CostingRequest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a costing_request.

  ## Examples

      iex> delete_costing_request(costing_request)
      {:ok, %CostingRequest{}}

      iex> delete_costing_request(costing_request)
      {:error, %Ecto.Changeset{}}

  """
  def delete_costing_request(%CostingRequest{} = costing_request) do
    Repo.delete(costing_request)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking costing_request changes.

  ## Examples

      iex> change_costing_request(costing_request)
      %Ecto.Changeset{data: %CostingRequest{}}

  """
  def change_costing_request(%CostingRequest{} = costing_request, attrs \\ %{}) do
    CostingRequest.changeset(costing_request, attrs)
  end
end