defmodule RemoveBug.BugFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RemoveBug.Bug` context.
  """

  @doc """
  Generate a test.
  """
  def test_fixture(attrs \\ %{}) do
    {:ok, test} =
      attrs
      |> Enum.into(%{

      })
      |> RemoveBug.Bug.create_test()

    test
  end
end
