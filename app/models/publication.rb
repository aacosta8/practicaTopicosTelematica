class Publication < ApplicationRecord
  enum permission_pub: [ :compartido,  :publico, :privado]
end
