class HomeScreen < PM::Screen

  def will_appear
    set_attributes self.view, {
      backgroundColor: UIColor.blueColor
    }
  end

end