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
require "test_helper"

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
