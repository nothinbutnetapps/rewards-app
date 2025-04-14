class RewardController < ApplicationController
  def index
    if current_user
      render json: rewards_with_redeemed_status.to_json, status: :ok
    else
      head :unauthorized
    end
  end

  private

  def rewards_with_redeemed_status
    rewards = Reward.all

    rewards.map do |reward|
      reward.as_json.merge(redeemed: redeemed_reward_ids.include?(reward.id))
    end
  end

  def redeemed_reward_ids
    @redeemed_reward_ids ||= Redemption.where(user_id: current_user.id).pluck(:reward_id)
  end
end
