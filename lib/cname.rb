class CnameDataSource < Nanoc::DataSource
  identifier :cname

  def items
    [new_item(
        "mastr.clontz.org",
        {},
        Nanoc::Identifier.new("/CNAME"),
    )]
  end
end
