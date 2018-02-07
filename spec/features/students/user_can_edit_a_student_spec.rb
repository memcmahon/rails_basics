require 'rails_helper'

describe "user can edit an existing student" do
  describe "they visit edit_student_path" do
    it "they can edit the student name" do
      student = Student.create!(name: "James Potter")
      visit edit_student_path(student)

      fill_in("student[name]", with: "Jimmy Potter")

      expect(page).to have_content("Jimmy Potter")
      expect(page).to_not have_content("James")
    end
  end
end
