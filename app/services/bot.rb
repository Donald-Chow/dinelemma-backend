# create a service to allow bot voting
class Bot
  def initialize
    @bot = User.find_by_email('bot@wagon.com')
  end

  def vote(session_id)
    votes = @bot.votes.where(result: nil, vote_session_id: session_id)
    until check_vote?(votes)
      votes.each do |vote|
        vote.result = [0, 1].sample
        vote.save
      end
    end
  end

  private

  def check_vote?(votes)
    votes.any?(&:yes?)
  end

end
