require 'rspec'
require 'doctors'
require 'spec_helper'

describe Doctor  do
  before :each  do
    @Ed = Doctor.new({
      :name => "Ed",
      :speciality => 'Radiology'
      })

    @Ted = Doctor.new({
      :name => "Ted",
      :speciality => 'Pediatrician'
      })

    @Dave = Person.new({
      :name => "Dave",
      :speciality => 'Surgeon'
    })
  end

  describe '#initialize'  do
   it "will return name and speciality" do
     expect(@Ed.name).to eq "Ed"
     expect(@Ed.speciality).to eq 'Radiology'
   end
   it "will return name and speciality" do
     expect(@Ted.name).to eq "Ted"
     expect(@Ted.speciality).to eq 'Pediatrician'
   end
   it "will return name and speciality" do
     expect(@Dave.name).to eq "Dave"
     expect(@Dave.speciality).to eq 'Surgeon'
   end
 end


describe '#save' do
    it "will save input into the database" do
      @name.save()
      expect(Doctor.all).to be_an_instance_of(Array)
    end

    it "will update entries that already exist" do
      @kevin.save
      @kevin.save
      person2_id = @kevin.id
      expect(Person.all.first).to eq @kevin
      expect(Person.all.first.id.to_i).to eq person2_id
    end
  end
