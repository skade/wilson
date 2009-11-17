def init
  super
  
  sections.place([:route_summary, [:route_item], 
                  :route_details_list, [T('route_details')]])
          .before(:method_summary)
  
end

def route_listing
  @routes ||= object[:routes]
end