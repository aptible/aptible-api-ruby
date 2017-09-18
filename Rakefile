require 'bundler/gem_tasks'

begin
  require 'aptible/tasks'
  Aptible::Tasks.load_tasks
rescue LoadError
  $stderr.puts 'Skipping Aptible::Tasks initialization...'
end
