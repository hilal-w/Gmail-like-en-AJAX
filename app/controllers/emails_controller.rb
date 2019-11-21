class EmailsController < ApplicationController
  def index
  	@emails = Email.all
  end

  def create
  	@email = Email.create(object: Faker::Internet.email, body: Faker::Music.album,read: false)
  	respond_to do |format|
      format.js { }
    end
  end

  def show

  	 @email = Email.find(params[:id])
     @email.read = true
     @email.save

  	 respond_to do |format|
      format.js { }
      format.html{ }
    end
  end

  def update
    @email = Email.find(params[:id])
    if @email.read == false 
      @email.read = true
      @email.save
    else
      @email.read = false
      @email.save
    end
    respond_to do |format|
      format.js {  }
      format.html{ redirect_to root_path }
    end
  end

  def destroy

    @email = Email.find(params[:id])
    @email.destroy

  	respond_to do |format|
      format.js {  }
      format.html{ redirect_to root_path }
    end

  end


end
