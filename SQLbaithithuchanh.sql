create database AZBank
go
use AZBank

create table Customer(
	Customerid int primary key not null,
	Name nvarchar(50) null,
	City nvarchar(50) null,
	Country nvarchar(50) null,
	Phone nvarchar(50) null,
	Email nvarchar(50) null,
	)
go

create table CustomerAccount(
	AccountNumber char(9) not null,
	Customerid int foreign key references Customer(CustomerID) not null,
	Balance money not null,
	MinAccount money null,
	primary key (AccountNumber),
)
go
create table CustomerTransaction(
	Transactionid int primary key not null,
	AccountNumber char(9) not null,
	TransactionDate smalldatetime null,
	Amount money null,
	DepositorWithdraw bit null,
	foreign key (AccountNumber) references CustomerAccount(AccountNumber),
) 
go

insert into Customer(Customerid, Name, City, Country, Phone, Email) values (1, N'Bùi Van Dung', N'Hà N?i', N'Vi?t Name', 0866861651, 'dungbui180603@gmail.com'),
																			(2, N'Bùi Van DungA', N'Hà Ðông', N'Vi?t Name', 0866861652, 'dungbui1806031@gmail.com'),
																			(3, N'Bùi Van DungB', N'Tuyên Quang', N'Vi?t Name', 0166636175927, 'dungbui1806032@gmail.com')
go

insert into CustomerAccount(AccountNumber, Customerid, Balance, MinAccount) values (11, 1, 1000000, 123),
																					(12, 2, 1000000, 456),
																					(13, 3, 1000000, 789)
go

insert into CustomerTransaction(Transactionid, AccountNumber, TransactionDate, Amount, DepositorWithdraw) values (111, 11, 2021-1-17, 10000, 1),		
																												(112, 12, 2021-1-17, 10000, 1),
																												(113, 13, 1712021, 10000, 1)
go


create view vCustomerTransactions as
select Name, AccountNumber, TransactionDate, Amount, DepositorWithdraw
from Customer, CustomerAccount, CustomerTransaction 
go