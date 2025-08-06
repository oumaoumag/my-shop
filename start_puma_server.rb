#!/usr/bin/env ruby

# Start Rails server with Puma
ENV['RAILS_ENV'] ||= 'development'

begin
  require_relative 'config/application_no_bundler'
  Rails.application.initialize!

  require 'rack'
  require 'puma'

  app = Rails.application

  server = Puma::Server.new(app)
  server.add_tcp_listener('0.0.0.0', 3000)

  puts "Starting Rails server on http://0.0.0.0:3000"
  puts "Press Ctrl+C to stop"

  # Handle interrupts gracefully
  trap('INT') do
    puts "\nShutting down server..."
    server.stop
    exit
  end

  server.run.join
rescue => e
  puts "Error starting server: #{e.message}"
  puts e.backtrace.first(10)
end
