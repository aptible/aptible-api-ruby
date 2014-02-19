def set_env(*args, &block)
  hash = args.first.is_a?(Hash) ? args.first : Hash[*args]
  old_values = Hash[hash.map { |k, v| [k, ENV[k]] }]
  begin
    hash.each { |k, v| ENV[k] = v }
    yield
  ensure
    old_values.each { |k, v| ENV[k] = v }
  end
end
