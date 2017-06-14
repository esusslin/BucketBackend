class User < ApplicationRecord
	
	has_many :proposals, dependent: :destroy
	has_many :buckets, dependent: :destroy

end
