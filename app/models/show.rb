class Show < ActiveRecord::Base
	has_many :list_show

	before_destroy :ensure_not_referenced_by_any_list_show

 	attr_accessible :description, :show_id, :title

 	private

 		def ensure_not_referenced_by_any_list_show
 			if list_show.empty?
 				return true
 			else
 				errors.add(:base, "List Shows present")
 				return false
 			end
 		end
end