class RegisterUserScreen < PM::Screen
  include ScreenElements

  title "Provide Your Info"

  def will_appear
    view.styleId = "mainWindow"
    add button class: 'next'
    add text_field class: 'input', id: 'first_name'
    add text_field class: 'input', id: 'last_name'
  end

end