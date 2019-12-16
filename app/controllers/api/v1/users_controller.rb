class Api::V1::UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users.to_json
    end

    #login
    def shows
        @user = User.find_by(username: params[:username])
        if User.where(:username => params[:username], :password => params[:password]).present?
            render json: {
                message: "Email: " + params[:username] + " logeado con éxito",
                status: 200,
                user: @user
            }
          else
            render json: {
                message: "Email: " + params[:username] + " no encontrado, inténtelo de nuevo",
                status: 400,
            }
          end
        end

     
     def create
        if User.where(:username => params[:username]).present?
            render json: {
                message: "Este email ya se encuentra registrado en la base de datos",
                status: 400,
            }
        else 
            @user = User.new({:fullname => params[:fullname], :username => params[:username], :password => params[:password] })
            @user.save
            render json: {
                message: "Email: " + params[:fullname]+ " registrado con éxito",
                status: 200
            }
        end
    end
end