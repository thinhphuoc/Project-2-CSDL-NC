import random as r
import time as t

start = t.time()

mv = open('D:\\Data\\MaNV.txt','w')
for i in range(500):
    temp = r.randint(1,9999) 
    manv= str(temp)
    mv.writelines(manv+'\n')
mv.close()

tk = open('D:\\Data\\TaiKhoan.txt','w')
for i in range(500):
    temp = r.randint(1000,99999999) 
    taikhoan= 'TK'+str(temp)
    tk.writelines(taikhoan+'\n')
tk.close()

name = ('a','b','c','d','e','f','g','h','i','j','k','l','m','n')
nl = open('D:\\Data\\EmailNV.txt','w')
for i in range(500):
    num = r.randint(1000,10000)
    email= r.choice(name)+str(num)+'@gmail.com'
    nl.writelines(email+"\n")
nl.close()

loainv = ('NS','QL','QT','BH')
l = open('D:\\Data\\LoaiNV.txt','w')
for i in range(500):
    l.writelines(r.choice(loainv)+'\n')
l.close()

end = t.time()
print('Time execute:',end-start)