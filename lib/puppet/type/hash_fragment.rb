Puppet::Type.newtype(:hash_fragment) do
  
  desc <<-DOC
  @summary
    A resource that defines (part of) a hash that can be collected.
  DOC

  newparam :name do
    desc 'The name of the hash fragment.'
  end

  newparam :content do
    desc 'The content of the hash fragment.'
  end

  newparam :target do
    desc 'The target of the hash fragment.'
  end

  def refresh
  end

end
