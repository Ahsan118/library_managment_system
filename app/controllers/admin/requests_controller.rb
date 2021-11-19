class Admin::RequestsController < ApplicationController
before_action :find_id , only:[:approved,:reject]
def index
  @requests = BookRequest.all.paginate(page: params[:page],per_page: 5)
end

def approved
@status.update(status: 3)
redirect_to admin_requests_path(@status)
end

def reject
@status.update(status: 2)
redirect_to admin_requests_path(@status)
end

def filter_by_status
  @params = params[:status]
  @requests = BookRequest.where(status: @params)
end

private

def find_id
@status = BookRequest.find(params[:id])
end

end
