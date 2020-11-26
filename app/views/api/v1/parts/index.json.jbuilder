json.array! @parts do |part|
  json.extract! part, :id, :partroot, :description
end
