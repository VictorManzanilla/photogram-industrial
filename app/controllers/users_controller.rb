class UsersController < ApplicationController

  # We need the find_by method, because the value returned by params.fetch(:username) in our example is "alice", which won’t work with find, because that method expects an ID number.
#   We want a 400 error, which are errors caused by normal operation, like someone trying to navigate to a location that doesn’t exist.

# There’s actually a variation of find_by called find_by! with an exclamation mark. The purpose of that is to throw the record not found error:


  def show
    @user = User.find_by!(username: params.fetch(:username))
  end

  def liked
    @user = User.find_by!(username: params.fetch(:username))
  end

  def feed
    @user = User.find_by!(username: params.fetch(:username))
  end

  def discover
    @user = User.find_by!(username: params.fetch(:username))
  end
end
