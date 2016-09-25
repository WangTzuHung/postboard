module Voteable
  def up_votes
    votes.where(vote: true).length
  end

  def down_votes
    votes.where(vote: false).length
  end

  def total_votes
    up_votes - down_votes
  end
end