# frozen_string_literal: true

class MuteService < BaseService
  def call(account, target_account, notifications: nil)
    return if account.id == target_account.id
    FeedManager.instance.clear_from_timeline(account, target_account)
    account.mute!(target_account, notifications: notifications)
  end
end
