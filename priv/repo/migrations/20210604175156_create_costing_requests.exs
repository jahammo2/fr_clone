defmodule FrClone.Repo.Migrations.CreateCostingRequests do
  use Ecto.Migration

  def change do
    create table(:costing_requests) do
      add :box_file_location, :string
      add :opportunity_id, :string

      timestamps()
    end
  end
end
