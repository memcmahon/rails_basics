class AddressesController < ApplicationController
  def new
    call_student
    @address = @student.addresses.new()
  end

  def create
    call_student
    @address = @student.addresses.new(address_params)
    @address.save
    redirect_to student_path(@student)
  end

  private

  def call_student
    @student = Student.find(params[:student_id])
  end

  def address_params
    params.require(:address).permit(:description, :street, :city, :state, :zip)
  end
end
