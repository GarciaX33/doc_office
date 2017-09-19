#an
class Patient
  attr_reader(:id, :name, :birthdate)

  def initialize(attrs)
    @id = attrs[:id]
    @name = attrs[:name]
    @birthdate = attrs[:birthdate]
  end

  def save
    if @id == nil
    saved = DB.exec("INSERT INTO  patients (name, birthdate) VALUES ('#{@name}', '#{@birthdate}' or 'NULL'}) RETURNING id;")
      @id = saved.first["id"].to_i
    else
      DB.exec("UPDATE patients SET name = '#{@name}', birthdate = '#{@birthdate}' or 'NULL'} WHERE id = #{@id};")
    end
  end

  def ==(other)
   @name == other.name && \
   @birthdate == other.birthdate
 end

################################

class << self
  def all
    DB.exec("Select * FROM patients;").map do |patients|
      Patient.new({
        :id => patient["id"],
        :name => patient["name"],
        :type => patient["birthdate"],
      })
    end
  end
end
