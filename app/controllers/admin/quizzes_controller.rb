# frozen_string_literal: true

module Admin
  class QuizzesController < Admin::AdminController

    # GET /admin/quizzes
    def index
      @quizzes = Quiz.all.map { |quiz| QuizPresenter.new(quiz) }
    end

    # GET /admin/quizzes/new
    def new; end

    # POST /admin/quizzes
    def create
      result = Admin::QuizOperation::CreateQuiz.execute(build_create_quiz_params, current_user)

      respond_to do |format|
        if result[:success]
          format.html { redirect_to admin_quizzes_path, notice: 'Quiz was successfully updated.' }
        else
          format.html { render :new }
        end
      end
    end

    # GET /admin/quizzes/:id
    def show; end

    # GET /admin/quizzes/:id/edit
    def edit; end

    # PUT /admin/quizzes/:id
    def update; end

    # DELETE /admin/quizzes/:id
    def destroy; end

    private

    def build_create_quiz_params
      params.require(:quiz).permit(:name, :description)
    end

  end
end
