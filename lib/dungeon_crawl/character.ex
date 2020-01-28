defmodule DungeonCrawl.Character do
  @type t :: %__MODULE__{
          name: String.t(),
          description: String.t(),
          hit_points: non_neg_integer,
          max_hit_points: non_neg_integer,
          damage_range: Range.t(),
          attack_description: String.t()
        }

  defstruct name: nil,
            description: nil,
            hit_points: 0,
            max_hit_points: 0,
            damage_range: nil,
            attack_description: nil

  defimpl String.Chars do
    def to_string(character), do: character.name
  end

  def take_damage(character, damage) do
    new_hit_points = max(0, character.hit_points - damage)
    %__MODULE__{character | hit_points: new_hit_points}
  end

  def heal(character, healing_value) do
    new_hit_points = min(character.hit_points + healing_value, character.max_hit_points)
    %__MODULE__{character | hit_points: new_hit_points}
  end

  def current_stats(character) do
    "Player Stats\nHP: #{character.hit_points}/#{character.max_hit_points}"
  end
end
