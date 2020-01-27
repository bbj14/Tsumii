class WorksController < ApplicationController
  def show
    @work = Work.find(params[:id])
  end
  
  def popular
    @works = Work.all
  end
  
  def recent
    @works = Work.all.order(created_at: :desc)
  end
  
  def moves
    @works = Work.where(number_of_moves: params[:number_of_moves])
    @moves = params[:number_of_moves]
  end
  
  def new
    @work = Work.new
  end
  
  def create
    @work = current_user.works.build(work_params)
    if @work.save
      flash[:success] = '作品を投稿しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '作品の投稿に失敗しました。'
      render :new
    end
  end

  def destroy
  end

  private

  def work_params
    params.require(:work).permit(:image, :title, :number_of_moves, :description, :hint, :explanation)
  end
end
