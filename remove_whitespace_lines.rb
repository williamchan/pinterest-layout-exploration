# Useful script to clean whitespace lines from a file.

File.open('test.html', 'w') do |target| 

	File.open('mypinterest.html', 'r') do |f1|  
	  while line = f1.gets
	  	l2 = line.strip
	  	if l2.length > 0
	  		target.puts line
	  	end
	  end  
	end  
end  
