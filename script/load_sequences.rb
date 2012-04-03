def load_sequences_from_dir(base_dir)
  # iterate over sequences
  sequences_list = Dir.entries(base_dir).sort
  sequences_list.delete('.')
  sequences_list.delete('..')
  sequences_list.each do |seq_marginal_dir|
    sequence_dir = File.join(base_dir, seq_marginal_dir)
    sequence = Sequence.new
    # iterate over scenes
    inner_scenes = Dir.entries(sequence_dir)
    inner_scenes.delete('.')
    inner_scenes.delete('..')
    inner_scenes_sorted = inner_scenes.sort do |a, b|
      a_int = a.match(/\d+/)[0].to_i
      b_int = b.match(/\d+/)[0].to_i
      a_int <=> b_int
    end

    inner_scenes_sorted.each do |scene_marginal_dir|
      scene_dir = File.join(sequence_dir, scene_marginal_dir)
      json_file = File.join(scene_dir, "data.json")
      img_file = File.join(scene_dir, "snapshot.png")
      scene = sequence.scenes.build
      File.open(json_file) { |file| scene.schematic = file.read }
      File.open(img_file) { |file| scene.image = file }
      scene.save
    end
    sequence.save

  end
end
