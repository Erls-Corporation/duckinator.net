class HomePage
  attr_accessor :title, :location
  def initialize(env)
    @env = env
    @location = @env['REQUEST_URI'] || "/"
    @title = set_title

    body_ex = open(env['PATH_TRANSLATED']).read.split("\n")[2..-1]
    @body = body_ex.join("\n")
 
    print_page
    exit
  end

  def set_title
    title = "duckinator.net"
    if @location != '/' and @location.length > 0
      title = "#{title} : #{@env['REQUEST_URI'][1..-1]}"
    end
    title.chomp!('/index.rhtml')
    title.chomp!('/')
    title
  end

  def print_page
    head = ''

    text = open(File.dirname(__FILE__) + '/template.html').read
    text.gsub!('%title%', @title)
    text.gsub!('%head%', head)
    text.gsub!('%body%', @body)
    puts text
  end
end

