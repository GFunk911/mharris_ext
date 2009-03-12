class Object
  def attr_accessor_nn_one(sym)
    define_method(sym) do
      res = instance_variable_get("@#{sym}")
      raise "method #{sym} cannot return nil value" unless res
      res
    end
    attr_writer(sym)
  end
  def attr_accessor_nn(*args)
    args.flatten.each { |x| attr_accessor_nn_one(x) }
  end
end