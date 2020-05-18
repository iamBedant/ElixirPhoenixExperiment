defmodule WhatsUp.DirectoryTest do
  use WhatsUp.DataCase

  alias WhatsUp.Directory

  describe "tasks" do
    alias WhatsUp.Directory.Task

    @valid_attrs %{creator_id: 42, name: "some name", upvote_count: 42}
    @update_attrs %{creator_id: 43, name: "some updated name", upvote_count: 43}
    @invalid_attrs %{creator_id: nil, name: nil, upvote_count: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Directory.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Directory.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Directory.create_task(@valid_attrs)
      assert task.creator_id == 42
      assert task.name == "some name"
      assert task.upvote_count == 42
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = Directory.update_task(task, @update_attrs)
      assert task.creator_id == 43
      assert task.name == "some updated name"
      assert task.upvote_count == 43
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_task(task, @invalid_attrs)
      assert task == Directory.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Directory.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Directory.change_task(task)
    end
  end
end
