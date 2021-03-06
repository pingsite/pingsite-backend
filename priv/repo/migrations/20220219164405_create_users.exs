defmodule PingSite.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :email, :string, null: false
      add :password_hash, :string
      add :display_name, :string, null: true

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
