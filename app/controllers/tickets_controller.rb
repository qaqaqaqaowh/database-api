class TicketsController < ApplicationController

  def give_ticket
    @ticket = Ticket.new(user_id: params[:id])
    @ticket.save
    render status: 200
  end

  def index
    @tickets = Ticket.all
    render json: @tickets.to_json(except: :user_id)
  end

  def user_tickets
    @user = User.find(params[:id])
    @tickets = @user.tickets
    render json: @tickets
  end

  def consume_ticket
    @user = User.find(params[:id])
    if @ticket = @user.tickets.first
      @ticket.destroy
      render status: 200
    else
      render status: 403
    end
  end

end
