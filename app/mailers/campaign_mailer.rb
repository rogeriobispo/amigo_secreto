class CampaignMailer < ApplicationMailer
  add_template_helper(CampaignsHelper)
  def raffle(campaign, member, friend)
    @campaign = campaign
    @member = member
    @friend = friend
    mail to: @member.email, subject: "Nosso Amigo Secreto: #{@campaign.title}"
  end

  def raffle_failed(campaign)
    @campaign = campaign
    @user = campaign.user
    mail to: @user.email, subject: "Nosso Amigo Secreto: #{@campaign.title}"
  end
end
