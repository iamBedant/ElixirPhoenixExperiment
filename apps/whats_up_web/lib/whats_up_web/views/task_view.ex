defmodule WhatsUpWeb.TaskView do
  use WhatsUpWeb, :view
  alias WhatsUpWeb.TaskView

  def render("index.json", %{tasks: tasks}) do
    %{data: render_many(tasks, TaskView, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{data: render_one(task, TaskView, "task.json")}
  end

  def render("task.json", %{task: task}) do
    %{id: task.id,
      name: task.name,
      upvote_count: task.upvote_count,
      creator_id: task.creator_id}
  end
end
