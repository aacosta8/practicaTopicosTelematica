class Publication < ApplicationRecord
	belongs_to :user

	has_attached_file :photo, styles: {medium: "570x321"},touch: true
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

	enum permission_pub: [ :publico,  :compartido, :privado]
	scope :publicos, ->{where('permission_pub < ?', 1)}
	scope :compartidos, ->{where('permission_pub < ?', 2)}
	scope :privados, ->{where('permission_pub = ?', 2)}
 	scope :recientes, ->{order("created_at DESC")}

end
