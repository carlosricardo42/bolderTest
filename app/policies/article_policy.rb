class ArticlePolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @article = model
  end

   def index?
     true
   end

   def show?
     true
   end

   def destroy?
     @current_user.admin?
   end

   def new?
      @current_user.admin? or @current_user.writer?
   end

   def create?
      @current_user.admin? or @current_user.writer?
   end

   def update?
     @current_user.admin? or @current_user == @article.user
   end
end
