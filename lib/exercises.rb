class ExercisesDataSource < Nanoc::DataSource
  identifier :exercises

  def items
    items = []
    Dir.foreach('../mastr/build/diff-eq') do |standard|
      next if ['.','..'].include? standard
      content = ""
      Dir.foreach("../mastr/build/diff-eq/#{standard}") do |seed|
        next unless seed[-5..-1]==".html"
        content << File.read("../mastr/build/diff-eq/#{standard}/#{seed}")
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
