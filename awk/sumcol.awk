#!/usr/bin/env awk
BEGIN { 
	delete ARGV; 
	tot = 0 
}
{ tot += $1 }
END { print tot }
