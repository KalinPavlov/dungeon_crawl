defmodule DungeonCrawl.Utils.ShellUtils do
  alias Mix.Shell.IO, as: Shell

  def clear_cmd() do
    {os_family, _os_name} = :os.type()
    clear_cmd(os_family)
  end

  defp clear_cmd(:unix), do: Shell.cmd("clear")
  defp clear_cmd(:win32), do: Shell.cmd("cls")
end
