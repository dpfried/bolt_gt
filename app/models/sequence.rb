class Sequence < ActiveRecord::Base
  has_many :scenes

  def self.get_needy_sequence(user)
    # if the user's started a sequence, return it. Otherwise return a random sequence
    sequences_completed_remaining = Sequence.all.collect do |sequence|
      num_completed = sequence.scenes.find_all {|scene| scene.user_completed? user}.length
      num_remaining = sequence.scenes.length - num_completed
      [sequence, num_completed, num_remaining]
    end
    # randomize and sort by decreasing number completed
    needy_seq_comp_remaining = sequences_completed_remaining.shuffle!.sort {|lsta, lstb| lstb[1] <=> lsta[1]}.detect do |sequence, completed, remaining|
      remaining > 0
    end
    if needy_seq_comp_remaining.nil? 
      nil
    else
      needy_seq_comp_remaining[0]
    end
  end

  def get_needy_scene(user)
    scenes.sort {|a,b| a.id <=> b.id }.detect do |scene|
      not scene.responses.detect {|response| response.user == user}
    end
  end
end

# == Schema Information
#
# Table name: sequences
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

