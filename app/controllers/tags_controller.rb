class TagsController < ApplicationController
  before_action :set_article, only: [:destroy]
  before_action :require_login, only: [:destroy]
  
  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
    tag = @tag.name
    id = @tag.id
    Tagging.where('article_id = ?', id).destroy_all
    @tag.destroy
    flash.notice = "Article '#{tag}' Deleted!"

    redirect_to tags_path
  end

  private


    def set_article
      @tag = Tag.find(params[:id])
    end
end
