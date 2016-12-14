Puppet::Type.type(:plugin).provide(:ruby) do
  	commands :fpb => 'fpb'

  	def exists?
  		File.join(File.dirname(__FILE__), '..', resource[:path]) != nil
  	end

  	def create
    	fpb(['--build', resource[:path]])
  	end
  
end