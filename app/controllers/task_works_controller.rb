class TaskWorksController < ApplicationController
  def edit
    @details = TaskWork.find(params[:id])
    authorize @details
    minutes = round_time @details.time_worked, DateTime.now.utc, 15
    @details.time_count = minutes
    respond_to do |format|
      if @details.save
        format.html { redirect_to @details, notice: 'time worked was successfully created.' }
        format.json { render :show, status: :created, location: @post }\
      else
        format.html { render :new }
        format.json { render json: @details.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_time
    @details = TaskWork.find(params[:id])
  end

  def update
    p = params.require(:task_work).permit(:time_count)
    @details = TaskWork.find(params[:id])
    minutes = round_minutes p["time_count"].to_i, 15
    @details.time_count = minutes
    respond_to do |format|
      if @details.save
        format.html { redirect_to @details, notice: 'time worked was successfully created.' }
        format.json { render :show, status: :created, location: @post }\
      else
        format.html { render :new }
        format.json { render json: @details.errors, status: :unprocessable_entity }
      end
    end
  end
end
