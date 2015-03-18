class Domain < ActiveRecord::Base
	belongs_to :account

	validates :hostname, presence: true, uniqueness: true
	#validates :ip, presence: true
end