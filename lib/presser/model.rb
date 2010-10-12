module Presser
  MODEL_NAMES = %w(comment comment_meta link option post_base post page post_meta term term_relationship term_taxonomy user user_meta).freeze
  
  # Loads data models for the specified ORM
  #
  # @param [String] orm The ORM for which you want to load models
  def self.load_models_for(orm)
    MODEL_NAMES.each{ |model| require File.join("presser", "model", orm.to_s, model) }
  end
end

if %w(active_record data_mapper sequel).include?(Presser::Config[:orm].to_s)
  require "presser/model/#{Presser::Config[:orm]}"
elsif defined? ::ActiveRecord
  require "presser/model/active_record"
elsif defined? ::DataMapper
  require "presser/model/data_mapper"
elsif defined? ::Sequel
  require "presser/model/sequel"
else
  raise Presser::NoOrmError, "You don't have a supported ORM loaded."
end
