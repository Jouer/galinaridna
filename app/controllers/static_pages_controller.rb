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
  	   img_set = ['one.png', 'two.png', 'three.png', 'four.png', 'five.png',   'seven.png', 'eight.png', 'nine.png']
  	    end
  	quantity = img_set.count
  	r = Random.new
  	r_number = r.rand(quantity)
  	@image = img_set[r_number]
  end
  
  def picture
  	 
 	@section = Section.find(params[:id])
 	@page = Page.where(:id => params[:page_id]).first
 	 @img_name = params[:image_name]
 	 

   img_set = [] 
    if @page 
   @page.sections.each do |section| 
   if section.name != 'info'
   a = []
   a[0]= section.name
   a[1] = '.png'
   name = a.join('') 
    img_set << name 
	end
 	end
	 img_set.find {|i| i==@img_name}
	  n=img_set.index {|i| i==@img_name} 
	 	if n < (img_set.count - 1)
 	 	@next_img=img_set[n+1]
 	 	else
 		@next_img=img_set[0]
  		end 
    if n > 0 
   @prev_img=img_set[n-1]
  	 else 
  	@prev_img=img_set[-1] 
 	end
 	end
 	 
 	end
 	
  
  def setup_navigation
 		@feed_subjects = Subject.order(position: :asc)
 	end
end
