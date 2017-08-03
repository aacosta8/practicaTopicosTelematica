class Publication < ApplicationRecord
	belongs_to :user

	enum permission_pub: [ :publico,  :compartido, :privado]
	scope :publicos, ->{where('permission_pub < ?', 1)}
	scope :compartidos, ->{where('permission_pub < ?', 2)}
	scope :privados, ->{where('permission_pub = ?', 2)}
 	scope :recientes, ->{order("created_at DESC")}

end
