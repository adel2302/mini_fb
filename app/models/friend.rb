class Friend < ActiveRecord::Base
  belongs_to :user_a, class_name: "User",
                      foreign_key: "user_a_id"
  belongs_to :user_b, class_name: "User",
                      foreign_key: "user_b_id"

end
