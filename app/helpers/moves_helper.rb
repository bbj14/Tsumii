module MovesHelper
  def moves_button(num)
    link_to "#{num}手", moves_works_path(num), class: "btn btn-dark btn-lg rounded-pill mr-3 mb-3", style: "width: 80px;"
  end
  
  def moves_drop_link(num)
    link_to "#{num}手詰", moves_works_path(num), class: "dropdown-item"
  end
end
