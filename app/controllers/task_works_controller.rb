class TaskWorksController < ApplicationController
  def edit
    @details = TaskWork.find(params[:id])
    if @details.user_id != current_user.id
      puts "hey you do not have permission"
    else
      minutes = round_time @details.time_worked, DateTime.now.utc, 15
      @details.time_count = minute
      respond_to do |format|
        if @details.save
          format.html { redirect_to @details, notice: 'time worked was successfully created.' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new }
          format.json { render json: @details.errors, status: :unprocessable_entity }
        end
      end
    end
  end

end
