module RFace
  def self.inherited(base)
    base.instance_eval do
      include InterfaceHelper
      include AssignmentHelper
      include PersistenceHelper
    end
  end
end

