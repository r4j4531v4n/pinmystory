class Story < ActiveRecord::Base
  default_scope order: 'created_at DESC'
  attr_accessible :content, :user_id
  belongs_to :user
  validates :content, presence: true, length: {
  			:maximum => 55,
  			:tokenizer => lambda { |str| str.split },
  			:too_short => "Must contain %{count} words",
  			:too_long  => "Must contain %{count} words"
  }
end
