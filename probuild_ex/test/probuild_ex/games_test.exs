defmodule ProbuildEx.GamesTest do
  use ExUnit.Case, async: true
  use ProbuildEx.DataCase

  import ProbuildEx.GamesFixtures

  alias ProbuildEx.Games

  describe "team" do
    test "fetch_or_create_team/1 should create team then fetch it" do
      unique_team_name = unique_team_name()
      assert {:ok, created_team} = Games.fetch_or_create_team(unique_team_name)
      assert {:ok, fetched_team} = Games.fetch_or_create_team(unique_team_name)
      assert created_team.id == fetched_team.id
    end
  end

  describe "Pro" do
    test "fetch_or_create_pro/2 should create team then fetch it" do
      team = team_fixture()
      unique_pro_name = unique_pro_name()
      assert {:ok, created_pro} = Games.fetch_or_create_pro(unique_pro_name, team.id)
      assert {:ok, fetched_pro} = Games.fetch_or_create_pro(unique_pro_name, team.id)
      assert created_pro.id == fetched_pro.id
    end
  end
end
