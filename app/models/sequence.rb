class Sequence < ActiveRecord::Base
  has_many :scenes

  def self.get_needy_sequence(user)
    # find first sequence where user hasn't completed all scenes in the seq
    Sequence.all.sort{|a,b| a.id <=> b.id}.detect do |sequence|
      # return true iff the user still needs to complete a scene
      not sequence.scenes.all? do |scene|
        # return true iff the user has a response in this scene
        scene.responses.detect { |response| response.user == user}
      end
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

