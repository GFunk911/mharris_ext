def ec(cmd)
  puts cmd
  res = `#{cmd}`
  puts res
  res
end