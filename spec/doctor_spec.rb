require 'rspec'
require 'doctor'
# require 'spec_helper'

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

    @Dave = Doctor.new({
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

#   describe("#save") do
#   it("lets you save input to the database") do
#     doctor = Doctor.new({:name => "Ted", :id => nil})
#     doctor.save()
#     expect(Doctor.all).to eq [doctor]
#   end
# end
#
#   describe '.patient_list' do
#     it "will give a patient list per each doctor" do
#       @dave = Doctor.new({
#         :id => '3',
#         :name => "dave",
#         :speciality => "surgeon"
#         })
#         @johnny.save
#         @tommy.save
#         @thomas.save
#         @george.save
#       expect(Doctor.patient_list(@dave)).to eq [@johnny, @thomas]
#     end
#   end

end
