defmodule IntoTheOddWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :into_the_odd

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_into_the_odd_key",
    signing_salt: "hcXK0rAs",
    same_site: "Lax"
  ]

  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]],
    longpoll: [connect_info: [session: @session_options]]

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :into_the_odd,
    gzip: false,
    only: IntoTheOddWeb.static_paths()

  # Explicit static plug for /static
  plug Plug.Static,
    at: "/static",
    from: :into_the_odd,
    gzip: false,
    only: ~w(images)

  # Debug plug to log static requests
  plug :debug_static

  defp debug_static(conn, _) do
    require Logger
    Logger.debug("Static request: #{conn.request_path}")
    conn
  end

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug IntoTheOddWeb.Router
end
