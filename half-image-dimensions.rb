

#!/usr/bin/env ruby

# input: image file name
# output: image dimensions string like: 1920x1080
# output is half the real dimensions, rounded down, for getting retina stuff scaled down

results = `sips  -g pixelHeight -g pixelWidth #{ARGV[0]}`

results =~ /pixelHeight: (\d+)/
h = ($1.to_f/2.0).to_i
results =~ /pixelWidth: (\d+)/
w = ($1.to_f/2.0).to_i

print "#{w}x#{h}"
