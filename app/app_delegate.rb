class AppDelegate < PM::Delegate
  include AppConfig

  def on_load(app, options)
    Api.root_url = "#{api_root_url}/devices/#{device_id}/"
    Api.key = api_key
    check_application_status
  end

  private

  def check_application_status
    check_for_user {
      check_for_help_request {
        check_for_activity {
          open HomeScreen.new
        }
      }
    }
  end

  def check_for_user(&block)
    @user = User.fetch do |user|
      if user.present?
        yield
      else
        open RegisterUserScreen.new
      end
    end
  end

  def check_for_help_request(&block)
    HelpRequest.fetch do |help_request|
      if help_request.present?
        open HelpRequestShowScreen.new
      else
        yield
      end
    end
  end

  def check_for_activity(&block)
    Activity.fetch do |activity|
      if activity.present?
        open ActivityShowScreen.new
      else
        yield
      end
    end
  end

end
