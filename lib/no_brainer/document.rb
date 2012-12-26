module NoBrainer::Document
  extend ActiveSupport::Concern
  extend NoBrainer::Loader

  autoload_and_include :Core, :Id, :InjectionLayer, :Persistance, :Attributes,
                       :Serialization, :Selection, :Validation, :Relation
end
