require 'test_helper'

class FileUploadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @file_uploader = file_uploaders(:one)
  end

  test "should get index" do
    get file_uploaders_url
    assert_response :success
  end

  test "should get new" do
    get new_file_uploader_url
    assert_response :success
  end

  test "should create file_uploader" do
    assert_difference('FileUploader.count') do
      post file_uploaders_url, params: { file_uploader: {  } }
    end

    assert_redirected_to file_uploader_url(FileUploader.last)
  end

  test "should show file_uploader" do
    get file_uploader_url(@file_uploader)
    assert_response :success
  end

  test "should get edit" do
    get edit_file_uploader_url(@file_uploader)
    assert_response :success
  end

  test "should update file_uploader" do
    patch file_uploader_url(@file_uploader), params: { file_uploader: {  } }
    assert_redirected_to file_uploader_url(@file_uploader)
  end

  test "should destroy file_uploader" do
    assert_difference('FileUploader.count', -1) do
      delete file_uploader_url(@file_uploader)
    end

    assert_redirected_to file_uploaders_url
  end
end
