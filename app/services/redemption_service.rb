class PriceChangedError < StandardError; end
class InsufficientFundsError < StandardError; end

class RedemptionService
  class << self
    def redeem(reward_id:, client_purchase_price:, user:)
      reward = Reward.find(reward_id)

      # double check that in the event that the reward price changes,
      # the user is not charged for a different amount than they intended
      raise PriceChangedError if client_purchase_price != reward.price
      raise InsufficientFundsError if user.points < reward.price

      ActiveRecord::Base.transaction do
        user.update!(points: user.points - reward.price)
        Redemption.create!(user:, reward:, price: reward.price)
      end
    end
  end
end