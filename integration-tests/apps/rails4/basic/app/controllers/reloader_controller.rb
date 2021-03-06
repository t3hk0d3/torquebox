class ReloaderController < ApplicationController
  def index
    @version = 'INITIAL'

    new_version = params[:version]
    template = ERB.new(File.read(File.join(File.dirname(__FILE__), 'reloader_controller.rb.erb')))
    File.open(File.join(File.dirname(__FILE__), 'reloader_controller.rb'), 'w') do |f|
      f.write template.result(binding)
    end
  end
end
