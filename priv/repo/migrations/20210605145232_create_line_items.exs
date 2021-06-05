defmodule FrClone.Repo.Migrations.CreateLineItems do
  use Ecto.Migration

  def change do
    create table(:line_items) do
      add :notes, :text

      timestamps()
    end

  end
end
