def with_env(*args)
  hash = args.first.is_a?(Hash) ? args.first : Hash[*args]
  old_values = Hash[hash.map { |k, _| [k, ENV[k]] }]
  begin
    hash.each { |k, v| ENV[k] = v }
    yield
  ensure
    old_values.each { |k, v| ENV[k] = v }
  end
end
