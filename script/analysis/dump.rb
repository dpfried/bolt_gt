def dump_annotation_tasks(base_dir=nil, parse_path="/home/dfried/bolt/parse_trees/parse.py")
  base_dir ||= File.join(Dir.pwd, "dumps")
  File.directory? base_dir || Dir.mkdir(base_dir)
  Sequence.all.each do |sequence|
    seq_dir = File.join(base_dir, sequence.id.to_s)
    File.directory? seq_dir || Dir.mkdir(seq_dir)
    sequence.scenes.each_with_index do |scene, n|
      scn_dir = File.join(seq_dir, n.to_s)
      File.directory? scn_dir || Dir.mkdir(scn_dir)
      # dump schematic if it doesn't exist
      schematic_file = File.join(scn_dir, "schematic")
      File.file? schematic_file || File.open(schematic_file, 'w') {|f| f.write(scene.schematic)}
      # dump responses
      resp_dir = File.join(scn_dir, "responses")
      File.directory? resp_dir || Dir.mkdir(resp_dir)
      scene.responses.each do |resp|
        response_file = File.join(resp_dir, resp.user_id.to_s)
        # only parse the file if it doesn't already exist
        unless File.file? response_file
          File.open(response_file, 'w') {|f| f.write(resp.answer)}
          response_parse = File.join(resp_dir, resp.user_id.to_s + ".trips")
          system(parse_path + " < " + response_file + " > " + response_parse)
        end
      end
    end
  end
end
