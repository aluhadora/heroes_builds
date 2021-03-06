class BuildsController < ApplicationController
  # before_filter :set_build, only [:show]

  def index
    @builds = all_builds
  end

  def show
    if (params[:name] == "undefined" || params[:name] == "none")
      @build = Build.new
      @build.url = all_builds.map{ |h| h.name} * ", "
    else
      set_build
      if (@build.nil?)
        @build = Build.new
        @build.url = "Hero " + params[:name] + " not found."
      end
    end
    render :layout => "plaintext"
  end

  def showtext
    @builds = all_builds
    @list = @builds.map{ |h| h.name } * ", "
    render :layout => "plaintext"
  end

  def create
    build = build(params[:name])

    params[:url] = "http://www.heroesfire.com/hots/talent-calculator/" + params[:name] + '#' + params[:url]

    if (build.nil?)
      @build = Build.new
      @build.name = params[:name]
      @build.url = params[:url]

      @build.save
    else
      @build = builds.first
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

  def web_new
    @build = Build.new

    respond_to do |format|
      format.html
    end
  end

  def createnew
    @build = Build.new(params[:build])

    @build.save

    redirect_to :action => "index"
  end

  private

  def set_build
    @build = build(params[:name])
  end

  def build(name)
    return Build.find(:first, :conditions => ["lower(name) = ?", name.downcase])
  end

  def all_builds
    return Build.all.sort!{|a,b| a.name.downcase <=> b.name.downcase}
  end
end
