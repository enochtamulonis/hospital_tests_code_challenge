require 'test_helper'

class PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get patients_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_url
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post patients_url, params: { patient: { blood_group: @patient.blood_group, dob: @patient.dob, email: @patient.email, inference_from_test: @patient.inference_from_test, name: @patient.name, result: @patient.result, staff_that_took_test: @patient.staff_that_took_test, test_date: @patient.test_date } }
    end

    assert_redirected_to patient_url(Patient.last)
  end

  test "should show patient" do
    get patient_url(@patient)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_url(@patient)
    assert_response :success
  end

  test "should update patient" do
    patch patient_url(@patient), params: { patient: { blood_group: @patient.blood_group, dob: @patient.dob, email: @patient.email, inference_from_test: @patient.inference_from_test, name: @patient.name, result: @patient.result, staff_that_took_test: @patient.staff_that_took_test, test_date: @patient.test_date } }
    assert_redirected_to patient_url(@patient)
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete patient_url(@patient)
    end

    assert_redirected_to patients_url
  end
end
