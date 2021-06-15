# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  content      :text
#  date         :datetime
#  decide_flag  :integer
#  flag         :integer
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  presenter_id :integer
#
class Event < ApplicationRecord

    
    def start_time
        self.date
    end
    
end
