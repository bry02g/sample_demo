class FileUploadersController < ApplicationController
  before_action :set_file_uploader, only: [:show, :edit, :update, :destroy]

  # GET /file_uploaders
  # GET /file_uploaders.json
  def index
    @file_uploaders = FileUploader.all
  end

  # GET /file_uploaders/1
  # GET /file_uploaders/1.json
  def show
  end

  # GET /file_uploaders/new
  def new
    @file_uploader = FileUploader.new
    
  end

  # GET /file_uploaders/1/edit
  def edit
  end

  # POST /file_uploaders
  # POST /file_uploaders.json
  def create
    @file_uploader = FileUploader.new(file_uploader_params)

    respond_to do |format|
      if @file_uploader.save
        format.html { redirect_to @file_uploader, notice: 'File uploader was successfully created.' }
        format.json { render :show, status: :created, location: @file_uploader }
      else
        format.html { render :new }
        format.json { render json: @file_uploader.errors, status: :unprocessable_entity }
      end
    end
    
    FileUploader.last.data_file.each do |file|
      run_script(file.blob.key, file.filename)
    end
  end

  # PATCH/PUT /file_uploaders/1
  # PATCH/PUT /file_uploaders/1.json
  def update
    respond_to do |format|
      if @file_uploader.update(file_uploader_params)
        format.html { redirect_to @file_uploader, notice: 'File uploader was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_uploader }
      else
        format.html { render :edit }
        format.json { render json: @file_uploader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_uploaders/1
  # DELETE /file_uploaders/1.json
  def destroy
    @file_uploader.destroy
    respond_to do |format|
      format.html { redirect_to file_uploaders_url, notice: 'File uploader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def run_script(file_name, name)
     
      path = "./storage/#{file_name[0,2]}/#{file_name[2,2]}/#{file_name}"
      
      puts "the path is #{path}"
      puts "starting transfer"

      `./lib/scripts/transfer.sh #{path} rails_upload_#{name}`
      puts $?
      puts "file uploaded"
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_file_uploader
      @file_uploader = FileUploader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_uploader_params
      params.require(:file_uploader).permit(data_file: [])
    end
end
