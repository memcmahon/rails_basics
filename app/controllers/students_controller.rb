class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end

end
