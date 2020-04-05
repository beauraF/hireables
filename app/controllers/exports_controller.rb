# frozen_string_literal: true

class ExportsController < ApplicationController
  def new
    @export = Export.new
  end

  def create
    @export = Export.new(export_params)

    if @export.save
      redirect_to(
        root_path,
        notice: 'We have taken your search into account, ' \
          'an email with the results will be sent to you in a few minutes.'
      )
    else
      render :new
    end
  end

  private

  def export_params
    params.require(:export).permit(:email, :location, :language)
  end
end
