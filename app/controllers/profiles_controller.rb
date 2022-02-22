class ProfilesController < ApplicationController
  def show
    # user = current_user
    
    @user = User.create({
      first_name: "Bibi",
      last_name: "Ferreira",
      id: 1,
      email: "bibi@email.com",
      age: 21,
      picture: "https://pbs.twimg.com/profile_images/1252235665602777090/2zr4Oy-j_400x400.jpg",
      description: "A chef looking for new tours"
    })
  end
  def edit
  end
end
