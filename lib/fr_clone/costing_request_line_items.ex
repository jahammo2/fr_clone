defmodule FrClone.CostingRequestLineItems do
  @moduledoc """
  The CostingRequestLineItems context.
  """

  import Ecto.Query, warn: false
  alias FrClone.Repo

  alias FrClone.CostingRequestLineItems.CostingRequestLineItem

  @doc """
  Returns the list of costing_request_line_items.

  ## Examples

      iex> list_costing_request_line_items()
      [%CostingRequestLineItem{}, ...]

  """
  def list_costing_request_line_items do
    Repo.all(CostingRequestLineItem)
  end

  @doc """
  Gets a single costing_request_line_item.

  Raises `Ecto.NoResultsError` if the Costing request line item does not exist.

  ## Examples

      iex> get_costing_request_line_item!(123)
      %CostingRequestLineItem{}

      iex> get_costing_request_line_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_costing_request_line_item!(id), do: Repo.get!(CostingRequestLineItem, id)

  @doc """
  Creates a costing_request_line_item.

  ## Examples

      iex> create_costing_request_line_item(%{field: value})
      {:ok, %CostingRequestLineItem{}}

      iex> create_costing_request_line_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_costing_request_line_item(attrs \\ %{}) do
    %CostingRequestLineItem{}
    |> CostingRequestLineItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a costing_request_line_item.

  ## Examples

      iex> update_costing_request_line_item(costing_request_line_item, %{field: new_value})
      {:ok, %CostingRequestLineItem{}}

      iex> update_costing_request_line_item(costing_request_line_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_costing_request_line_item(
        %CostingRequestLineItem{} = costing_request_line_item,
        attrs
      ) do
    costing_request_line_item
    |> CostingRequestLineItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a costing_request_line_item.

  ## Examples

      iex> delete_costing_request_line_item(costing_request_line_item)
      {:ok, %CostingRequestLineItem{}}

      iex> delete_costing_request_line_item(costing_request_line_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_costing_request_line_item(%CostingRequestLineItem{} = costing_request_line_item) do
    Repo.delete(costing_request_line_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking costing_request_line_item changes.

  ## Examples

      iex> change_costing_request_line_item(costing_request_line_item)
      %Ecto.Changeset{data: %CostingRequestLineItem{}}

  """
  def change_costing_request_line_item(
        %CostingRequestLineItem{} = costing_request_line_item,
        attrs \\ %{}
      ) do
    CostingRequestLineItem.changeset(costing_request_line_item, attrs)
  end
end
