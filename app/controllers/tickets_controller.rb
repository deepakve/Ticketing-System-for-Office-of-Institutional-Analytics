class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:create, :new]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket[:user_id]
      @ticket[:status] = 'Assigned'
    else
      @ticket[:status] = 'To be Assigned'
    end
    
    respond_to do |format|
      if @ticket.save
          format.json { render :show, status: :created, location: @ticket }
          TicketNotifier.create_ticket(@ticket).deliver
        if session[:user_id]
          format.html { redirect_to tickets_url, notice: 'Ticket was successfully created.' }
          format.json { render :show, status: :created, location: @ticket }
        else
          format.html { redirect_to new_ticket_url, notice: 'Ticket was successfully created.' }
          format.json { render :show, status: :created, location: @ticket }
        end
        if @ticket[:user_id]
          TicketNotifier.assigned(@ticket).deliver
        end
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
    if @ticket[:status] == 'Completed'
    elsif @ticket[:user_id]
      @ticket[:status] = 'Assigned'
    else
      @ticket[:status] = 'To be Assigned'
    end
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
        if @ticket[:user_id]
          if  @ticket[:status] != 'Completed'
            TicketNotifier.assigned(@ticket).deliver
          end
        end
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:first_name, :last_name, :job_title, :department,
                                     :phone_number, :date_needed_by, :email, :priority,
                                     :position, :type_of_request, :purpose, :description,
                                     :time_period, :student_type, :campus, :irb, :grant_pi, :user_id,
                                     :status)
    end
end
