#!/usr/bin/env ruby

# Simple script to start the Rails server without bundler
ENV['RAILS_ENV'] ||= 'development'

# Add current directory to load path
$LOAD_PATH.unshift(File.expand_path('.', __dir__))

begin
  # Load application configuration without bundler
  require_relative 'config/application_no_bundler'

  # Initialize the application
  Rails.application.initialize!
  
  # Start the server
  require 'rails/commands/server'
  
  server = Rails::Server.new
  server.options[:Port] = 3000
  server.options[:Host] = '0.0.0.0'
  
  puts "Starting Rails server on http://0.0.0.0:3000"
  server.start
rescue LoadError => e
  puts "Error loading Rails application: #{e.message}"
  puts "Make sure all required gems are installed"
rescue => e
  puts "Error starting server: #{e.message}"
  puts e.backtrace.first(5)
end
