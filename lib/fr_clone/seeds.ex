defmodule FrClone.Seeds do
  alias FrClone.Repo
  alias FrClone.CostingRequests.CostingRequest

  @urls_list [
    "http://www.erlang.org",
    "http://www.elixir-lang.org",
    "http://www.phoenixframework.org"
  ]

  def insert_costing_requests do
    Repo.insert!(%CostingRequest{
      box_file_location: @urls_list |> Enum.random(),
      opportunity_id: Enum.random(1000..9999) |> to_string
    })
  end
end
