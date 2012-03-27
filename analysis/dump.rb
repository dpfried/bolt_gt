def dump_annotation_tasks(base_dir=nil)
    old_dir = Dir.pwd
    base_dir ||= File.join(Dir.pwd, "dumps")
    Dir.mkdir(base_dir)
    AnnotationTask.all.each do |at|
        Dir.chdir(base_dir)
        sub_dir = at.id.to_s
        Dir.mkdir(sub_dir)
        Dir.chdir(File.join(base_dir, sub_dir))
        # dump schematic
        schematic_file = File.join(base_dir, sub_dir, "schematic")
        File.open(schematic_file, 'w') {|f| f.write(at.scene.schematic)}
        # dump question
        question_file = File.join(base_dir, sub_dir, "question")
        File.open(question_file, 'w') {|f| f.write(at.question)}
        # dump responses
        resp_dir = "responses"
        Dir.mkdir(File.join(base_dir, sub_dir, resp_dir))
        Dir.chdir(File.join(base_dir, sub_dir, resp_dir))
        at.responses.each do |resp|
            response_file = File.join(base_dir, sub_dir, resp_dir, resp.user_id.to_s)
            File.open(response_file, 'w') {|f| f.write(resp.answer)}
        end
    end
    Dir.chdir(old_dir)
end

