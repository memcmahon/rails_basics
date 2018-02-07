require 'rails_helper'

describe "user sees all student addresses" do
  describe "they visit the student_path" do
    it "they see all addresses for that student" do
      student = Student.create!(name: "Sirius Black")
      address_1 = student.addresses.create!(description: "Home", street: "12 Grimmauld Place", city: "London", state: "UK", zip: "77777")
      address_1 = student.addresses.create!(description: "School", street: "Gryffindor Tower", city: "Hogsmeade", state: "UK", zip: "77767")

      visit student_path(student)

      expect(page).to have_content("Home")
      expect(page).to have_content("12 Grimmauld Place")
      expect(page).to have_content("London")
      expect(page).to have_content("UK")
      expect(page).to have_content("77777")
      expect(page).to have_content("School")
      expect(page).to have_content("Gryffindor Tower")
      expect(page).to have_content("Hogsmeade")
      expect(page).to have_content("77767")
    end
  end
end
