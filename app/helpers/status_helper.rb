module StatusHelper
  def text_color(status)
    if status == "Declined"
      "text-red"
    elsif status == "Accepted"
      "text-green"
    elsif status == "Pending"
      "text-grey"
    end
  end
end
