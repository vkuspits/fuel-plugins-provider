Puppet::Type.newtype(:plugin) do
  	desc "Fuel plugin builder"

=begin  	ensurable do
  		def insync?(is)
    	    @should ||= []
	
      	    case should
    	    when :present
    	      	return true unless [:absent, :purged, :held].include?(is)
    	end

    	newvalue(:present) do
        	provider.install
    	end

    	newvalue(:absent) do
        	provider.uninstall
    	end
    end
=end

  	newparam(:path, :namevar => true) do
  		desc "Name of resource or plugin path"
  		munge do |value|
  			value.downcase
  		end
  		def issync?(is)
  			is.downcase == should.downcase
  		end
  	end

  	newproperty(:path) do
  		desc "Path to local repo of plugin"
  	end

  	newproperty(:build) do
  		newvalue(:true)
  		newvalue(:false)
  	end

end