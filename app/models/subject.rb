class Subject < ActiveRecord::Base
	has_many :pages
	 accepts_nested_attributes_for :pages, allow_destroy: true
	 
	  validates :name,  presence: true, length: { maximum: 50 }
	 scope :visible, -> {where(visible: 'true') }
   	scope :invisible, -> {where(visible: 'false') }
end
