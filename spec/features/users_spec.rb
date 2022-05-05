require 'rails_helper'

RSpec.feature "Users", type: :feature do

    context "Sign up" do
        before do
            visit new_user_registration_path
        end

        let(:email) { "test@uccs.edu" }
        let(:password) { "password" }

        scenario "should be successful" do
            fill_in "user_email", with: email
            fill_in "user_password", with: password
            fill_in "user_password_confirmation", with: password
            click_button "Submit"
            expect(page).to have_content("Welcome! You have signed up successfully.")
        end

        scenario "should fail" do
            fill_in "user_email", with: email
            fill_in "user_password", with: "a"
            fill_in "user_password_confirmation", with: "a"
            click_button "Submit"
            expect(page).to have_content("Password is too short")
        end
    end

    context "Login" do 
        before do 
            @user = FactoryBot.create(:user)
            visit new_user_session_path
        end

        scenario "should be successful" do
            fill_in "user_email", with: @user.email
            fill_in "user_password", with: @user.password
            click_button "Log in"
            expect(page).to have_content("Signed in successfully")
        end


    end
end