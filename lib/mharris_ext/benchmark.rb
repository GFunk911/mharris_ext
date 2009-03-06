def tm(msg="Thing")
  t = Time.now
  yield
  seconds = Time.now - t
  puts "#{msg} took #{seconds} seconds"
end