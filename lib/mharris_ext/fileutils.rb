def all_dirs_recursive(dir)
  raise "null dir" unless dir
  init_slash = (dir[0..0] == '/')
  #raise "can't handle initial slash" if dir[0..0] == '/'
  #puts "all_dirs_recursive #{dir}"
  dir.split("/")[0..-1].inject([]) do |paths,dir|
    last_path = (paths.empty? ? "" : "#{paths[-1]}/")
    paths + ["#{last_path}#{dir}"]
  end.select { |x| x != '' }
end

def mkdir_if(dir)
  if FileTest.exists?(dir)
    #puts "not making #{dir}"
  else
    #puts "making #{dir}"
    FileUtils.mkdir(dir) 
  end
end

def mkdir_recursive(ops)
  dir = ops.is_a?(Hash) ? ops[:dir] : ops
  #puts "mkdir_recursive #{dir}"
  all_dirs_recursive(dir).each do |dir|
    mkdir_if(dir)
  end
end

def mv_making_dir(f,new_dir)
  #puts "mv_making_dir #{f} #{new_dir}"
  mkdir_recursive(new_dir)
  FileUtils.mv(f,new_dir)
end

unless all_dirs_recursive("a/b/c") == ["a","a/b","a/b/c"]
  res = all_dirs_recursive("a/b/c")
  raise "all_dirs_recursive doesn't work #{res.inspect}"
end

unless all_dirs_recursive("/a/b/c") == ["/a","/a/b","/a/b/c"]
  res = all_dirs_recursive("/a/b/c")
  raise "all_dirs_recursive doesn't work #{res.inspect}"
end

def rm_r_if(dir)
  FileUtils.rm_r(dir) if FileTest.exists?(dir)
end

def eat_exceptions
  yield
rescue
end