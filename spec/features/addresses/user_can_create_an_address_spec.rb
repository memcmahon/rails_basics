require 'rails_helper'

describe "user can create an address" do
  describe "they visit new_student_addresses_path" do
    it "they can create a new address" do
      student = Student.create!(name: "Sirius Black")
      visit new_student_address_path(student)

      fill_in("address[description]", with: "Home")
      fill_in("address[street]", with: "12 Grimmauld Place")
      fill_in("address[city]", with: "London")
      fill_in("address[state]", with: "UK")
      fill_in("address[zip]", with: "77777")
      click_on("Submit")

      expect(current_path).to eq(student_path(student))
      expect(page).to have_content("Sirius Black")
      expect(page).to have_content("12 Grimmauld Place")
    end
  end
end
