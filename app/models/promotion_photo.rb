class PromotionPhoto < ApplicationRecord
	
  belongs_to :promotion, inverse_of: :photos

end
