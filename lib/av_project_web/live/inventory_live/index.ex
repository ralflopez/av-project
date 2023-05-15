defmodule AvProjectWeb.InventoryLive.Index do
  alias AvProject.Inventories.InventoryLog
  alias AvProject.Inventories.NewInventoryLogInput
  alias AvProject.Inventories
  use AvProjectWeb, :live_view

  @impl true
  def mount(_params, session, socket) do
    %{store_id: store_id} = session["current_user"]

    {:ok, socket
      |> assign(:user, session["current_user"])
      |> stream(:inventory_items, Inventories.list_inventory_items(store_id)) }
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Inventories")
    |> assign(:inventory_log, nil)
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Inventory Log")
    |> assign(:inventory_log, %NewInventoryLogInput{})
  end
end
