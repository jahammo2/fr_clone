defmodule FrClone.Repo.Migrations.CreateCostingRequestLineItems do
  use Ecto.Migration

  def change do
    create table(:costing_request_line_items) do
      add :notes, :text
      add :units, :string
      add :costing_request_id, references(:costing_requests, on_delete: :nothing)

      timestamps()
    end

    create index(:costing_request_line_items, [:costing_request_id])
  end
end
