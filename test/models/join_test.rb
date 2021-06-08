# == Schema Information
#
# Table name: joins
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  user_id    :integer
#
require "test_helper"

class JoinTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
