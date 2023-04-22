def index
  @users = User.all
end

def show
  @id = params[:id]
end
end
