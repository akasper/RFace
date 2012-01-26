module PersistenceHelper
  #Given that .subject has been set within the spec, takes a hash of fields mapping to valid 
  # assignment values. These values should differ from the value at the time the model is passed in. 
  def persists(fields={})
    it("saves")   { subject.should respond_to(:save)   }
    it("reloads") { subject.should respond_to(:reload) }
    fields.each_pair do |field, valid_value|
      it("persists #{field}") do
        subject.send(field.to_s + '=', valid_value)
        subject.save
        subject.reload.send(field).should == valid_value
      end
    end
  end
end
