require 'rails_helper'

describe "user sees enrolled students on course show page" do
  describe "they visit course_path" do
    it "they can see all enrolled students" do
      course = Course.create!(subject: "Defense Against the Dark Arts")
      student_1 = Student.create!(name: "James Potter")
      student_2 = Student.create!(name: "Remus Lupin")
      student_3 = Student.create!(name: "Sirius Black")
      student_4 = Student.create!(name: "Peter Pettigrew")
      StudentCourse.create!(student: student_1, course: course)
      StudentCourse.create!(student: student_2, course: course)
      StudentCourse.create!(student: student_3, course: course)
      StudentCourse.create!(student: student_4, course: course)

      visit course_path(course)

      expect(page).to have_content("Defense Against the Dark Arts - Enrolled Students")
      expect(page).to have_content("James Potter")
      expect(page).to have_content("Remus Lupin")
      expect(page).to have_content("Peter Petigrew")
      expect(page).to have_content("Sirius Black")
    end
  end
end
