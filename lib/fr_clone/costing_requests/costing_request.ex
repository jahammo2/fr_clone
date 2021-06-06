defmodule FrClone.CostingRequests.CostingRequest do
  use Ecto.Schema
  import Ecto.Changeset

  alias FrClone.CostingRequestLineItems.CostingRequestLineItem

  schema "costing_requests" do
    field :box_file_location, :string
    field :opportunity_id, :string

    has_many :costing_request_line_items, CostingRequestLineItem

    timestamps()
  end

  @doc false
  def changeset(costing_request, attrs) do
    costing_request
    |> cast(attrs, [:box_file_location, :opportunity_id])
    |> validate_required([:box_file_location, :opportunity_id])
  end
end
