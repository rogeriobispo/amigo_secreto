module PagesHelper
  def logged_user_with_campaign?
    current_user && @campaigns.present?
  end
end
