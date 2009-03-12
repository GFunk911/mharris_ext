def tm(msg="Thing")
  t = Time.now
  res = yield
  seconds = Time.now - t
  puts "#{msg} took #{seconds} seconds"
  res
end

def print_memory_usage!
  Thread.new do
    loop do
      mem = `ps -l #{Process.pid}`.to_a[1].split[8]
      puts "Memory: #{mem} #{Time.now}"
      sleep(10)
    end
  end
end
