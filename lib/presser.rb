$: << File.expand_path(File.dirname(__FILE__))

module Presser
  Config = {
    :table_name_prefix => "wp_",
    :repository => :default,
    :connect => Hash.new
  }

  def self.setup(options={})
    Config.merge!(options)
    require "presser/model"
  end
end

require "presser/exceptions"
require "presser/railtie" if defined? ::Rails