defmodule G1.Session do
  alias G1.User, as: User

  def login(%{"email" => email, "password" => password}) \
  when not is_nil(email) and not is_nil(password) do
    user = G1.Repo.get_by(User, email: String.downcase(email))
    case authenticate(user, password) do
      true  -> {:ok, user}
      false -> false
    end
  end

  def login(_), do: false

  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user)
    if id, do: G1.Repo.get(User, id)
  end

  def logged_in?(conn), do: !!current_user(conn)

  defp authenticate(user, password) when not is_nil(user) do
    Comeonin.Bcrypt.checkpw(password, user.crypted_password)
  end

  defp authenticate(_, _), do: false
end
