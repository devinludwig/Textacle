class ContactsController < ApplicationController
  def index
    @contacts = current_user.contacts
  end

  def new
    @contact = Contact.new
  end

  def create
      @contact = Contact.new(contact_params)
    if current_user.contacts.push(@contact)
      flash[:notice] = "Your contact was created."
      redirect_to user_contacts_path
    else
      render 'new'
    end
  end

  def show
    @contact = Contact.find(params[:id])
    @message = Message.new
  end

  def update
    @contact = Contact.find(contact_id)
    if current_user.contacts.update(contact_params)
      flash[:notice] = "Your contact was updated."
      redirect_to user_contact_path
    else
      render 'new'
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :number, :email)
  end

end
