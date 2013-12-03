require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 'Mole Valley’s Natural History'" do
      visit root_path
      expect(page).to have_content('Mole Valley’s Natural History')
    end

    it "should have a title" do
      visit root_path
      expect(page).to have_title("Mole Valley’s Natural History")
    end
  end

  describe "Contact page" do

    it "should have the content 'Contact Us'" do
      visit contact_path
      expect(page).to have_content('Contact Us')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title("Contact Mole Valley's Natural History ")
    end
  end
end
