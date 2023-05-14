defmodule AvProjectWeb.ProductLive.Show do
  use AvProjectWeb, :live_view

  alias AvProject.Products

  @impl true
  def mount(_params, session, socket) do
    %{id: user_id, store_id: store_id} = session["current_user"]

    {:ok, socket
      |> assign(:store_id, store_id)
      |> assign(:user_id, user_id)}
  end

  @impl true
  def handle_params(%{"id" => id}, _, %{assigns: %{live_action: live_action, store_id: store_id}} = socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(live_action))
     |> assign(:product, Products.get_product!(store_id, id))}
  end

  defp page_title(:show), do: "Show Product"
  defp page_title(:edit), do: "Edit Product"
end
