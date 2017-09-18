class ArticlesController < ApplicationController



  before_action :authenticate_user!, except: [ :index ]
  def index
    @articles = Article.all()
    render json: @articles
  end
  def create
    article = Article.create(
        title: params[:article][:title],
        body: params[:article][:body]
    )
    render json: { article: article }
  end

  def destroy

    if current_user
      ability = Ability.new(current_user)
      if ability.can? :destroy, Article
        Article.find(params[:id]).destroy
        render json: {'ok':'ok'}
      else
        render json: {'ok': 'no'}, :status => 401
      end
    else
      render json: {'ok': 'no'}, status => 401
    end

  end



end
