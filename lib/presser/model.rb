if defined? ActiveRecord
  require "presser/model/active_record"
# elsif defined? DataMapper
#   require "presser/model/data_mapper"
# elsif defined? Sequel
#   require "presser/model/sequel"
elsif
  raise LoadError, "You don't have a supported ORM loaded."
end