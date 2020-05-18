# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     WhatsUp.Repo.insert!(%WhatsUp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias WhatsUp.Repo
alias WhatsUp.Directory.Task

Repo.insert! %Task{name: "Watching The office UK version", upvote_count: 2, creator_id: 1}
Repo.insert! %Task{name: "Listining to TS", upvote_count: 3, creator_id: 2}
Repo.insert! %Task{name: "Cooking some pasta", upvote_count: 5, creator_id: 1}
Repo.insert! %Task{name: "Playing online games", upvote_count: 4, creator_id: 3}