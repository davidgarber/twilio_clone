class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @contact = Contact.find(params[:contact_id])
    @message = @contact.messages.new
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @message = @contact.messages.new(message_params)
    @message.to = @contact.number
        if @message.save
      flash[:notice] = "Your message has been sent."
      redirect_to contact_path(@contact)
    else
      render 'new'
    end
  end

  def show
    @contact = Contact.find(params[:contact_id])
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
