#person
class Doctor
  attr_reader(:id. :name, :speciality)

  def initialize(attrs)
    @id = attrs[:id]
    @name = attrs[:name]
    @speciality = attrs[:speciality]
  end

  class << self

    def all
      DB.exec("Select * FROM doctors").map do |doctors|
        Doctor.new({
          :id => doctor["id"]
          :name => doctor["name"]
          :speciality => doctor["speciality"]
        })
      end
    end

    ###################

  def save
   if @id == nil
     saved = DB.exec("INSERT INTO doctors (name, speciality) VALUES ('#{@name}', '#{@speciality}') RETURNING id;")
     @id = saved.first["id"].to_i
   else
     DB.exec("UPDATE doctors SET name = '#{@name}', speciality = '#{@speciality}' WHERE id = #{@id};")
   end
 end

 def ==(other)
  @name == other.name and \
  @speciality == other.speciality
end
end
