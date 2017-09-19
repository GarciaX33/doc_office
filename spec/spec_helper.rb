require('rspec')
require('doctor')
require('patients')
require('pg')

DB = PG.connect({:dbname => 'doc_office_test'})

Rspec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM doctors *;')
    DB.exec('DELETE FROM patients *;')
  end
end
