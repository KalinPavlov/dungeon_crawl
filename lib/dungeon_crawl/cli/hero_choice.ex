defmodule DungeonCrawl.Cli.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Heroes
  alias DungeonCrawl.Cli.BaseCommands
  alias DungeonCrawl.Utils.ShellUtils

  def start() do
    Shell.cmd("clear")
    Shell.info("Start by choosing your hero:")

    heroes = Heroes.all_heroes()

    find_hero_by_index = &Enum.at(heroes, &1)

    heroes
    |> BaseCommands.display_options()
    |> BaseCommands.generate_question()
    |> Shell.prompt()
    |> BaseCommands.parse_answer()
    |> find_hero_by_index.()
    |> confirm_hero()
  end

  defp confirm_hero(chosen_hero) do
    ShellUtils.clear_cmd()
    Shell.info(chosen_hero.description)
    if Shell.yes?("Confirm?"), do: chosen_hero, else: start()
  end
end
