require 'rails_helper'

describe "user can edit an existing student" do
  describe "they visit edit_student_path" do
    it "they can edit the student name" do
      student_1 = Student.create!(name: "James Potter")
      student_2 = Student.create!(name: "Remus Lupin")
      visit edit_student_path(student_1)

      fill_in("student[name]", with: "Prongs")
      click_on("Update Student")

      expect(page).to have_content("Prongs")
      expect(page).to_not have_content("James")
      expect(page).to_not have_content("Remus")
    end
  end
end
