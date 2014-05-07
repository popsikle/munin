def munin_node_ip(nodeish)
  # if monitoring_address is specified implicitly use that
  attrib_value = nil
  if !nodeish['munin']['monitoring_attribute'].nil?
    attrib_value=nodeish
    path_ary = nodeish['munin']['monitoring_attribute'].split('.')
    path_ary.each do |k|
      if attrib_value and attrib_value.has_key?(k)
        attrib_value = attrib_value[k]
      elsif attrib_value and attrib_value.respond_to? k
        attrib_value = attrib_value.send(k)
      else
        attrib_value = nil
      end
    end
  end
  if attrib_value
    attrib_value
  else
    nodeish['ipaddress']
  end
end