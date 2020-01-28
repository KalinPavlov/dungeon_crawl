defmodule DungeonCrawl.Cli.RoomActionsChoice do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Cli.BaseCommands

  def start(room) do
    room_actions = room.actions
    find_action_by_index = &Enum.at(room_actions, &1)

    Shell.info(room.description)

    chosen_action =
      room_actions
      |> BaseCommands.display_options()
      |> BaseCommands.generate_question()
      |> Shell.prompt()
      |> BaseCommands.parse_answer()
      |> find_action_by_index.()

    {room, chosen_action}
  end
end
