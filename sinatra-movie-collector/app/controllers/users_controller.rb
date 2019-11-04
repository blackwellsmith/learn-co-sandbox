class UsersController < ApplicationController
  get '/signup' do
    erb :"users/new.html"
  end

  post '/users' do
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.zip_code = params[:zip_code]
    @user.save
    if @user != nil #@user.save # if you try to save an invalid ActiveRecord object, you get false
      redirect '/login'
    else
      erb :"users/new.html" # render as opposed to redirect, render whenever currnet request has data we need. # redirect if data is not required
    end
  end
end
