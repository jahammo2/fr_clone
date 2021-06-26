defmodule FrCloneWeb.CostingRequestView do
  use FrCloneWeb, :view
  require Logger

  alias FrClone.CostingRequests

  def render("index.json", %{costing_requests: costing_requests}) do
    %{
      costing_requests:
        render_many(costing_requests, FrCloneWeb.CostingRequestView, "costing_request.json")
    }
  end

  def render("costing_request.json", %{costing_request: costing_request}) do
    %{
      box_file_location: costing_request.box_file_location,
      crli_count: CostingRequests.get_crli_count(costing_request),
      id: costing_request.id,
      opportunity_id: costing_request.opportunity_id
    }
  end

  def render("error.json", %{changeset: changeset}) do
    errors =
      Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
        Enum.reduce(opts, msg, fn {key, value}, acc ->
          String.replace(acc, "%{#{key}}", to_string(value))
        end)
      end)

    %{
      data: %{
        code: "validation_error",
        errors: errors
      }
    }
  end
end
