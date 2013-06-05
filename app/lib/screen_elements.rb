module ScreenElements

  def button(options={})
    type = options[:type] || UIButtonTypeRoundedRect
    style_element_from_options(UIButton.buttonWithType(type), options)
  end

  def label(options={})
    style_element_from_options(UILabel.new, options)
  end

  def text_field(options={})
    style_element_from_options(UITextField.alloc.init, options)
  end

  def switch(options={})
    style_element_from_options(UISwitch.alloc.init, options)
  end

  def slider(options={})
    style_element_from_options(UISlider.alloc.init, options).tap do |s|
      s.minimumValue = options[:from]
      s.maximumValue = options[:to]
      s.value = options[:value]
    end
  end

  private

  def style_element_from_options(element, options)
    element.tap do |e|
      e.styleClass = options[:class].to_s
      e.styleId = options[:id].to_s
    end
  end

end