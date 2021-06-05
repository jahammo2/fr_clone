defmodule FrClone.CostingRequestLineItems.CostingRequestLineItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "costing_request_line_items" do
    field :notes, :string
    field :units, Ecto.Enum, values: [:in, :mm]
    field :costing_request_id, :id

    # belongs_to(:costing_request, CostingRequest)

    timestamps()
  end

  @doc false
  def changeset(costing_request_line_item, attrs) do
    costing_request_line_item
    |> cast(attrs, [:notes, :units])
    |> validate_required([:notes, :units])
  end
end
