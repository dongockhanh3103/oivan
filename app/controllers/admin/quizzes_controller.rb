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
    #
    # {
    #  "quiz": {
    #     "name":"Math",
    #     "description":"Improve yourself"
    #  },
    #  "questions":[
    #     {
    #        "label":"Apple",
    #        "description":"An has an apple.
    #                       Bao's going to give An an apple? The apple belongs to An?",
    #        "answers":[
    #           {
    #              "content":"Nothing"
    #           },
    #           {
    #              "content":"2",
    #              "correct": "on"
    #           }
    #        ]
    #     }
    #  ]
    # }
    def create
      result = Admin::QuizOperation::CreateQuiz.execute(
        build_create_quiz_params,
        build_create_questions_params,
        current_user
      )

      respond_to do |format|
        if result
          format.html { redirect_to admin_quizzes_path, notice: 'Quiz was successfully updated.' }
        else
          format.html { render :new }
        end
      end
    end

    # GET /admin/quizzes/:id
    def show
      result = Admin::QuizOperation::GetQuiz.execute(params)

      if result[:success]
        @quiz = result[:quiz]
        @questions = result[:questions]
      else
        render_404
      end
    end

    # GET /admin/quizzes/:id/edit
    def edit; end

    # PUT /admin/quizzes/:id
    def update; end

    # DELETE /admin/quizzes/:id
    def destroy
      response = Quiz.destroy(params[:id])

      respond_to do |format|
        if response
          format.html { redirect_to admin_quizzes_path, notice: 'Quiz was successfully deleted.' }
        else
          format.html { redirect_to admin_quizzes_path, notice: 'Quiz was failure deleted.' }
        end
      end
    end

    private

    def build_create_quiz_params
      params.require(:quiz).permit(:name, :description)
    end

    def build_create_questions_params
      params.permit(questions: [:label, :description, answers: %i[content correct]])
    end

  end
end
