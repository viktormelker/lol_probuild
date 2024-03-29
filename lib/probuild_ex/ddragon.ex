defmodule ProbuildEx.Ddragon do
  @moduledoc """
  Convenience to access ddragon.
  """
  alias ProbuildEx.Ddragon.Cache

  @ddragon_cdn "https://ddragon.leagueoflegends.com/cdn"

  @doc """
  Get a champion image given the game_version and champion_key.
  ## Example
    iex> Ddragon.get_champion_image("12.16.1", 1)
    "https://ddragon.leagueoflegends.com/cdn/12.16.1/img/champion/Annie.png"
  """
  def get_champion_image(game_version, champion_key) do
    case Cache.fetch_champion_img(champion_key) do
      {:ok, champion_img} ->
        "#{@ddragon_cdn}/#{game_version}/img/champion/#{champion_img}"

      {:error, _} ->
        nil
    end
  end

  @doc """
  Get a summoner image given the game_version and summoner_key.
  ## Example
    iex> Ddragon.get_summoner_image("12.16.1", 4)
    "https://ddragon.leagueoflegends.com/cdn/12.16.1/img/spell/SummonerFlash.png"
  """
  def get_summoner_image(game_version, summoner_key) do
    case Cache.fetch_summoner_img(summoner_key) do
      {:ok, summoner_img} ->
        "#{@ddragon_cdn}/#{game_version}/img/spell/#{summoner_img}"

      {:error, _} ->
        nil
    end
  end

  @doc """
  Get a summoner image given the game_version and summoner_key.
  ## Example
    iex> Ddragon.get_item_image("12.16.1", 1038)
    "https://ddragon.leagueoflegends.com/cdn/12.16.1/img/item/1038.png"
  """
  def get_item_image(game_version, item_key)
  def get_item_image(_game_version, 0), do: nil

  def get_item_image(game_version, item_key) do
    "#{@ddragon_cdn}/#{game_version}/img/item/#{item_key}.png"
  end

  @doc """
  Get a champion search map
  ## Example
    iex> Ddragon.get_champions_search_map()
    %{
      "lux" => 99,
      "evelynn" => 28,
      "heimerdinger" => 74,
      ...
    }
  """
  def get_champions_search_map do
    case Cache.fetch_champions_search_map() do
      {:ok, search_map} ->
        search_map

      {:error, _} ->
        %{}
    end
  end
end
