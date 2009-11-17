def init
  sections :header, [:route_signature, T('docstring'), :source]
end

def source
  return if object.tags(:overload).size > 1
  erb(:source)
end

def sig(route, link = true, show_extras = true)
  return link_url(url_for(route), route.route, :title => route.route)
end