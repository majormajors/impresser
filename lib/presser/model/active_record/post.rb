module Presser
  class Post < Base
    set_primary_key "ID"
    has_many :posts, :foreign_key => "post_parent"
    belongs_to :parent, :foreign_key => "post_parent", :class_name => "Post"
    has_many :comments, :foreign_key => "comment_post_ID"
    has_many :post_metas
    belongs_to :user, :foreign_key => "post_author"
    
    validates_presence_of :post_title
    
    after_create do
      if %w(post page).include? post_type
        site_url = Option.where(:option_name => "siteurl").first
        guid = site_url << case post_type
          when "post" then "/?p=#{self.id}"
          when "page" then "/?page=#{self.id}"
        end
        save
      end
    end
  end
end