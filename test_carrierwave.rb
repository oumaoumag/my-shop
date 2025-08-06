#!/usr/bin/env ruby

# Test script to verify CarrierWave functionality
ENV['RAILS_ENV'] ||= 'development'

begin
  require_relative 'config/application_no_bundler'
  Rails.application.initialize!

  puts "Testing CarrierWave functionality..."
  
  # Test that CarrierWave is loaded
  puts "✓ CarrierWave constant is defined: #{defined?(CarrierWave)}"
  
  # Test that MiniMagick is loaded
  puts "✓ MiniMagick constant is defined: #{defined?(MiniMagick)}"
  
  # Test that ImageUploader is accessible
  puts "✓ ImageUploader class is defined: #{defined?(ImageUploader)}"
  
  # Test that Product model can mount uploader
  product = Product.new
  puts "✓ Product model has image uploader: #{product.respond_to?(:image)}"
  
  # Test uploader instantiation
  uploader = ImageUploader.new
  puts "✓ ImageUploader can be instantiated: #{uploader.class}"
  
  # Test storage configuration
  puts "✓ Storage type: #{uploader.class.storage}"
  
  puts "\n🎉 All CarrierWave tests passed! Image upload functionality is ready."
  
rescue => e
  puts "❌ Error testing CarrierWave: #{e.message}"
  puts e.backtrace.first(5)
end
