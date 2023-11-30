class ProfilesController < ApplicationController

  def show
    @occasion = Occasion.find(params[:occasion_id])
    @profile = @occasion.profile
    @favorite = @profile.favorite
  end

  def edit
    @occasion = Occasion.find(params[:occasion_id])
    @profile = @occasion.profile
  end



  def update
    @profile = Profile.find(params[:id])
    @occasion = Occasion.find @profile.occasion_id
    # @favorite = Favorite.new(param_strong)
    @favorite = Favorite.new(favorites: params[:profile][:favorites], hobbies: params[:profile][:hobbies], activities: params[:profile][:activities])
    @favorite.occasion = @occasion
    @favorite.user = current_user
    if @favorite.save!
      redirect_to @occasion, notice: 'Questionnaire is saved.'
    else
      render :new, alert: :unprocessable_entity
    end
  end


  def questionnaire
    @profile = Profile.find(params[:id])
    @questions = Question.all
  end

  def user_answers
    params[:answers].each do |question_id, answer_id|
      UserAnswer.create(user: current_user, question_id:, answer_id:)
    end
  end

  private

  def param_strong
    params.require(:profile).permit(:favorites, :recipient, :myoccasion, :gift, :hobbies)
  end
end
