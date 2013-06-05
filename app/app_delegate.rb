class AppDelegate < PM::Delegate
  include AppConfig

  def on_load(app, options)
    Api.root_url = "#{api_root_url}/devices/#{device_id}/"
    Api.key = api_key
    check_for_user
  end

  def check_for_user
    @user = User.fetch do |user|
      if user.present?
        check_for_help_request
      else
        open RegisterUserScreen.new
      end
    end
  end

  def check_for_help_request
    HelpRequest.fetch do |help_request|
      if help_request.present?
        open HelpRequestShowScreen.new
      else
        check_for_activity
      end
    end
  end

  def check_for_activity
    Activity.fetch do |activity|
      if activity.present?
        open ActivityShowScreen.new
      else
        open HomeScreen.new
      end
    end
  end

end
