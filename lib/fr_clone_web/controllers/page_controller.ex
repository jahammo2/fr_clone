defmodule FrCloneWeb.PageController do
  use FrCloneWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
