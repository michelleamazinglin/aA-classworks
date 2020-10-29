# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    CAT_COLOR = %w(red white black orange)
    validates :color, presence: true, inclusion: { in: CAT_COLOR, message: "%{value} is not a valid color"}
    validates :sex, presence: true, inclusion: { in: %w(M F), message: "%{value} is not a valid sex"}
    validates :birth_date, presence: true
    validates :description, presence: true
    validates :name, presence: true

#validates_inclusion_of :size, :in => ['small', 'medium', 'large']    
#validates :size, inclusion: { in: %w(small medium large),message: "%{value} is not a valid size" }
    def age
        time_ago_in_words(birth_date)
    end
end
