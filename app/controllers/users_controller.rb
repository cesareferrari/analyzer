class UsersController < ApplicationController
  before_action :require_signin
end
