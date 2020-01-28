defmodule DungeonCrawl.Character do
  defstruct name: nil,
            description: nil,
            hit_point: 0,
            max_hit_points: 0,
            damage_range: nil,
            attack_description: nil

  defimpl String.Chars do
    def to_string(character), do: character.name
  end
end
