defmodule Mix.Tasks.Start do
  use Mix.Task

  alias DungeonCrawl.Cli.Main

  def run(_) do
    Main.start_game()
  end
end
