class BlogPost < ApplicationRecord
	
	has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
	# validations
  	validates :title, presence: true, uniqueness: true

  	#callbacks
  	before_save :small_to_CAPS

  	private

  	def small_to_CAPS
  		self.title.capitalize!
  	end
end
