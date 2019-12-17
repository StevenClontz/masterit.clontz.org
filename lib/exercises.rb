class ExercisesDataSource < Nanoc::DataSource
  identifier :exercises

  def items
    items = []
    courses = ['diff-eq', 'lin-alg']
    courses.each do |course|
      Dir.foreach("../mastr/build/#{course}") do |standard|
        next if ['.','..'].include? standard
        seeds = JSON.parse(File.read "../mastr/build/#{course}/#{standard}/seeds.json")
        content = "<h2>#{seeds["title"]}</h2>\n"
        seed_ints = seeds["seeds"].map{|seed| seed["_seed"]}.sort
        seed_ints.each do |seed_int|
          next if seed_int > 50
          content << "<h4>Example #{seed_int}</h4>"
          content << File.read("../mastr/build/#{course}/#{standard}/#{seed_int.to_s.rjust(3, "0")}.html")
        end 
        items << new_item(
          content,
          {title: "#{course.upcase} #{standard}"},
          Nanoc::Identifier.new("/#{course}/#{standard}.html"),
        )
      end
    end

    return items
  end
end
