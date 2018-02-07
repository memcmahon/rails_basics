require 'rails_helper'

describe "user can see a list of all students" do
  describe "user visits students_path" do
    it "they see a list of all students" do
      student_1 = Student.create!(name: "Sirius Black")
      student_2 = Student.create!(name: "James Potter")
      student_3 = Student.create!(name: "Remus Lupin")
      visit students_path

      expect(page).to have_content("All Students:")
      expect(page).to have_content("Sirius Black")
      expect(page).to have_content("James Potter")
      expect(page).to have_content("Remus Lupin")
    end
  end
end
