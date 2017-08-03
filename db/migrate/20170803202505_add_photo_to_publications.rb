class AddPhotoToPublications < ActiveRecord::Migration[5.1]
  def change
    add_attachment :publications,:photo
  end
end
