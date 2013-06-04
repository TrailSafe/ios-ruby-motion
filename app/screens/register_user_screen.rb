module Formotion
  class Form < Formotion::Base
    def tableView(tableView, willDisplayCell: cell, forRowAtIndexPath: indexPath)
      tableView.superview.styleId = "regform"
      tableView.styleClass = "regform-table-view"
      cell.styleClass = "regform-cell"
      cell.styleClass = "regform-cell-button"
      cell.updateStyles
    end

    def tableView(tableView, willDisplayHeaderView:view, forSection:section)
      view.styleClass = "regform-header"
    end
  end
end

class RegisterUserScreen < PM::FormotionScreen

  title "Provide Your Info"

  def will_appear
    view.styleId = "mainWindow"
    # submit_button = UIButton.new
    @button = add UIButton.buttonWithType(UIButtonTypeRoundedRect), {

    }
    @button.styleClass = 'next >'

# You have to set the title of a uicontrol with a method call instead of
# an attribute because of the different states a uicontrol can be in.
    @button.setTitle("Next", forState: UIControlStateNormal)
  end

  def table_data
    {
      sections: [{
                   title: "Provide Personal Info",
                   rows: [{
                            title: "Phone Number",
                            key: :phone_number,
                            placeholder: "(303) 555-1234",
                            type: :number
                          },{
                            title: "First Name",
                            key: :first_name,
                            placeholder: "Bob",
                            type: :string,
                            auto_correction: :no
                          }, {
                            title: "Last Name",
                            key: :last_name,
                            placeholder: "Yeti",
                            type: :string,
                            auto_correction: :no
                          }]
                 }]
    }
  end

end