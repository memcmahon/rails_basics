require 'rails_helper'

describe "user navigation" do
  describe "they can link to students_path and new from any page" do
    it "they visit students_path" do
      visit students_path

      click_on("Student Index")

      expect(current_path).to eq(students_path)

      visit students_path

      click_on("New Student")

      expect(current_path).to eq(new_student_path)
    end

    it "they visit student_path" do
      student = Student.create!(name: "Sirius Black")
      visit student_path(student)

      click_on("Student Index")

      expect(current_path).to eq(students_path)

      visit student_path(student)

      click_on("New Student")

      expect(current_path).to eq(new_student_path)
    end

    it "they visit edit_student_path" do
      student = Student.create!(name: "Sirius Black")
      visit edit_student_path(student)

      click_on("Student Index")

      expect(current_path).to eq(students_path)

      visit edit_student_path(student)

      click_on("New Student")

      expect(current_path).to eq(new_student_path)
    end

    it "they visit new_student_path" do
      student = Student.create!(name: "Sirius Black")
      visit new_student_path(student)

      click_on("Student Index")

      expect(current_path).to eq(students_path)

      visit new_student_path(student)

      click_on("New Student")

      expect(current_path).to eq(new_student_path)
    end
  end
end
