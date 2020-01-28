defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room.Action
  alias DungeonCrawl.Room.Triggers

  @type t :: %__MODULE__{
          description: String.t(),
          actions: list(Action.t()),
          trigger: Triggers.Exit
        }

  defstruct description: nil,
            actions: [],
            trigger: nil

  def all() do
    [
      %__MODULE__{
        description: "You can see the light of day. You found the exit!",
        actions: [Action.forward()],
        trigger: Triggers.Exit
      },
      %__MODULE__{
        description: "You can see an enemy blocking your path.",
        actions: [Action.forward()],
        trigger: Triggers.Enemy
      }
    ]
  end
end
