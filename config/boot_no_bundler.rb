# Boot file without bundler dependency
# This bypasses bundler and uses system gems

# Try to require bootsnap if available
begin
  require "bootsnap/setup"
rescue LoadError
  # Bootsnap not available, continue without it
end
