#Offers helper methods for all model classes

module InterfaceHelper
  def self.inherited(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    #Given that #subject has been called within the spec, takes an array of symbols (method names)
    def implements(*methods)
      methods.each do |method|
        it("implements ##{method}") {subject.should respond_to(method)}
      end
    end

    def class_implements(*methods)
      methods.each do |method|
        it("implements .#{method}") {described_class.should respond_to(method)}
      end
    end
  end
end

