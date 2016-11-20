class Profile < ActiveRecord::Base
  belongs_to :user

  # Define custom validator that permits first_name or last_name
  # to be null but not both
  #
  # Define a validation for gender to be either "male" or "female"
  # by using a built-in validator
  #
  # Define custom validator that prevents anyone that is male (gender)
  # from having the first_name "Sue" ;)

  validate :has_first_name_or_last_name
  validates :gender, inclusion: { in: %w(male female),
      message: "%{value} is not a valid gender" }
  validate :no_boys_named_sue

  def has_first_name_or_last_name
    if last_name.nil? && first_name.nil?
      errors.add(:last_name,'First name and last name cannot be nil')
      errors.add(:first_name, 'First name and last name cannot be nil')
    end
  end

  def no_boys_named_sue
    if gender == 'male' && first_name == 'Sue'
      errors.add(:gender,'Anything but Sue! I still hate that name!')
      errors.add(:first_name,'Anything but Sue! I still hate that name!')
    end
  end

    # get_all_profiles
    # accepts a min and max for the birth year
    # issues a BETWEEN SQL clause in a where clause to locate Profiles with birth years that are between min
    # year and max year
    # defends itself against SQL injection when applying the parameters to the SQL clauses
    # # returns a collection of Profiles in ASC birth year order
    # def self.get_all_profiles(min_birth_year, max_birth_year)
  scope :get_all_profiles, -> (min_birth_year, max_birth_year) {
    where('birth_year BETWEEN :min_birth_year AND :max_birth_year',
           min_birth_year: min_birth_year,
           max_birth_year: max_birth_year).order(birth_year: :asc)
  }

end
