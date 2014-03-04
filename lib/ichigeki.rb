require "ichigeki/version"
require "ichigeki/hissatsu"

module Ichigeki
  module_function

  def hissatsu(args={})
    ichigeki = Ichigeki::Hissatsu.new(args)
    ichigeki.execute
  end
end
