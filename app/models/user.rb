class User < ActiveRecord::Base
  has_many :sent_messages, class_name: "Message",
                            foreign_key: "user_a_id"
  has_many :received_messages, class_name: "Message",
                               foreign_key: "user_b_id"
  has_many :friends
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

    def self.search(query)
    	if query
      where(["name LIKE ?", "%#{query}%"])
         else
            all
        end
    end 
end
