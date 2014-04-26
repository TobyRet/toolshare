class Tool < ActiveRecord::Base

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" },
    storage: :s3,
    bucket: 'matoolshare3',
    s3_host_name: 's3-eu-west-1.amazonaws.com',
    s3_credentials: {
      access_key_id: Rails.application.secrets[:aws_id],
      secret_access_key: Rails.application.secrets[:aws_key]  
    }

  belongs_to :user
  has_many :comments
  
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  geocoded_by :address   
  after_validation :geocode    

  def address
    [street, city].compact.join(', ')
  end      
  
end
