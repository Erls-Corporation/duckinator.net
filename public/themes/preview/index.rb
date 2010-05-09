#noheaders
require File.join(File.dirname(__FILE__), '..', '..', '..', 'backend', 'backend.rb')

env = {}
ENV.each do |k,v|
	env[k]=v
end
env['PATH_TRANSLATED'].delete!('themes/preview/')
env['PATH_TRANSLATED'].gsub!('/index.rb', '/index.rhtml')

HomePage.new(env, 'dove')

