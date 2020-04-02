require 'test_helper'

class EmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @em = ems(:one)
  end

  test "should get index" do
    get ems_url
    assert_response :success
  end

  test "should get new" do
    get new_em_url
    assert_response :success
  end

  test "should create em" do
    assert_difference('Em.count') do
      post ems_url, params: { em: { department: @em.department, name: @em.name, price: @em.price } }
    end

    assert_redirected_to em_url(Em.last)
  end

  test "should show em" do
    get em_url(@em)
    assert_response :success
  end

  test "should get edit" do
    get edit_em_url(@em)
    assert_response :success
  end

  test "should update em" do
    patch em_url(@em), params: { em: { department: @em.department, name: @em.name, price: @em.price } }
    assert_redirected_to em_url(@em)
  end

  test "should destroy em" do
    assert_difference('Em.count', -1) do
      delete em_url(@em)
    end

    assert_redirected_to ems_url
  end
end
