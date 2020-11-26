json.array! @statistics do |statistic|
  json.extract! statistic, :id, :part_id, :unitprice, :unitofmeas, :attritioncoap, :attritionplanned, :attritioncoad
end
