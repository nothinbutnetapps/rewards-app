class RewardController < ApplicationController
  def create
    redemption = RedemptionService.redeem(
      reward_id: params[:reward_id],
      client_purchase_price: params[:client_purchase_price],
      user: current_user
    )

    render json: redemption.to_json, status: :ok
  rescue PriceChangedError, InsufficientFundsError, ActiveRecord::RecordInvalid
    render json: { error_message: 'something went wrong' }, status: :unprocessable_entity
  end
end
