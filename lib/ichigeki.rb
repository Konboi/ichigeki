require "ichigeki/version"
require "ichigeki/hissatsu"

module Ichigeki
  module_function

  def hissatsu(args={})
    ichigeki = Ichigeki::Hissatsu.new(args)
    ichigeki.execute
  end
end

#Kernel#.require returns bool value
#so, bool value override and we can `require('ichigeki').hissatsu`
[true, false].each do |bool|
  class << bool
    def hissatsu(args={})
      Ichigeki.hissatsu args
    end
  end
end
