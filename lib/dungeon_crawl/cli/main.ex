defmodule DungeonCrawl.Cli.Main do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Cli.HeroChoice
  alias DungeonCrawl.Room
  alias DungeonCrawl.Utils.ShellUtils
  alias DungeonCrawl.Cli.RoomActionsChoice

  def start_game() do
    welcome_message()
    Shell.prompt("Press Enter to continue.")
    hero_choice()
    crawl(Room.all())
  end

  defp welcome_message() do
    Shell.info("=== Dungeon Crawl ===")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("You need to survive and find the exit.")
  end

  defp hero_choice() do
    HeroChoice.start()
  end

  defp crawl(rooms) do
    Shell.info("You keep moving to the next room.")
    Shell.prompt("Press Enter to continue.")
    ShellUtils.clear_cmd()

    rooms
    |> Enum.random()
    |> RoomActionsChoice.start()
  end
end
