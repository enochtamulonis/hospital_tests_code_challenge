class PatientMailer < ApplicationMailer
  def patient_results_email
    @patient = params[:patient]

    mail(to: @patient.email, subject: "Test Results")
  end
end
