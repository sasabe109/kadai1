# == Schema Information
#
# Table name: plannings
#
#  id         :integer          not null, primary key
#  datenum    :integer
#  status     :integer
#  strdate    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  user_id    :integer
#
require "test_helper"

class PlanningTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
