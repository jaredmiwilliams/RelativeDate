DateRange
=========

A simple class that given a day and other optional parameters will return a relative Time object

Usage
-----

    #get wednesday of current week if before, else get next weeks wednesday
    puts RelativeDay::getDate(:wednesday, {:exclusive => true})
    
    #get tuesday of current week
    puts RelativeDay::getDate(:tuesday)
    
    #wednesday following 8/1/2011
    puts RelativeDay::getDate(:wednesday, {:time => Time.local(2011, 8, 10)})
    
    #get this weeks wednesday at 5:30
    puts RelativeDay::getDate(:wednesday, {:hour => 5, :minute => 30})