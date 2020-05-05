require 'bundler/gem_tasks'

begin
  require 'aptible/tasks'
  Aptible::Tasks.load_tasks
rescue LoadError
  warn 'Skipping Aptible::Tasks initialization...'
end
