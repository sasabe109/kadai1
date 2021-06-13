# == Schema Information
#
# Table name: counts
#
#  id         :integer          not null, primary key
#  datenum    :integer
#  user_count :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#
require "test_helper"

class CountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
