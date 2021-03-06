Puppet::Type.type(:fuel_plugins).provide(:ruby) do
  desc "Provider for fuel plugins"
  command :fuel_plugins => 'fuel plugins'

  def initialize(value={})
    super(value)
    @property_flush = {}
  end

  def self.get_plugins
    begin
      output = fuel_plugins
      rescue Puppet::ExecutionFailure => e
      Puppet.debug("#get_plugins had an error -> #{e.inspect}")
      return nil
    end
    
    output = output.split("\n")[2..-1]
    result = Array.new
    output.each do |item|
      tmp = Hash.new
      item = item.split('|')
      tmp[:name] = item[1].strip
      tmp[:version] = item[2].strip
      result << tmp
    end

    @property_hash[:plugins] = result

  end

#  def self.instances
#    get_plugins.collect do 
#  end

  def self.get_plugin
  	@propety_hash[:plugins].each do |plugin|
  	  if plugin[:name] == @resource.value(:plugin) && plugin[:version] == @resource.value(:version)
  	  	return plugin
  	  end
  	end
  	nil
  end

  def exists?
  	get_plugin != nil
  end

  def create
    fuel_plugins("--install", @resource.value(:name))
  end
  


end