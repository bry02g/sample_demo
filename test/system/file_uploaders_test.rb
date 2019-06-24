require "application_system_test_case"

class FileUploadersTest < ApplicationSystemTestCase
  setup do
    @file_uploader = file_uploaders(:one)
  end

  test "visiting the index" do
    visit file_uploaders_url
    assert_selector "h1", text: "File Uploaders"
  end

  test "creating a File uploader" do
    visit file_uploaders_url
    click_on "New File Uploader"

    click_on "Create File uploader"

    assert_text "File uploader was successfully created"
    click_on "Back"
  end

  test "updating a File uploader" do
    visit file_uploaders_url
    click_on "Edit", match: :first

    click_on "Update File uploader"

    assert_text "File uploader was successfully updated"
    click_on "Back"
  end

  test "destroying a File uploader" do
    visit file_uploaders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "File uploader was successfully destroyed"
  end
end
