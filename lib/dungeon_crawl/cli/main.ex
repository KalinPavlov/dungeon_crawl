defmodule DungeonCrawl.Cli.Main do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Cli.HeroChoice
  alias DungeonCrawl.Room
  alias DungeonCrawl.Utils.ShellUtils
  alias DungeonCrawl.Cli.RoomActionsChoice
  alias DungeonCrawl.Character

  def start_game() do
    welcome_message()
    Shell.prompt("Press Enter to continue.")

    crawl(hero_choice(), Room.all())
  end

  defp welcome_message() do
    Shell.info("=== Dungeon Crawl ===")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("You need to survive and find the exit.")
  end

  defp hero_choice() do
    hero = HeroChoice.start()
    %Character{hero | name: "You"}
  end

  defp crawl(%Character{hit_points: 0}, _) do
    Shell.prompt("")
    ShellUtils.clear_cmd()
    Shell.info("Unfortuantely your wounds are too many to keep walking.")
    Shell.info("You fall onto the floor without strength to carry on.")
    Shell.info("GAME OVER")
    Shell.prompt("")
  end

  defp crawl(character, rooms) do
    Shell.info("You keep moving to the next room.")
    Shell.prompt("Press Enter to continue.")
    ShellUtils.clear_cmd()

    rooms
    |> Enum.random()
    |> RoomActionsChoice.start()
    |> trigger_action(character)
    |> handle_action_result()
  end

  defp trigger_action({room, action}, character) do
    ShellUtils.clear_cmd()
    room.trigger.run(character, action)
  end

  defp handle_action_result({_, :exit}) do
    Shell.info("You found the exit. You won the game. Congratulations!")
  end

  defp handle_action_result({character, _}) do
    crawl(character, Room.all())
  end
end
