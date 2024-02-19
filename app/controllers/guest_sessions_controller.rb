class GuestSessionsController < ApplicationController
  def create
    user = User.find_or_create_by(name: "ゲストユーザー", email: "guest@example.com") do |user|
    end
  end
end
