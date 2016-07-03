defmodule MyCli.CLITest do
  use ExUnit.Case, async: true

  import MyCli.CLI, only: [parse_args: 1]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "three values retuned if three given" do
    assert parse_args(["user", "project", "99"]) == {"user", "project", 99}
  end

  test "count is defaulted if two value given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end

end
