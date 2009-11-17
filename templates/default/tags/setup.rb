def init
  super
  sections[1].place([:url_param, :get, :post, :output_types, :output_langages])
             .after(:param)
  sections[1].place(:representation)
             .after(:param)
end

def url_param
  tag :url_param
end

def get
  tag :get
end

def post
  tag :post
end

def output_types
  tag :output_types
end

def output_langages
  tag :output_langages
end