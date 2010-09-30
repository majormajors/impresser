$: << File.expand_path(File.dirname(__FILE__))

require "ostruct"

module Presser
  Config = OpenStruct.new({
    :table_prefix => "wp_",
    :repository => :default
  })
end

require "presser/model"