class WorksController < ApplicationController
  before_action :require_user_logged_in, only: [:timeline, :new, :create, :destroy]
  
  def show
    @work = Work.find(params[:id])
    @answer_moves = @work.moves.order(:number_of_move)
  end
  
  def popular
    @works = Work.order_by_likes
  end
  
  def recent
    @works = Work.all.order(created_at: :desc)
  end
  
  def moves
    @works = Work.where(number_of_moves: params[:number_of_moves])
    @moves = params[:number_of_moves]
  end
  
  def timeline
    @works = current_user.feed_works.order(created_at: :desc)
  end
  
  def new
    @work = current_user.works.build
    @work.moves.build
  end
  
  def create
    @work = current_user.works.build(work_params)
    if @work.save
      flash[:success] = '作品を投稿しました。'
      redirect_to current_user
    else
      flash.now[:danger] = '作品の投稿に失敗しました。'
      render :new
    end
  end

  def destroy
  end

  private

  def work_params
    params.require(:work).permit(:image, :title, :number_of_moves, :description, :hint, :explanation, moves_attributes: [:number_of_move, :column, :row, :piece, :state, :_destroy, :id])
  end
end
