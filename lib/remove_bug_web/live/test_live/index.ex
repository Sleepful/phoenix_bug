defmodule RemoveBugWeb.TestLive.Index do
  use RemoveBugWeb, :live_view

  alias RemoveBug.Bug
  alias RemoveBug.Bug.Test

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :tests, list_tests())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Test")
    |> assign(:test, Bug.get_test!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Test")
    |> assign(:test, %Test{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Tests")
    |> assign(:test, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    test = Bug.get_test!(id)
    {:ok, _} = Bug.delete_test(test)

    {:noreply, assign(socket, :tests, list_tests())}
  end

  defp list_tests do
    Bug.list_tests()
  end
end
