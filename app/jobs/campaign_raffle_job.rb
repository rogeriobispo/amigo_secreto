class CampaignRaffleJob < ApplicationJob
  queue_as :emails

  def perform(campaign)
    results = RaffleService.new(campaign).call
    results = false

    campaign.members.each {|m| m.set_pixel}
    results.each do |r|
      CampaignMailer.raffle(campaign, r.first, r.last).deliver_now
    end
    campaign.update(status: :finished)

    unless results
      CampaignMailer.raffle_failed(campaign).deliver_now
    end
  end
end
