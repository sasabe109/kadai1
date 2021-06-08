# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  content      :text
#  date         :datetime
#  title        :string
#  type         :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  presenter_id :integer
#
class Event < ApplicationRecord
end
