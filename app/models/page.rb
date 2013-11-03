class Page < ActiveRecord::Base
	belongs_to :subject
	has_many :sections
	 accepts_nested_attributes_for :sections, allow_destroy: true
  validates :subject_id, presence: true
  validates :permalink, presence: true, uniqueness: true,  length: { within: 3..255 }
  
  validates :name,  presence: true, length: { maximum: 255 }
  
  scope :visible, -> {where(visible: 'true') }
   scope :invisible, -> {where(visible: 'false') }
  
end
