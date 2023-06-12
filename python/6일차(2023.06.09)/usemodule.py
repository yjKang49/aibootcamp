import mymodule

print( mymodule.add(6,7) )
print( mymodule.sigma(1000) )

m1 = mymodule.MyCalc(10,20)
print( m1.add())
print( m1.sub() )


from mymodule import add, sigma, MyCalc

# from mymodule import add
# from mymodule import sigma
# from mymodule import MyCalc

print( add(11,12))
print(sigma(20))
m2 = MyCalc(9,5)
print(m2.add())
print(m2.sub())



from mymodule import MyCalc as mc
m3 = mc(17,19)
print(m3.add())
print(m3.sub())

