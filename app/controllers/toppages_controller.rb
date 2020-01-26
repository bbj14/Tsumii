class ToppagesController < ApplicationController
  def index
    @works_popular = Work.all
    @works_recent = Work.all.order(created_at: :desc).first(6)
  end
end
