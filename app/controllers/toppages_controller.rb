class ToppagesController < ApplicationController
  def index
    @works_popular = Work.order_by_likes.first(6)
    @works_recent = Work.all.order(created_at: :desc).first(6)
  end
end
