class ExercisesDataSource < Nanoc::DataSource
  identifier :exercises

  def items
    items = []
    Dir.foreach("../tbil-la/exercises/build") do |standard|
      next if standard[0]=="."
      seeds = JSON.parse(File.read "../tbil-la/exercises/build/#{standard}/seeds.json")
      content = "<h2>#{seeds["title"]}</h2>\n"
      (1..50).each do |seed_int|
        content << "<h4>Example #{seed_int}</h4>"
        content << File.read("../tbil-la/exercises/build/#{standard}/#{seed_int.to_s.rjust(3, "0")}.html")
      end 
      items << new_item(
        content,
        {title: "Linear Algebra #{standard}"},
        Nanoc::Identifier.new("/lin-alg/#{standard}.html"),
      )
    end

    return items
  end
end
