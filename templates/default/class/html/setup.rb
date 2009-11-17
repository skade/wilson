def route_signature(route, link = true, show_extras = true)
  return link_url(url_for(route), route.route, :title => route.route)
end