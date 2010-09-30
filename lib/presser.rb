$: << File.expand_path(File.dirname(__FILE__))

require "ostruct"

module Presser
  Config = OpenStruct.new(
    :table_prefix => "wp_",
    :wp_content_path => nil)
end

require "presser/model"