class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    call_student
    @addresses = @student.addresses
    @courses = @student.courses
  end

  def new
    @student = Student.new()
  end

  def create
    @student = Student.new(student_params)
    @student.save
    redirect_to student_path(@student)
  end

  def edit
    call_student
  end

  def update
    call_student
    @student.update(student_params)
    redirect_to student_path(@student)
  end

  def destroy
    call_student
    @student.destroy
    redirect_to students_path
  end

  private

  def call_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name)
  end

end
