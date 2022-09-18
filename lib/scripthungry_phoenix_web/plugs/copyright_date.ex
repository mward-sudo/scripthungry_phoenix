defmodule ScripthungryPhoenixWeb.Plugs.CopyrightDate do
  @moduledoc """
  A plug that adds a copyright date to the assigns.
  """
  import Plug.Conn

  def init(default), do: default

  def call(conn, start_year) do
    # Calculate copyright date, either current year or range of years starting
    # with start_year.
    current_year = DateTime.utc_now() |> Map.fetch!(:year)

    copyright_date =
      if current_year > start_year,
        do: "#{start_year}-#{current_year}",
        else: "#{current_year}"

    assign(conn, :copyright_date, copyright_date)
  end
end
