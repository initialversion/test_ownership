class OwnedThing < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :class_name => "Owner"

  # Indirect associations

  # Validations

end
