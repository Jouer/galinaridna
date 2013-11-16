class SectionsController < ApplicationController
  before_action :signed_in_user	
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_action :find_page

  # GET /sections
  # GET /sections.json
  def index
    @sections = @page.sections.all
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
  end

  # GET /sections/new
  def new
    @section = @page.sections.new
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = @page.sections.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to [@page, @section], notice: 'Section was successfully created.' }
        format.json { render action: 'show', status: :created, location: @section }
      else
        format.html { render action: 'new' }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to [@page, @section], notice: 'Section was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to page_path(@page) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:name, :position, :visible, :content_type, :content, :page_id)
    end
    def find_page
    if params[:page_id]
      @page = Page.find_by_id(params[:page_id])
    end
  end
end
