import random as r
import time as t

start = t.time()

tk = open('D:\\Data\\TaiKhoan.txt','w')
for i in range(1000):
    temp = r.randint(1000,99999999) 
    taikhoan= 'TK'+str(temp)
    tk.writelines(taikhoan+'\n')
tk.close()

mk = open('D:\\Data\\MatKhau.txt','w')
for i in range(1000):
    temp = r.randint(1000000000,9999999939)
    matkhau = str(temp)
    mk.writelines(matkhau+'\n')
mk.close()


nl = open('D:\\Data\\NgayLap.txt','w')
for i in range(1000):
    thang = r.randint(1,12)
    ngay = r.randint(10,28)
    ngaylap = str(thang)+'/'+str(ngay)+'/'+'2021'
    nl.writelines(ngaylap+"\n")
nl.close()

loainv = ('NS','QL','QT','KH')
l = open('D:\\Data\\LoaiTK.txt','w')
for i in range(1000):
    l.writelines(r.choice(loainv)+'\n')
l.close()

end = t.time()
print('Time execute:',end-start)