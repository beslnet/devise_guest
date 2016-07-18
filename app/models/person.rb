class Person < ActiveRecord::Base
	has_one :user, dependent: :destroy
	has_many :matches
	has_many :matched_people, through: :matches,
                         	  dependent: :destroy

  has_ancestry
  has_parents sex_values: ['M','F'], current_spouse: true, ineligibility: :pedigree

  def with_match_data
    select('people.*, matches.created_at AS match_created_at')
  end

  def count(column_name = :all)
    super
  end

  def match_created_at
    Time.zone.parse(self[:match_created_at]) if self[:match_created_at]
  end
                       
end
