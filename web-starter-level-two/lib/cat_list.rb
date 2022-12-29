require 'lost_cat'

class CatList
  def initialize(lost_cat = LostCat)
    @cats = []
    @lost_cat = lost_cat
  end

  def list
    return @cats
  end

  def add(name, description, mobile, password)
    @cats << @lost_cat.new(
      name: name, 
      description: description, 
      mobile: mobile,
      password: password
    )
  end

  def remove(index)
    @cats.delete_at(index)
  end

  def update(index, name, description, mobile, sighting, password)
    @cats[index].set_name(name)
    @cats[index].set_description(description)
    @cats[index].set_mobile(mobile)
    @cats[index].add_sighting(sighting)
    @cats[index].set_password( password)
  end

  def get(index)
    return @cats[index]
  end
end
