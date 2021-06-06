defmodule FrCloneWeb.CostingRequestView do
  use FrCloneWeb, :view
  require Logger

  def render("index.json", %{costing_requests: costing_requests}) do
    %{data: render_many(costing_requests, FrCloneWeb.CostingRequestView, "costing_request.json")}
  end

  def render("costing_request.json", %{costing_request: costing_request}) do
    %{
      box_file_location: costing_request.box_file_location,
      crli_count: costing_request.crli_count,
      id: costing_request.id,
      opportunity_id: costing_request.opportunity_id,
    }
  end
end
