class BuildsController < ApplicationController
  # before_filter :set_build, only [:show]

  def index
    @builds = Build.all
  end

  def show
    if (params[:name] == "undefined")
      @build = Build.new
      @build.url = Build.all.map{ |h| h.name} * ", "
    else
      set_build
    end
    render :layout => "plaintext"
  end

  def showtext
    @builds = Build.all
    @list = @builds.map{ |h| h.name } * ", "
    render :layout => "plaintext"
  end

  def create
    builds = Build.where(name: params[:name])

    if (builds.count > 0) 
      @build = builds.first
    
    else 
      @build = Build.new
      @build.name = params[:name]
      @build.url = params[:url]

      @build.save
    end

    render :layout => "plaintext"
  end

  def destroy
    builds = Build.where(name: params[:name])
    builds.each do |build|
      build.destroy
    end

    @build = Build.new
    @build.name = params[:name]
    render :layout => "plaintext"
  end

  private

  def set_build
    @build = Build.where(name: params[:name]).first
    puts '<<<<<<<<<'
    puts @build.name
    puts @build.url
    puts '<<<<<<<<<<<<<<<'
  end
end
