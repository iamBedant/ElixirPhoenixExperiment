defmodule WhatsUp.Directory.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :creator_id, :integer
    field :name, :string
    field :upvote_count, :integer

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :upvote_count, :creator_id])
    |> validate_required([:name, :upvote_count, :creator_id])
  end
end
