class Admin::AdminController < ApplicationController
  authorize_resource :class => false
  layout "admin"
  
end
