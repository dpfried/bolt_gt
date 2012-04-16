def dump_responses_raw(base_dir=nil, parse_path="/home/dfried/bolt/parse_trees/parse.py")
  base_dir ||= File.join(Dir.pwd, "dumps_raw")
  Dir.mkdir(base_dir) unless File.directory? base_dir 
  Sequence.all.each do |sequence|
    seq_dir = File.join(base_dir, sequence.id.to_s)
    Dir.mkdir(seq_dir) unless File.directory? seq_dir 
    sequence.scenes.each_with_index do |scene, n|
      scn_dir = File.join(seq_dir, n.to_s)
      Dir.mkdir(scn_dir) unless File.directory? scn_dir 
      # schematic
      schematic_file = File.join(scn_dir, "schematic")
      File.open(schematic_file, 'w') {|f| f.write(scene.schematic)} unless File.file? schematic_file
      # dump responses
      resp_file = File.join(scn_dir, "responses")
      # overwrite file
      system("> #{resp_file}")
      scene.responses.each do |resp|
        system("echo \"#{resp.answer}\" >> #{resp_file}")
      end
    end
  end
end
