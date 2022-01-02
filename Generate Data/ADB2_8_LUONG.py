import random as r
import time as t

start = t.time()

nl = open('D:\\Data\\NgayNhanLuong.txt','w')
for i in range(500):
    thang = r.randint(1,12)
    ngay = r.randint(10,28)
    ngayluong = str(thang)+'/'+str(ngay)+'/'+'2021'
    nl.writelines(ngayluong+"\n")
nl.close()

lc = open('D:\\Data\\LuongCung.txt','w')
for i in range(500):
    num = r.randint(10000000,100000000)
    luongcung = str(num)
    lc.writelines(luongcung+"\n")
lc.close()

lt = open('D:\\Data\\LuongThuong.txt','w')
for i in range(500):
    num = r.randint(100000,10000000)
    luongthuong = str(num)
    lt.writelines(luongthuong+"\n")
lt.close()
end = t.time()

print('Time execute:',end-start)