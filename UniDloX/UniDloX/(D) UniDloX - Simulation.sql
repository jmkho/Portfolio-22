--Purchase Transaction
--> Soal :
--> Musim dingin ini, UniDloX ingin membuat jaket berbahan wool dikarenakan trend yang ada
--> UniDloX mengirim salah satu staffnya yang memiliki staffID SF015 untuk membeli bahan kain wool dari supplier yanng memiliki supplierId SU001
--> Pembayaran dilakukan dengan metode shopee-Pay(PA004)

BEGIN TRAN
INSERT INTO purchaseTransactionHeader VALUES 
--> data mengenai purchaseId, staffId, supplierId, tanggal pembelian bahan, serta metode pembayaran
--> akan dimasukkan ke dalam database UniDloX tabel purchaseTransactionHeader
('PU026', 'SF015', 'SU001', '2021-11-13', 'PA004')
ROLLBACK

BEGIN TRAN
INSERT INTO purchaseTransactionDetail VALUES 
--> data mengenai purchaseId, materialId, purchaseQuantity
--> akan dimasukkan ke dalam database UniDloX tabel purchaseTransactionDetail
('PU026', 'MA013', 100)
ROLLBACK

--Sales Transaction
--> Soal :
--> Seseorang pelanggan yang memiliki id CU011 ingin memesan Jacquemue Linen Scarf yang sudah selesai diproduksi oleh UniDloX
--> Pelanggan ini memilih 1 Jacquemue Linen Scarf kesukaannya dan menuju kasir. 
--> Staff yang memiliki id SF007 menangani transaksi pembayaran tersebut. 
--> pelanggan membayar menggunakan uang cash (PA005)

BEGIN TRAN
INSERT INTO salesTransactionHeader VALUES 
--> data mengenai salesId, staffId, customerId, tanggal pembelian jaket, serta metode pembayaran
--> akan dimasukkan ke dalam database UniDloX tabel salesTransactionHeader
('SA026', 'SF007', 'CU011', '2021-12-25', 'PA005')
ROLLBACK

BEGIN TRAN
INSERT INTO salesTransactionDetail VALUES 
--> data mengenai salesId, clothId, salesQuantity
--> akan dimasukkan ke dalam database UniDloX tabel purchaseTransactionDetail
('SA026', 'CL006', 1)
ROLLBACK

--> setelah pelanggan membeli maka database akan mengupdate quantity barang yang sudah terbeli tersebut
BEGIN TRAN
UPDATE MsCloth
SET ClothStock -= 1
WHERE ClothId like 'CL006'
rollback
COMMIT


-->>>>> Purchase and Sales Transaction jika pelanggan baru/supplier baru/staff baru <<<<<<<<

--Purchase Transaction
--> Soal :
--> Musim dingin ini, seorang customer baru yang memiliki id CU016 memesan 100 boyfriend sweater di UniDloX 
--> Karena musim dingin baru dimulai 2 bulan lagi, persediaan kain wool yang merupakan bahan dasar dari boyfriend sweater tidak ada
--> UniDloX mengirim salah satu staff baru yang memiliki staffID SF016 untuk membeli bahan kain wool dari 
--> supplier baru yang memiliki supplierId SU016 dikarenakan harga yang lebih murah dengan kualitas yang sama
--> Customer membayar secara kredit(PA007) kepada UniDloX, sedangkan UniDloX membayar secara debit(PA006) kepada supplier baru

BEGIN TRAN
INSERT INTO MsCustomer VALUES 
--> MsCustomer terlebih dahulu karena soal tersebut customer memesan terlebih dahulu
--> Jika memesan dibutuhkan data pribadi dari customer
('CU016', 'Rose', '0876545667890', 'monas123', 'FEMALE', 'rose123@gmail.com', '1965-11-13')
ROLLBACK

-- Setelah memasukkan data pribadi pesanan akan diproses, tetapi UniDlox akan memproduksi sweater 
-- tersebut terlebih dahulu dikarenakan stoknya habis. UniDloX membeli bahan2nya tersebut terlebih dahulu
-- melalui staff baru. Staff baru dan supplier baru harus memasukkan data dirinya terlebih dahulu.

BEGIN TRAN
INSERT INTO MsStaff VALUES 
('SF016', 'Valentino', '081234567899', 'Kuta Kiri 23', 22, 'MALE', 1000000)
ROLLBACK

BEGIN TRAN
INSERT INTO MsSupplier VALUES 
('SU016', 'Abas Adjriyah', '081234567897', 'Seminyak')
ROLLBACK

BEGIN TRAN
INSERT INTO purchaseTransactionHeader VALUES 
--> data mengenai purchaseId, staffId, supplierId, tanggal pembelian bahan, serta metode pembayaran
--> akan dimasukkan ke dalam database UniDloX tabel purchaseTransactionHeader
('PU027', 'SF016', 'SU016', '2021-10-1', 'PA006')
ROLLBACK

BEGIN TRAN
INSERT INTO purchaseTransactionDetail VALUES 
--> data mengenai purchaseId, materialId, purchaseQuantity
--> akan dimasukkan ke dalam database UniDloX tabel purchaseTransactionDetail
('PU027', 'MA013', 1000)
ROLLBACK

-- Setelah membeli semua bahan2nya, UniDloX mulai memproduksi sweater sesuai pesanan
BEGIN TRAN
INSERT INTO salesTransactionHeader VALUES 
--> data mengenai salesId, staffId, customerId, tanggal pembelian jaket, serta metode pembayaran
--> akan dimasukkan ke dalam database UniDloX tabel salesTransactionHeader
('SA027', 'SF016', 'CU016', '2021-12-25', 'PA007')
ROLLBACK

BEGIN TRAN
INSERT INTO salesTransactionDetail VALUES 
--> data mengenai salesId, clothId, salesQuantity
--> akan dimasukkan ke dalam database UniDloX tabel purchaseTransactionDetail
('SA027', 'CL010', 10)
ROLLBACK

--> setelah pelanggan membeli maka database akan mengupdate quantity barang yang sudah terbeli tersebut
BEGIN TRAN
UPDATE MsCloth
SET ClothStock -= 10
WHERE ClothId like 'CL010'
rollback
COMMIT
