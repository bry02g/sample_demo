class FileUploader < ApplicationRecord
    has_many_attached :data_file
end
