defmodule WhatsUp.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :upvote_count, :integer
      add :creator_id, :integer

      timestamps()
    end

  end
end
