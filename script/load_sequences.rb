def load_sequences_from_dir(base_dir)
  # iterate over sequences
  Dir.entries(base_dir).each do |seq_marginal_dir|
    sequence_dir = Dir.join(base_dir, seq_marginal_dir)
    sequence = Sequence.new
    # iterate over scenes
    inner_scenes_sorted = Dir.entries(sequence_dir).sort do |a, b|
      a_int = a.match(/\d+/)[0].to_i
      b_int = b.match(/\d+/)[0].to_i
      a_int <=> b_int
    end

    inner_scenes_sorted.each do |scene_marginal_dir|
      scene_dir = Dir.join(sequence_dir, scene_marginal_dir)
      json_file = Dir.join(scene_dir, "data.json")
      img_file = Dir.join(scene_dir, "snapshot.png")
      scene = sequence.build
      File.open(json_file) { |file| scene.schematic = file.read }
      scene.image = img_file
    end

    Dir.chdir(sequence_dir)
  end
end
