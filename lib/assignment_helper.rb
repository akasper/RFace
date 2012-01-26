module PersistenceHelper
  #Verifies that the subject receives :<field>= for each field when calling subject.<using>(<with>)
  def sets(*args)
    params = args.extract_options!
    m = params[:method]
    p = Array.wrap(params[:params])

    args.each do |field|
      it "sets the #{field}" do
        subject.should_receive(:"#{field}=")
        subject.send(:"#{m}", *p)
      end

      it "assigns the #{field}" do
        subject.send(:"#{m}", *p)
        subject.send(:"#{field}").should_not be_nil
      end
    end
  end
end
