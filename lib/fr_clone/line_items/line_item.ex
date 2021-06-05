defmodule FrClone.LineItems.LineItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "line_items" do
    field :notes, :string

    timestamps()
  end

  @doc false
  def changeset(line_item, attrs) do
    line_item
    |> cast(attrs, [:notes])
    |> validate_required([:notes])
  end
end
