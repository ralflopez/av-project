defmodule AvProjectWeb.ProductLive.Index do
  use AvProjectWeb, :live_view

  alias AvProject.Products
  alias AvProject.Products.Product

  @impl true
  def mount(_params, session, socket) do
    %{id: user_id, store_id: store_id} = session["current_user"]

    {:ok, socket
      |> assign(:store_id, store_id)
      |> assign(:user_id, user_id)
      |> stream(:products, Products.list_products(store_id)) }
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(%{ assigns: %{store_id: store_id}} = socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Product")
    |> assign(:product, Products.get_product!(store_id, id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Product")
    |> assign(:product, %Product{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Products")
    |> assign(:product, nil)
  end

  @impl true
  def handle_info({AvProjectWeb.ProductLive.FormComponent, {:saved, product}}, socket) do
    {:noreply, stream_insert(socket, :products, product)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, %{ assigns: %{store_id: store_id}} = socket) do
    product = Products.get_product!(store_id, id)
    {:ok, _} = Products.delete_product(product)

    {:noreply, stream_delete(socket, :products, product)}
  end
end
