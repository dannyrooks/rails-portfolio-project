class Location < ApplicationRecord
    has_many :reports
    has_many :users, through: :reports

    validates :name, :description, presence: true 
    validates :name, uniqueness: true

    accepts_nested_attributes_for :reports, reject_if: :all_blank

    scope :order_by_name, -> {order("name")}

    #Include a class level ActiveRecord scope method 
    #(model object & class method name and URL to see the working feature 
    #e.g. User.most_recipes URL: /users/most_recipes

end
