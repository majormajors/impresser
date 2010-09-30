module Presser
  class Base < ::ActiveRecord::Base
    self.abstract_class = true
  end
  
  def self.load_models
    require "presser/model/active_record/comment"
    require "presser/model/active_record/comment_meta"
    require "presser/model/active_record/link"
    require "presser/model/active_record/option"
    require "presser/model/active_record/post_base"
    require "presser/model/active_record/post"
    require "presser/model/active_record/page"
    require "presser/model/active_record/post_meta"
    require "presser/model/active_record/term"
    require "presser/model/active_record/term_relationship"
    require "presser/model/active_record/term_taxonomy"
    require "presser/model/active_record/user"
    require "presser/model/active_record/user_meta"
  end
end
