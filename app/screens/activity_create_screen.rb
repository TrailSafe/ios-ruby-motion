class ActivityCreateScreen < PM::Screen

  def will_appear
    set_attributes self.view, {
      backgroundColor: UIColor.whiteColor
    }
  end
end