require 'rails_helper'

describe RaffleService do
  before :each do
    @campaign = create(:campaign, status: :pending)
  end

  describe '#call' do
    context 'when has more then two members' do
      before(:each) do
        create(:member, campaign: @campaign)
        create(:member, campaign: @campaign)
        create(:member, campaign: @campaign)
        @campaign.reload

        @results = RaffleService.new(@campaign).call
      end

      it 'results is a hash' do
        expect(@results.class).to eq(Hash)
      end

      it 'all members are in results as a member' do
        result_members = @results.map(&:last)
        expect(result_members.sort).to eq(@campaign.members.sort)
      end

      it 'all member are in results as a friend' do
        result_friends = @results.map(&:last)
        expect(result_friends.sort).to eq(@campaign.members.sort)
      end

      it 'a member dont get yourself' do
        @results.each do |r|
          expect(r.first).not_to eq(r.last)
        end
      end

      it 'a member x dont get a member y that get the member x' do
        @results.each do |r|
          member = r.first
          friend = r.last
          friend_raffled = @results.select do |hash|
            hash == friend
          end
          expect(friend_raffled.to_a.flatten.last).not_to eq(member)
        end
      end
    end

    context 'when dont has more then two members' do
      before(:each) do
        create(:member, campaign: @campaign)
        @campaign.reload

        @response = RaffleService.new(@campaign).call
      end

      it 'return false' do
        expect(@response).to eql(false)
      end
    end
  end
end
