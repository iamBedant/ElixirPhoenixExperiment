defmodule WhatsUpWeb.DefaultController do
    use WhatsUpWeb, :controller
  
    def index(conn, _params) do
      text conn, "WhatsUpWeb!"
    end
  end