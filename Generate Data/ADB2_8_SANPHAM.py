import random as r
import time as t

start = t.time()

ma = open('D:\\Data\\MaSP.txt','w')
for i in range(2000):
    num = str(r.randint(10000000,99999999))
    masp = 'SP'+num
    ma.writelines(masp+"\n") 
ma.close()

hoa = ('Hoa Hong','Hoa Lan','Hoa Mai','Hoa Cuc','Hoa Hue','Hoa Huong Duong','Hoa Anh Dao','Hoa Dam But','Hoa Tulip','Hoa Tigon')
quatang = ('Gau Bong','Kep Toc','Nuoc Hoa', 'Son Moi','Ao Khoac','Mascara')
sp = open('D:\\Data\\TenSP.txt','w')
for i in range(2000):
    num = r.randint(500,1000)
    if (i%2 == 0):
        tensp = r.choice(hoa) + ' ' + str(num)
    else:
        tensp = r.choice(quatang) + ' ' + str(num)
    sp.writelines(tensp+"\n") 
sp.close()

lt = open('D:\\Data\\SoLuongTon.txt','w')
for i in range(2000):
    num = r.randint(100,1000)
    sl = str(num)
    lt.writelines(sl+"\n")
lt.close()

l = open('D:\\Data\\LoaiSP.txt','w')
for i in range(2000):
    if(i%2==0):
        loai = 'Hoa Tiec Cuoi'
    if(i%3==0):
        loai = 'Hoa Sinh Nhat'
    else:
        loai = 'Quan Tang'
    l.writelines(loai+"\n")
l.close()

g = open('D:\\Data\\GiaSP.txt','w')
for i in range(2000):
    gia = str(r.randint(200000,1000000))
    g.writelines(gia+"\n")
g.close()
end = t.time()

print('Time execute:',end-start)