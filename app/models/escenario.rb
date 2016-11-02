class Escenario < ActiveRecord::Base
  belongs_to :categorium
  
  has_attached_file :foto, styles: { medium: "626x626" }
    validates_attachment_content_type :foto, content_type: /\Aimage\/.*\Z/
end
