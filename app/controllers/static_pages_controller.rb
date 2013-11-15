class StaticPagesController < ApplicationController
	
	before_action :setup_navigation
	
  def index
  @image = 'portrait.png'
  @page = Page.where(:permalink => 'home').first
  end
   
  def home
  @image = 'four.png'
  @page = Page.where(:permalink => 'about').first
  end

  def show
  	@page = Page.where(:permalink => params[:id], :visible => true).first
  	render action: 'index' unless @page
  	if (@page == Page.where(:permalink => 'black').first)
  		img_set = ['col1.png', 'col2.png', 'col3.png']
  		else
  	   img_set = ['one.png', 'two.png', 'three.png', 'four.png', 'five.png', 'seven.png', 'eight.png', 'nine.png']
  	    end
  	quantity = img_set.count
  	r = Random.new
  	r_number = r.rand(quantity)
  	@image = img_set[r_number]
  end
  
  def picture
  	 
 	@section = Section.find_by_name(params[:image_name])
 	@page = Page.where(:id => params[:page_id]).first
    @img_name = params[:image_name]
 	
   @set_img = @page.sections.order(position: :asc).where.not(name: 'info' )
   
   @next_img = @set_img.where(name: @img_name)
  
 	 
 	end
 	
  
  def setup_navigation
 		@feed_subjects = Subject.order(position: :asc)
 	end
end
