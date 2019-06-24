class FileUploader < ApplicationRecord
    has_one_attached :data_file
end
