class UserAccount < ApplicationRecord
  belongs_to :user
  has_many_attached :certificate

  has_one_attached :picture

  has_one_attached :cv

   

    
  validates :username, presence: true
  validates :gmail, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }

 
  validates :skiill, presence: true
  validates :orgganisation, presence: true
  validates :job, presence: true

  validates :link, presence: true

  

  validates :picture, attached: true, content_type: [:png, :jpg, :jpeg]
  validates :cv, attached: true, content_type: [:pdf]
  validates :certificate, attached: true, content_type: [:pdf]
 

  

   

  before_save do
    self.job.gsub!(/[\[\]\"]/,"") if attribute_present?("job")
  end
end
