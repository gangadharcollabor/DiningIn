class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end


  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end



  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
	
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end


  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end



  # POST /users
  # POST /users.xml
  def create
	  @user = User.new(params[:user])
	  @user.created_by = 15
	  
	  @user.save
	   flash[:message] ="User created successfully!"
	  redirect_to "/users"
	  
	  # have to put the code in case of error
	  
  end


  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    @user.firstname = @user.firstname.strip
    
	@user.update_attributes(params[:user])
   
    flash[:message] ="User updated successfully!"

	redirect_to "/users"
	
	# have to put the code in case of error
	
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  
  
  # in users_controller.rb
def check_email
@user = User.find_by_email(params[:user][:email])
 
respond_to do |format|
format.json { render :json => !@user }
end
end


def checkuser
  @user = User.find_by_username(params[:user_username])
  if @user
    render :text => true, :layout => false
  elsif params[:user_username].blank?
    render :text => true, :layout => false
  else
    render :text => false, :layout => false
  end
end



  
end
