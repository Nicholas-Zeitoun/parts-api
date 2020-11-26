json.array! @statistics do |statistic|
  json.extract! statistic, :id, :unitprice, :unitofmeas, :attritioncoap, :attritionplanned, :attritioncoad
end
