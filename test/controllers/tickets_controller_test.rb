require 'test_helper'

class TicketsControllerTest < ActionController::TestCase
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tickets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post :create, ticket: { campus: @ticket.campus, date_needed_by: @ticket.date_needed_by, department: @ticket.department, description: @ticket.description, email: @ticket.email, first_name: @ticket.first_name, job_title: @ticket.job_title, last_name: @ticket.last_name, phone_number: @ticket.phone_number, position: @ticket.position, priority: @ticket.priority, purpose: @ticket.purpose, student_type: @ticket.student_type, time_period: @ticket.time_period, type_of_request: @ticket.type_of_request }
    end

    assert_redirected_to ticket_path(assigns(:ticket))
  end

  test "should show ticket" do
    get :show, id: @ticket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ticket
    assert_response :success
  end

  test "should update ticket" do
    patch :update, id: @ticket, ticket: { campus: @ticket.campus, date_needed_by: @ticket.date_needed_by, department: @ticket.department, description: @ticket.description, email: @ticket.email, first_name: @ticket.first_name, job_title: @ticket.job_title, last_name: @ticket.last_name, phone_number: @ticket.phone_number, position: @ticket.position, priority: @ticket.priority, purpose: @ticket.purpose, student_type: @ticket.student_type, time_period: @ticket.time_period, type_of_request: @ticket.type_of_request }
    assert_redirected_to ticket_path(assigns(:ticket))
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete :destroy, id: @ticket
    end

    assert_redirected_to tickets_path
  end
end
