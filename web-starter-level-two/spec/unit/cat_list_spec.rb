require "cat_list"

RSpec.describe CatList do
  it "start with an empty list" do
    expect(subject.list).to eq []
  end

  it "adds cats" do
    lost_cat_fake = double :LostCat
    cat_list = CatList.new(lost_cat_fake)
    allow(lost_cat_fake).to receive(:new).and_return(lost_cat_fake)
    cat_list.add(
      'mumu 1', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    expect(cat_list.list).to eq [lost_cat_fake]
  end

  it "removes cat" do
    lost_cat_fake = double :LostCat
    cat_list = CatList.new(lost_cat_fake)
    allow(lost_cat_fake).to receive(:new).and_return(lost_cat_fake)
    cat_list.add(
      'mumu 1', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    cat_list.add(
      'mumu 2', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    cat_list.add(
      'mumu 3', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    cat_list.remove(1)
    expect(cat_list.list).to eq [lost_cat_fake, lost_cat_fake]
  end

  it "updates cats" do
    lost_cat_fake = double :LostCat
    cat_list = CatList.new(lost_cat_fake)
    allow(lost_cat_fake).to receive(:new).and_return(lost_cat_fake)
    allow(lost_cat_fake).to receive(:set_name)
    allow(lost_cat_fake).to receive(:set_description)
    allow(lost_cat_fake).to receive(:set_mobile)
    allow(lost_cat_fake).to receive(:add_sighting)
    allow(lost_cat_fake).to receive(:set_password)
    cat_list.add(
      'mumu 1', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    cat_list.add(
      'mumu 2', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    cat_list.add(
      'mumu 3', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    cat_list.update(
      1, 
      "updated cat", 
      "cat updated", 
      "099999999",
      "",
      ""
    )
    expect(cat_list.list).to eq [lost_cat_fake, lost_cat_fake, lost_cat_fake]
    expect(cat_list.get(1)).to eq(lost_cat_fake)
  end

  it "gets a single cat" do
    lost_cat_fake = double :LostCat
    cat_list = CatList.new(lost_cat_fake)
    allow(lost_cat_fake).to receive(:new).and_return(lost_cat_fake)
    allow(lost_cat_fake).to receive(:name=)
    allow(lost_cat_fake).to receive(:description=)
    allow(lost_cat_fake).to receive(:mobile=)
    allow(lost_cat_fake).to receive(:password=)
    cat_list.add(
      'mumu 1', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    cat_list.add(
      'mumu 2', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    cat_list.add(
      'mumu 3', 
      'lost cat', 
      '01234555234', 
      'password'
    )
    expect(cat_list.get(1)).to eq lost_cat_fake
  end
end
