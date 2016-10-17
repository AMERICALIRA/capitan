# == Schema Information
#
# Table name: spots
#
#  id         :integer          not null, primary key
#  branch_id  :integer
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Spot < ActiveRecord::Base
  belongs_to :branch
end