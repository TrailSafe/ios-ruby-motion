class RegisterUserScreen < PM::Screen
  include ScreenElements

  title "Provide Your Info"

  def will_appear
    view.styleId = "mainWindow"
    add button class: 'next'
    add UILabel.new, {
      text:    "Register",
      resize:  [:left, :right, :top, :bottom, :width, :height],
      styleId: 'title'
    }

    add UILabel.new, {
      text:    "Enter your info",
      resize:  [:left, :right, :top, :bottom, :width, :height],
      styleId: 'sub-title'
    }

    @first_name = add UITextField.alloc.init,
                     placeholder: 'First Name',
                     styleId:     'first_name'

    @last_name = add UITextField.alloc.init,
                     placeholder: 'Last Name',
                     styleId:     'last_name'


    @phone_number = add UITextField.alloc.init,
                        placeholder:  '(555) 123-1234',
                        keyboardType: UIKeyboardTypeNumberPad,
                        styleId:      'phone_number'

  end

end