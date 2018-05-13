require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :console do
  require "pry"
  require "./lib/pushme/aws"
  require "httplog"
  HttpLog.configure do |config|
    config.log_headers = true
  end

  def reload!
    files = $LOADED_FEATURES.select { |feat| feat =~ %r{lib/pushme} }
    # Deactivate warning messages.
    original_verbose, $VERBOSE = $VERBOSE, nil
    files.each { |file| load file }
    # Activate warning messages again.
    $VERBOSE = original_verbose
    init_setup
    "Console reloaded!"
  end

  ARGV.clear
  Pry.start
end
