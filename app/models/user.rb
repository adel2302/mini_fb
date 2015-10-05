class User < ActiveRecord::Base
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
