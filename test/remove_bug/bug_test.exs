defmodule RemoveBug.BugTest do
  use RemoveBug.DataCase

  alias RemoveBug.Bug

  describe "tests" do
    alias RemoveBug.Bug.Test

    import RemoveBug.BugFixtures

    @invalid_attrs %{}

    test "list_tests/0 returns all tests" do
      test = test_fixture()
      assert Bug.list_tests() == [test]
    end

    test "get_test!/1 returns the test with given id" do
      test = test_fixture()
      assert Bug.get_test!(test.id) == test
    end

    test "create_test/1 with valid data creates a test" do
      valid_attrs = %{}

      assert {:ok, %Test{} = test} = Bug.create_test(valid_attrs)
    end

    test "create_test/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bug.create_test(@invalid_attrs)
    end

    test "update_test/2 with valid data updates the test" do
      test = test_fixture()
      update_attrs = %{}

      assert {:ok, %Test{} = test} = Bug.update_test(test, update_attrs)
    end

    test "update_test/2 with invalid data returns error changeset" do
      test = test_fixture()
      assert {:error, %Ecto.Changeset{}} = Bug.update_test(test, @invalid_attrs)
      assert test == Bug.get_test!(test.id)
    end

    test "delete_test/1 deletes the test" do
      test = test_fixture()
      assert {:ok, %Test{}} = Bug.delete_test(test)
      assert_raise Ecto.NoResultsError, fn -> Bug.get_test!(test.id) end
    end

    test "change_test/1 returns a test changeset" do
      test = test_fixture()
      assert %Ecto.Changeset{} = Bug.change_test(test)
    end
  end
end
