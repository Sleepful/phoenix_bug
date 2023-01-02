defmodule RemoveBugWeb.PageController do
  use RemoveBugWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
