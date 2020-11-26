json.extract! @part, :id, :partroot, :description
json.statistics @part.statistics do |statistic|
  json.extract! statistic, :id, :unitprice, :unitofmeas, :attritioncoap, :attritionplanned, :attritioncoad
end
