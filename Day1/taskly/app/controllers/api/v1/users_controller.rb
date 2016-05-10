# Es la clase usercontroller pero está metida dentro de dos modulos:
# Module Api > Module C1 > Class UsersController
class Api::V1::UsersController < ApplicationController
	before_action :user_exists, except: [:index, :create]

	def index
		users = User.all
		render json: users
	end
	def create
		user = User.create(user_params)
		render json: user
	end
	def show
		render json: @user
	end
	def update
		@user.udpate(user_params)
		render json: @user
	end
	def destroy
		@user.destroy
		render json: @user
		#User lo he borrado de la bbdd pero sigue estando
		# guardado en la variable mientras ejecutamos el código
	end

	private
	def user_params
		params.require(:user).permit(:name, :email)
	end
	def user_exists
		@user = User.find(params[:id])
		unless @user
			render json: { error: "User not found"}, status: 400
			return
		end
	end
end
