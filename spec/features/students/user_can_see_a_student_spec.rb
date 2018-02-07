require 'rails_helper'

describe "user can see a student" do
  describe "visit student_path" do
    it "they see info for an individual student" do
      student = Student.create!(name: "Sirius Black")
      visit student_path(student)

      expect(page).to have_content("Name: Sirius Black")
    end
  end
end
