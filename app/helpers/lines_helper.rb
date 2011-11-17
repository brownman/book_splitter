module LinesHelper
  def nested_lines(lines)
    lines.map do |line, sub_lines|
      render(line) + content_tag(:div, nested_lines(sub_lines), :class => "nested_lines")
    end.join.html_safe
  end
end
