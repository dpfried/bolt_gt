def dump_aggregate_responses(base_dir=nil, parse_path="/home/dfried/bolt/parse_trees/parse.py")
  base_dir ||= File.join(Dir.pwd, "dumps")
  Dir.mkdir(base_dir) unless File.directory? base_dir 
  Sequence.all.each do |sequence|
    seq_dir = File.join(base_dir, sequence.id.to_s)
    Dir.mkdir(seq_dir) unless File.directory? seq_dir 
    sequence.scenes.each_with_index do |scene, n|
      scn_dir = File.join(seq_dir, n.to_s)
      Dir.mkdir(scn_dir) unless File.directory? scn_dir 
      # dump schematic if it doesn't exist
      schematic_file = File.join(scn_dir, "schematic")
      File.open(schematic_file, 'w') {|f| f.write(scene.schematic)} unless File.file? schematic_file 
      # dump responses
      resp_file = File.join(scn_dir, "responses")
      # overwrite file
      system("echo '(' > #{resp_file}")
      scene.responses.each do |resp|
        system("echo '(' >> #{resp_file}")
        system("echo '\"'#{resp.answer}'\"' >> #{resp_file}")
        system("echo \"#{resp.answer}\" | #{parse_path} >> #{resp_file}")
        system("echo ')' >> #{resp_file}")
      end
      system("echo ')' >> #{resp_file}")
    end
  end
end
