#require "em/pure_ruby" unless defined?(EventMachine)
require "rack"
require "thin"

load "router.rb"

handler = Rack::Handler::Thin
handler.run(
  Router.new,
  Port: 7373
)
