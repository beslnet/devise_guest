class Match < ActiveRecord::Base
  belongs_to :person
  belongs_to :matched_person, class_name: 'Person'

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?

  def create_inverse
    self.class.create(inverse_match_options)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_match_options)
  end

  def inverses
    self.class.where(inverse_match_options)
  end

  def inverse_match_options
    { matched_person_id: person_id, person_id: matched_person_id }
  end
end