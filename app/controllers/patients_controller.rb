class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
    @page_name = "Home Page |"
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @page_name = "Patient | #{@patient.name}"
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    @page_name = "Creating Patient | "

  end

  def search
    if params[:date_from].present? || params[:date_to].present? || params[:result].present?
      @date_from = parsed_date(params[:date_from], 7.days.ago.to_date.strftime("%m/%d/%Y").to_s)
      @date_to = parsed_date(params[:date_to], Date.today.strftime("%m/%d/%Y").to_s)
      searched_results = Patient.where('test_date BETWEEN ? AND ?', @date_from, @date_to)
      if params[:result].present?
        @results = searched_results.where('result LIKE ?', params[:result])
      else
        @results = searched_results
      end
    else
      redirect_to root_path, notice: "You need to specify your search"
    end
  end

  # GET /patients/1/edit
  def edit
    @page_name = "Editing Info | #{@patient.name}"
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    respond_to do |format|
      if @patient.save
        PatientMailer.with(patient: @patient).patient_results_email.deliver_later

        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def parsed_date(date_string, default)
      if date_string.present?
        date_string
      else
        default
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_params
      params.require(:patient).permit(:name, :dob, :email, :blood_group, :test_date, :result, :inference_from_test, :staff_that_took_test)
    end
end
