defmodule ScripthungryPhoenixWeb.Plugs.CopyrightDate do
  @moduledoc """
  A plug that adds a copyright date to the assigns.
  """
  import Plug.Conn

  def init(default), do: default

  def call(conn, start_year) do
    # Calculate copyright date, either current year or range of years starting
    # with the year the project was created, 2022.
    current_year = DateTime.utc_now() |> Map.fetch!(:year)

    if current_year > start_year do
      assign(conn, :copyright_date, "#{start_year}-#{current_year}")
    else
      assign(conn, :copyright_date, "#{current_year}")
    end
  end
end
