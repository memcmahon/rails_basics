require 'rails_helper'

describe "user sees all course enrollments on student page" do
  describe "they visit student_path" do
    it "they see all course enrollments" do
      student = Student.create!(name: "Sirius Black")
      course_1 = Course.create!(subject: "Defense Against the Dark Arts")
      course_2 = Course.create!(subject: "Transfiguration")
      course_3 = Course.create!(subject: "Potions")
      StudentCourse.create(student: student, course: course_1)
      StudentCourse.create(student: student, course: course_2)
      StudentCourse.create(student: student, course: course_3)
      visit student_path(student)

      expect(page).to have_content("Course List")
      expect(page).to have_content("Defense Against the Dark Arts")
      expect(page).to have_content("Transfiguration")
      expect(page).to have_content("Potions")
    end
  end
end
