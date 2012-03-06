class ConsultationsController < ApplicationController
  # GET /consultations
  # GET /consultations.json
  def index
    @consultations = Consultation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @consultations }
    end
  end

  # GET /consultations/1
  # GET /consultations/1.json
  def show
    @consultation = Consultation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @consultation }
    end
  end

  # GET /consultations/new
  # GET /consultations/new.json
  def new
    @customer = Customer.find(params[:id])
    @consultation = @customer.consultations.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @consultation }
    end
  end

  # GET /consultations/1/edit
  def edit
    @consultation = Consultation.find(params[:id])
  end

  # POST /consultations
  # POST /consultations.json
  def create
    @consultation = Consultation.new(params[:consultation])

    respond_to do |format|
      if @consultation.save
        format.html { redirect_to @consultation, notice: 'Consultation was successfully created.' }
        format.json { render json: @consultation, status: :created, location: @consultation }
      else
        format.html { render action: "new" }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /consultations/1
  # PUT /consultations/1.json
  def update
    @consultation = Consultation.find(params[:id])

    respond_to do |format|
      if @consultation.update_attributes(params[:consultation])
        format.html { redirect_to @consultation, notice: 'Consultation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consultations/1
  # DELETE /consultations/1.json
  def destroy
    @consultation = Consultation.find(params[:id])
    @consultation.destroy

    respond_to do |format|
      format.html { redirect_to consultations_url }
      format.json { head :ok }
    end
  end
end
