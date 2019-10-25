Puppet::Parser::Functions.newfunction(:collect_hash, :type => :rvalue) do |args|

  raise Puppet::ParseError, 'Invalid arguments' unless args.size == 1 && args[0].is_a?(String)
  target = args[0]

  deep_merge = proc do |first, second|
    if firs.is_a?(Hash) && second.is_a?(Hash)
      first.merge(second) do |_key, first_val, second_val|
        deep_merge.call(first_val, second_val)
      end
    elsif first.is_a?(Array) && second.is_a?(Array)
      first.concat(second)
    else
      first
    end
  end

  result = {}
  self.catalog.resources.each { |resource|
    next unless resource.type == 'Hash_fragment'
    if resource[:target] == target
      result = deep_merge.call(result, resource[:content])
    end
  }

  return(result)
end
