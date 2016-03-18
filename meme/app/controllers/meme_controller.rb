class MemeController < ApplicationController
  def delete
	@id=params[:id]
	@user=User.find(@id)
	@username=@user.username
	@user.destroy
  end
  def admin
	@administrator="administrator"
  end
  def adminlog
	@administrator="administrator"
	if params[:pass]=="password"
 		redirect_to(:action=>'admin', :administrator =>@administrator ) 
 	end 
  end
  def chatroom
	@id=params[:id]
  end
  def personal
	@currentuser=params[:currentuser]
	@id=params[:id]
	@user=User.find(@id)
	@username=@user.username
	@email = @user.email
	@major = @user.major
	@nationality = @user.nationality
	@nickname= @user.nickname
	@gender=@user.gender
	@birthday=@user.dateofbirth
  end
  def updatecomfirm
	@id=params[:id]
	@user=User.find(@id)
	@username=@user.username
	@email = params[:email]
	@major = params[:major]
	@nationality = params[:nation]
	@nickname= params[:nickname]
	@year=params[:year]
	@month=params[:month]
	@day=params[:day]
	@birthday=@month+'/'+@day+'/'+@year	
	@gender=params[:gender]
	@user.email = params[:email]
	@user.major = params[:major]
	@user.nationality = params[:nation]
	@user.nickname= params[:nickname]
	@user.dateofbirth=@birthday
	@user.gender=params[:gender]
	@user.save
  end
  def update
  end
  def memeuser
	@currentuser=params[:currentuser]
        
  end
  def save	
	@newuser= User.new
	@newuser.username = params[:username]
	@newuser.password = params[:password]
	@newuser.email = params[:email]
	@newuser.major = params[:major]
	@newuser.nationality = params[:nation]
	@newuser.nickname= params[:nickname]
	@newuser.gender=params[:gender]
	@newuser.dateofbirth=params[:birthday]
	@newuser.save
  end
  def comfirm
	@username = params[:username]
	@password = params[:password]
	@email = params[:email]
	@major = params[:major]
	@nation = params[:nation]
	@nickname = params[:nickname]
	@year=params[:year]
	@month=params[:month]
	@day=params[:day]
	@gender=params[:gender]
	#if @newuser.username && @newuser.password && params[:password] == params[:password2] && 
	#@newuser.save
	
	#else
	#render('meme/registeration')
	#flash[:notice]="fail"
	#end
  end
  helper_method :registeration

  def index
	@currentuser=params[:user]
	log=User.where(:username => params[:user],:password => params[:pass]).first
	if log && params[:user]
	flash[:notice]="Welcome Back"
	redirect_to(:action=>"memeuser", :currentuser => params[:user]);
	else
	flash[:notice]= "The login or password is not correct"
	end
  end
  helper_method :index
end
