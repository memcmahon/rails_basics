require 'rails_helper'

describe "user can create a new student" do
  describe "user visits new_student_path" do
    it "they can create a new student" do
      student = Student.create!(name: "Sirius Black")
      visit new_student_path

      fill_in("student[name]", with: "James Potter")
      click_on("Create Student")

      expect(page).to have_content("James Potter")
      expect(page).to_not have_content("Sirius Black")
    end
  end
end
