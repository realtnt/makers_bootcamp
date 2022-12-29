class LostCat
  attr_reader :name
  attr_reader :description
  attr_reader :mobile
  attr_reader :password
  attr_reader :sightings

  def initialize(name:, description:, mobile:, password:, sightings: [])
    @name = name
    @description = description
    @mobile = mobile
    @sightings = sightings
    @password = password
  end

  def set_name(name)
    @name = name unless name.nil?
  end

  def set_description(description)
    @description = description unless description.nil?
  end

  def set_mobile(mobile)
    @mobile = mobile unless mobile.nil?
  end

  def add_sighting(sighting)
    @sightings << sighting unless sighting.nil?
  end

  def set_password(password)
    @password = password unless password.nil?
  end

  def correct_password?(password)
    return @password == password
  end
end
