json.array!(@trains) do |train|
  json.extract! train, :id, :train_line, :route_name, :run_number, :operator_id
  json.url train_url(train, format: :json)
end
