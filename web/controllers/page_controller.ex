defmodule G1.PageController do
  use G1.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def haml(conn, _params) do
    render conn, "haml.html"
  end
end
