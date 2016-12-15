Puppet::Type.type(:plugin).provide(:ruby) do
  	commands :fpb => 'fpb'

  	def exists?
  		File.dirname.exists?(@resource[:path])
  	end

  	def create
  		if self.exists? && resource[:build]
    		fpb(['--build', resource[:path]])
    	end
  	end

end