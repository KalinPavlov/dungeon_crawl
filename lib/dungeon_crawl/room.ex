defmodule DungeonCrawl.Room do
  alias __MODULE__
  alias DungeonCrawl.Room.Action

  defstruct description: nil,
            actions: []

  def all() do
    [
      %Room{
        description: "You found a quiet place. Looks safe for a little nap.",
        actions: [Action.forward(), Action.rest()]
      }
    ]
  end
end
