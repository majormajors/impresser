module Presser
  Models = %w(comment comment_meta link option post_base post page post_meta term term_relationship term_taxonomy user user_meta).freeze
  
  def self.load_models_for(orm)
    Models.each{ |model| require File.join("presser","model", orm, model) }
  end
end

if defined? ::ActiveRecord
  require "presser/model/active_record"
elsif defined? ::DataMapper
  require "presser/model/data_mapper"
elsif defined? ::Sequel
  require "presser/model/sequel"
else
  raise LoadError, "You don't have a supported ORM loaded."
end
