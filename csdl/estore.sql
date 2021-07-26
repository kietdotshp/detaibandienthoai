create database duan
go
use duan
go
create table Categories(
	Id int not null identity(1,1) primary key,
	Name nvarchar(50) not null,
	NameVN nvarchar(MAX) not null
)
create table Products(
	Id int not null identity(1,1) primary key,
	Name nvarchar(60) not null,
	UnitPrice float not null,
	Image nvarchar(50) not null,
	ProductDate date not null,
	Available bit not null,
	CategoryId int not null,
	Quantity int not null,
	Description nvarchar(MAX) ,
	Discount float not null,
	ViewCount int not null,
	Special bit not null
)
create table Users(
	Id nvarchar(20) not null primary key,
	Password nvarchar(50) not null,
	Fullname nvarchar(50) not null,
	Telephone int not null,
	Email nvarchar(50) not null,
	Photo nvarchar(50) not null,
	Activated bit not null,
	Admin bit not null
)
create table Orders(
	Id int not null identity(1,1) primary key,
	UserId nvarchar(20) not null,
	OrderDate datetime not null,
	Telephone int not null,
	Address nvarchar(60) not null,
	Amount float not null,
	Description nvarchar(1000)
)
ALTER TABLE Orders
   ADD Status int;
create table OrderDetails(
	Id int not null identity(1,1) primary key,
	OrderId int not null,
	ProductId int not null,
	UnitPrice float not null,
	Quantity int not null,
	Discount float not null

	constraint fk_order foreign key (OrderID) references Orders(Id) on delete cascade
)
--Khoa ngoai:
 ALTER TABLE Products ADD FOREIGN KEY (CategoryId) REFERENCES Categories(Id);	
  ALTER TABLE OrderDetails ADD FOREIGN KEY (ProductId) REFERENCES Products(Id);	
	ALTER TABLE Orders ADD FOREIGN KEY (UserId) REFERENCES Users(Id);


insert into Categories
values  (N'Điện thoại','OPPO'),
		(N'Điện thoại','SAMSUNG'),
		(N'Điện thoại','APPLE'),
		(N'Điện thoại','XIAOMI'),
		(N'Điện thoại','HUAWEI'),
		(N'Điện thoại','MASTEL'),
		(N'Điện thoại','LENOVO'),
		(N'Điện thoại','ASUS'),
		(N'Điện thoại','NOKIA'),
		(N'Điện thoại','REDMI')

insert into Products
values  ('IPhone 12 Pro Max',33990000,'ip12_pro_max.png','02/11/2020',1,'3','50',N'iPhone 12 Pro Max sở hữu màn hình kích thước khó tin, lên tới 6,7 inch, cho bạn trải nghiệm hình ảnh cực đã. Chất lượng đến từ một màn hình công nghệ Super Retina XDR, tấm nền OLED cao cấp và độ phân giải siêu cao thực sự quá tuyệt vời.
Mọi thứ đều trở nên sống động trên iPhone 12 Pro Max, đặc biệt khi bạn xem ảnh, xem phim hay chơi game. Còn bất ngờ hơn khi dù màn hình lớn hơn, nhưng iPhone 12 Pro Max vẫn gọn gàng như thế hệ trước nhờ viền màn hình được tối ưu siêu mỏng đầy tinh tế.','0.5','1000',0),
		('Samsung Galaxy Note 20 Ultra 5G',28490000,'samsung_note20_5G.png','02/11/2020',1,'2','50',N'Samsung Galaxy Note20 Ultra 5G là chiếc điện thoại có được sự hoàn thiện tỉ mỉ nhất hiện nay. Sở hữu màn hình lớn tới 6,9 inch nhưng máy vẫn rất dễ dàng sử dụng, thao tác, cầm nắm nhờ phần khung viền cong mượt mà, liền lạc một cách hoàn hảo. Khung điện thoại làm từ kim loại sắc sảo, cắt kim cương sáng bóng và cả những đường phay xước phá cách.','0','1',0),
		('OPPO Reno4',7210000,'oppo_reno4.png','02/11/2020',1,'1','50',N'OPPO Reno4 đẹp tựa như một kiệt tác trên tay bạn với kiểu dáng mỏng nhẹ thanh lịch và hoàn thiện dạng pha lê Reno Glow độc đáo. Công nghệ hoàn thiện Reno Glow mang đến một mặt lưng kính đặc biệt, bền hơn, sang trọng hơn và không bám bẩn, mồ hôi hay dấu vân tay. Để có được thiết kế xuất sắc, mỗi chiếc OPPO Reno4 đã phải trải qua nhiều quá trình điêu khắc tinh xảo, thay đổi cấu trúc vi mô của chất liệu kính. ','0.05','1',0),
		('OPPO A93 8GB-128GB',6360000,'oppo_A93.png','02/11/2020',1,'1','50',N'OPPO Reno4 đẹp tựa như một kiệt tác trên tay bạn với kiểu dáng mỏng nhẹ thanh lịch và hoàn thiện dạng pha lê Reno Glow độc đáo. Công nghệ hoàn thiện Reno Glow mang đến một mặt lưng kính đặc biệt, bền hơn, sang trọng hơn và không bám bẩn, mồ hôi hay dấu vân tay. Để có được thiết kế xuất sắc, mỗi chiếc OPPO Reno4 đã phải trải qua nhiều quá trình điêu khắc tinh xảo, thay đổi cấu trúc vi mô của chất liệu kính. ','0.05','1',0),
		('Oppo Reno4 Pro',10190000,'oppo_reno4_pro.png','02/11/2020',1,'1','50',N'OPPO Reno4 đẹp tựa như một kiệt tác trên tay bạn với kiểu dáng mỏng nhẹ thanh lịch và hoàn thiện dạng pha lê Reno Glow độc đáo. Công nghệ hoàn thiện Reno Glow mang đến một mặt lưng kính đặc biệt, bền hơn, sang trọng hơn và không bám bẩn, mồ hôi hay dấu vân tay. Để có được thiết kế xuất sắc, mỗi chiếc OPPO Reno4 đã phải trải qua nhiều quá trình điêu khắc tinh xảo, thay đổi cấu trúc vi mô của chất liệu kính. ','0.05','1',0),
		('Oppo A53 4GB-128GB',
		4490000,
		'oppo_A53.png',
		'02/11/2020',
		1,
		'1',
		'50',
		N'
		<h4>Đánh giá chi tiết Oppo A53 4GB-128GB</h4>
		<p>&nbsp;</p>
		<p>Mượt mà hơn bao giờ hết với màn hình 90Hz, sạc nhanh siêu tốc 18W và camera 16MP selfie tuyệt đẹp, OPPO A53 mang đến cho người dùng những bất ngờ thú vị trong tầm giá hấp dẫn.</p>
		<p><img alt="Oppo A53 4GB-128GB" src="https://img.fpt.shop/f_jpg/cmpr_10/https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/oppo-a53.jpg" /></p>
		<p>&nbsp;</p>
		<h4>Cảm nhận sự mượt mà trên màn hình 90Hz của OPPO A53</h4>
		<p>Màn hình OPPO A53 trở nên nổi bật với thiết kế viền mỏng dạng “đục lỗ” kiểu mới, mang đến trải nghiệm hiển thị “tràn viền” đẹp mắt hơn. Không chỉ vậy, với tần số quét lên tới 90Hz, cao gấp rưỡi so với màn hình smartphone thông thường, tất cả những gì bạn thấy hay những thao tác vuốt chạm trên OPPO A53 đều trở nên mượt mà hơn. Kể cả chơi game lẫn các tác vụ thường ngày, sự mượt mà của OPPO A53 mang đến cho bạn rất nhiều niềm vui khi sử dụng điện thoại.</p>
		<p>&nbsp;</p>
		',
		'0.05',
		'1',
		0),
		--sp7
		('OPPO A92',
		5510000,
		'oppo_A92.png',
		'02/05/2020',
		1,
		'1',
		'100',
		N'
		<h4>Đánh giá chi tiết Oppo A92</h4>
		<p>&nbsp;</p>
		<p>Màn hình chấm O tinh tế, hiệu năng mạnh mẽ, 4 camera AI 48MP và viên pin dung lượng cực “khủng”, bạn sẽ hoàn toàn hài lòng về OPPO A92, chiếc điện thoại siêu mượt mà, đầy đẳng cấp.</p>
		<p><img alt="Oppo A92" src="https://img.fpt.shop/f_jpg/cmpr_10/https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/oppo-a92-1.jpg" /></p>
		<p>&nbsp;</p>
		<h4>Trải nghiệm hình ảnh hoàn toàn mới trên màn hình chấm O</h4>
		<p>Đến với những điều kỳ thú trên không gian màn hình lớn tớn 6,5 inch và độ phân giải Full HD+ sắc nét của OPPO A92. Không chỉ màn hình lớn, độ phân giải cao, điều đặc biệt của màn hình này còn đến từ viền cạnh siêu mỏng và thiết kế chấm O tinh tế. Viền cạnh mỏng chỉ 1,73mm, camera trước được đặt vào ngay trong tấm kính màn hình giúp trải nghiệm xem của bạn trở nên thú vị hơn bao giờ hết. Hơn nữa, màn hình này còn có chế độ bảo vệ mắt, để bạn dù có sử dụng lâu, đôi mắt vẫn hoàn toàn khỏe mạnh mà không hề bị mỏi.</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		',
		'0.05',
		'1',
		0),
		--sp08
		('Oppo A31 4GB-128GB',
		4490000,
		'oppo_A31.png',
		'02/05/2020',
		1,
		'1',
		'100',
		N'
		<h4>Đánh giá chi tiết Oppo A31 4GB-128GB</h4>
		<p>&nbsp;</p>
		<p>Với bộ nhớ trong cực lớn 128GB, viên pin dung lượng cao 4230 mAh và màn hình giọt nước 6,5 inch, OPPO A31 4GB-128GB mang đến cho bạn những trải nghiệm lớn hơn, giúp cuộc sống trở nên dễ dàng hơn.</p>
		<p><img alt="Oppo A31 4GB-128GB" src="https://img.fpt.shop/f_jpg/cmpr_10/https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/oppo-a31-8.jpg" /></p>
		<p>&nbsp;</p>
		<h4>Một chiếc điện thoại chụp hình tốt trong mọi hoàn cảnh</h4>
		<p>OPPO A31 sở hữu tới 3 camera sau, giúp bạn chụp ảnh xuất sắc trong mọi hoàn cảnh. Camera chính 12MP sẽ chụp ảnh sắc nét ở điều kiện thông thường; camera macro chuyên chụp cận cảnh những vật nhỏ ở khoảng cách cực gần; và cuối cùng là camera tạo độ sâu, hỗ trợ chụp ảnh chân dung xóa phông đầy chuyên nghiệp.</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		',
		'0.05',
		'1',
		0),
		--sp09
		('Oppo A52 6GB-128GB',
		5390000,
		'oppo_A52.png',
		'02/05/2020',
		1,
		'1',
		'100',
		N'
		<h4>Đánh giá chi tiết Oppo A52 6GB-128GB</h4>
		<p>&nbsp;</p>
		<p>Cùng OPPO A52 tận hưởng cuộc sống, cho mỗi khoảnh khắc của bạn trở nên đáng nhớ hơn với màn hình Neo tuyệt đẹp, trải nghiệm mượt mà và bộ tứ camera đỉnh cao.</p>
		<p><img alt="Oppo A52 6GB-128GB" src="https://img.fpt.shop/f_jpg/cmpr_10/https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/oppo-a52.jpg" /></p>
		<p>&nbsp;</p>
		<h4>Màn hình Neo hoàn toàn mới</h4>
		<p>OPPO A52 sở hữu màn hình lớn 6,5 inch và độ phân giải Full HD+ 2400x1080 pixels sắc nét. Không chỉ xuất sắc ở chất lượng hiển thị, điểm nhấn màn hình OPPO A52 còn đến từ cách thiết kế. Các viền màn hình siêu mỏng và camera trước đặt khéo léo ngay trong tấm kính màn hình, tạo nên trải nghiệm xem ấn tượng nhất. OPPO gọi đây là thiết kế màn hình Neo, màn hình sẽ mang đến những điều khác biệt, đặc biệt là khi chơi game hay xem phim.</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		',
		'0.05',
		'1',
		0)



insert into Users
values (1,'123456',N'Nguyễn Thành Luận','0543838193','thanhluanxhxh2000@gmail.com','luan.jpg','1','1'),
		(2,'123456',N'Nguyễn Thành Hưng','0352616273','thanhluan2000@gmail.com','luan.jpg','1','0')



