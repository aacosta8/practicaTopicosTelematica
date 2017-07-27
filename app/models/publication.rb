class Publication < ApplicationRecord
  enum permission_pub: [ :publico,  :compartido, :privado]
end
