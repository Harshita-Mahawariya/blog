class Article < ApplicationRecord

	# include Visible
	
	has_many :comments, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: { message: "Body is mandatory"}, length: { minimum: 10}
	# VALID_STATUSES = ['public', 'private', 'archived']

 #  validates :status, inclusion: { in: VALID_STATUSES }

 #  def archived?
 #    status == 'archived'
 #  end
end
