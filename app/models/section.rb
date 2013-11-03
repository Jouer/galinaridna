class Section < ActiveRecord::Base
	belongs_to :page
	validates :page_id, presence: true
	validates :name,  presence: true, length: { maximum: 255 }
	
	
	CONTENT_TYPES = ['text', 'HTML']
	 validates :content_type, inclusion: { in: CONTENT_TYPES, message: "must be one of: #{CONTENT_TYPES.join(', ')}"}
	 validates :content, presence: true
	scope :visible, -> {where(visible: 'true') }
   	scope :invisible, -> {where(visible: 'false') }
 
end
