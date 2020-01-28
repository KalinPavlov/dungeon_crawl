defmodule DungeonCrawl.Heroes do
  alias DungeonCrawl.Character

  def all_heroes() do
    [
      %Character{
        name: "Knight",
        description: "Knight has strong defence and consistent damage.",
        hit_point: 18,
        max_hit_points: 18,
        damage_range: 4..5,
        attack_description: "a sword"
      },
      %Character{
        name: "Wizard",
        description: "Wizard has strong attack but low health.",
        hit_point: 8,
        max_hit_points: 8,
        damage_range: 6..10,
        attack_description: "a fireball"
      },
      %Character{
        name: "Rogue",
        description: "Rogue has hitgh variability in attack damage.",
        hit_point: 12,
        max_hit_points: 12,
        damage_range: 1..12,
        attack_description: "a dagger"
      }
    ]
  end
end