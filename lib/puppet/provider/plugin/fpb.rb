Puppet::Type.type(:plugin).provide(:ruby) do
  commands :fpb => '/usr/local/bin/fpb'

  def self.instances
    raise Puppet::DevError, "Provider #{self.name} has not defined the 'instances' class method"
  end

#  def self.prefetch(resources)
#   instances.each do |prov|
#      if resource = resources[prov.name]
#        resource.provider = prov
#      end
#    end
#  end

  def exists?
    Dir.glob(@resource.value(:name) +"*.rpm").empty?
  end

  puts @resource

  def create
    fpb('--build', @resource.value(:name))
  end

end
