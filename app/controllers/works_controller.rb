class WorksController < ApplicationController
  before_action :require_user_logged_in, only: [:timeline, :new, :create, :edit, :update, :destroy]
  
  def show
    @work = Work.find(params[:id])
    moves = @work.moves.order(:number_of_move)
    previous_move = nil
    @answer_moves = moves.map do |move|
      teban = move.number_of_move.to_s + "： " + (move.number_of_move.odd? ? "▲" : "△")  
      if (move.column == previous_move&.column) && (move.row == previous_move&.row)
        sashite = "同" + move.piece + move.state
      else
        sashite = move.column.to_s + move.row.to_s.tr("123456789", "一二三四五六七八九") + move.piece + move.state
      end
      previous_move = move
      teban + sashite
    end
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
  
  def edit
    @work = current_user.works.find(params[:id])
  end
  
  def update
    @work = current_user.works.find(params[:id])
    if @work.update(work_params)
      flash[:success] = "作品を更新しました"
      redirect_to @work
    else
      flash[:danger] = "作品の更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @work = current_user.works.find(params[:id])
    @work.destroy!
    flash[:success] = "作品を削除しました。"
    redirect_to current_user
  end

  private

  def work_params
    params.require(:work).permit(:image, :title, :number_of_moves, :description, :hint, :explanation, moves_attributes: [:number_of_move, :column, :row, :piece, :state, :_destroy, :id])
  end
end
