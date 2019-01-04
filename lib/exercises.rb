class ExercisesDataSource < Nanoc::DataSource
  identifier :exercises

  def items
    items = []
    Dir.foreach('../mastr/build/diff-eq') do |standard|
      next if ['.','..'].include? standard
      seeds = JSON.parse(File.read "../mastr/build/diff-eq/#{standard}/seeds.json")
      content = "<h2>#{seeds["title"]}</h2>\n"
      seed_ints = seeds["seeds"].map{|seed| seed["_seed"]}.sort
      seed_ints.each do |seed_int|
        content << "<h4>Example #{seed_int}</h4>"
        content << File.read("../mastr/build/diff-eq/#{standard}/#{seed_int.to_s.rjust(3, "0")}.html")
      end 
      items << new_item(
        content,
        {title: "Diff EQ #{standard}"},
        Nanoc::Identifier.new("/diff-eq/#{standard}.html"),
      )
    end

    return items
  end
end
