class Object
  def local_methods
    res = methods - 7.methods - "".methods
    res.sort_by { |x| x.to_s }
  end
end