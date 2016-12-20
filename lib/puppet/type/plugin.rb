Puppet::Type.newtype(:plugin) do
  desc "Resource for fuel plugin builder"

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
    newvalues(:true, :false)
    defaultto true
  end

  autorequire(:package) do
    ['rpm', 'rpm-build', 'dpkg-devel', 'createrepo', 'dpkg-dev']
  end

end