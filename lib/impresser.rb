require "impresser/version"
require "impresser/exceptions"

module Impresser
  MODEL_NAMES = %w(comment comment_meta link option post_base post page post_meta term term_relationship term_taxonomy user user_meta).freeze

  Config = {
    :table_name_prefix => "wp_",
    :connect => Hash.new
  }

  def self.setup(orm=:active_record, options={})
    Config.merge!(options)
    require "impresser/#{orm}"
    self.load_models_for(orm)
  end
  
  # Loads data models for the specified ORM
  #
  # @param [String] orm The ORM for which you want to load models
  def self.load_models_for(orm)
    MODEL_NAMES.each{ |model| require File.join("impresser", "model", orm.to_s, model) }
  end
end
