class ListShow < ActiveRecord::Base
  belongs_to :show
  belongs_to :user

  attr_accessible :show_id, :user_id
end