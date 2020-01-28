defmodule DungeonCrawl.Cli.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  @doc """
  Displays the available options in format 'index - option'.
  """
  @spec display_options(list()) :: list()
  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option}")
    end)

    options
  end

  @doc """
  Generates a question to choose between the provided options.
  'Which one? [option1, option2, ..]'
  """
  @spec generate_question(list()) :: String.t()
  def generate_question(options) do
    options = Enum.join(1..Enum.count(options), ", ")
    "Which one? [#{options}]\n"
  end

  @doc """
  Parses the option input from the user and returns it as integer.
  """
  @spec parse_answer(String.t()) :: non_neg_integer
  def parse_answer(answer) do
    {option, _} = Integer.parse(answer)
    option - 1
  end
end
