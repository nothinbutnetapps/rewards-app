class RewardController < ApplicationController
  def index
    if current_user
      render json: available_rewards.to_json, status: :ok
    else
      head :unauthorized
    end
  end

  private

  def available_rewards
    Rewards.where.not(id: redeemed_reward_ids)
  end

  def redeemed_reward_ids
    Rewards.where(user_id: current_user.id).pluck(:reward_id)
  end

  def params
    params.permit(:username)
  end
end
