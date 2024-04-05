defmodule ElixirDockerFirstTest do
  use ExUnit.Case
  doctest ElixirDockerFirst

  test "greets the world" do
    assert ElixirDockerFirst.hello() == :world
  end
end
