json.extract! patient, :id, :name, :dob, :email, :blood_group, :test_date, :result, :inference_from_test, :staff_that_took_test, :created_at, :updated_at
json.url patient_url(patient, format: :json)
