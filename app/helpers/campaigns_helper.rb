module CampaignsHelper
  def open_number(campaign)
    "#{campaign.count_opened}/#{campaign.members.count}"
  end

  def first_name(user)
    user.name.split(' ')[0]
  end
end
