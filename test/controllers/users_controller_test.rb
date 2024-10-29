require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { age: @user.age, country: @user.country, email: @user.email, gender: @user.gender, name: @user.name, nationality: @user.nationality, patronymic: @user.patronymic, user_full_name: @user.user_full_name } }, as: :json
    end

    assert_response :created
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { age: @user.age, country: @user.country, email: @user.email, gender: @user.gender, name: @user.name, nationality: @user.nationality, patronymic: @user.patronymic, user_full_name: @user.user_full_name } }, as: :json
    assert_response :success
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user), as: :json
    end

    assert_response :no_content
  end
end
