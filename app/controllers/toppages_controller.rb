class ToppagesController < ApplicationController
  def index
    @works_popular = Work.all
    @works_recent = Work.all
  end
end
