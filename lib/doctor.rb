#person
class Doctor
  attr_accessor(:id, :name, :speciality)

  def initialize(attrs)
    @id = attrs[:id]
    @name = attrs[:name]
    @speciality = attrs[:speciality]
  end

  def save
    if @id == nil
    saved = DB.exec("INSERT INTO doctors (name, speciality) VALUES ('#{@name}', '#{@speciality}' or 'NULL'}) RETURNING id;")
      @id = saved.first["id"].to_i
    else
      DB.exec("UPDATE doctors SET name = '#{@name}', speciality = '#{@speciality}' or 'NULL'} WHERE id = #{@id};")
    end
  end

  def ==(other)
   @name == other.name && \
   @speciality == other.speciality
 end

    def self.all
      DB.exec("Select * FROM doctors").map do |doctors|
        Doctor.new({
          :id => doctor["id"],
          :name => doctor["name"],
          :speciality => doctor["speciality"]
        })
      end
    end

    ###################


end
