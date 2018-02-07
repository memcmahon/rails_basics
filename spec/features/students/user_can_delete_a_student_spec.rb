require 'rails_helper'

describe "user can delete a student" do
  describe "they visit students_path" do
    it "they can delete a student" do
      student_4 = Student.create!(name: "Peter Pettigrew")
      student_1 = Student.create!(name: "Sirius Black")
      student_2 = Student.create!(name: "Remus Lupin")
      student_3 = Student.create!(name: "James Potter")
      visit students_path

      click_on("Delete", match: :first)

      expect(page).to_not have_content("Peter Pettigrew")
      expect(page).to_not have_content("Sirius Black")
      expect(page).to have_content("Remus Lupin")
      expect(page).to have_content("James Potter")
      expect(Student.count).to eq(3)
    end
  end
end
