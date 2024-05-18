CREATE DATABASE [motel1]
USE [motel1]

CREATE TABLE [dbo].[accounts](
    [account_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [active] [bit] NOT NULL,
    [avatar] [varchar](255) NULL,
    [citizen] [varchar](255) NULL,
    [create_date] [date] NULL,
    [email] [varchar](255) NULL,
    [fullname] [nvarchar](255) NULL,
    [gender] [bit] NOT NULL,
    [password] [varchar](255) NULL,
    [phone] [varchar](255) NULL,
	[role] VARCHAR(50)
	);

CREATE TABLE [dbo].[tag](
    [tag_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [status] [bit] NOT NULL,
    [title] [nvarchar](255) NULL
	);

CREATE TABLE [dbo].[blog](
    [blog_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [create_date] [datetime2](7) NULL,
    [descriptions] [nvarchar](max) NULL,
    [image] [varchar](255) NULL,
    [status] [bit] NOT NULL,
    [title] [nvarchar](255) NULL,
    [account_id] [int] NULL,
    [tag_id] [int] NULL,
    FOREIGN KEY ([tag_id]) REFERENCES [dbo].[tag] ([tag_id]),
    FOREIGN KEY ([account_id]) REFERENCES [dbo].[accounts] ([account_id])
	);

CREATE TABLE [dbo].[category_room](
    [category_room_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [descriptions] [nvarchar](255) NULL,
    [quantity] [int] NULL,
    [status] [bit] NOT NULL
	);

CREATE TABLE [dbo].[invoice_status](
    [invoice_status_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [title] [nvarchar](255) NULL
	);
CREATE TABLE [dbo].[motels](
    [motel_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [create_date] [date] NULL,
    [descriptions] [nvarchar](255) NULL,
    [detail_address] [nvarchar](255) NULL,
    [district] [nvarchar](255) NULL,
    [districtid] [varchar](255) NULL,
    [image] [varchar](255) NULL,
    [province] [nvarchar](255) NULL,
    [provinceid] [varchar](255) NULL,
    [status] [bit] NOT NULL,
    [ward] [nvarchar](255) NULL,
    [account_id] [int] NULL,
    FOREIGN KEY ([account_id]) REFERENCES [dbo].[accounts] ([account_id])
	);
CREATE TABLE [dbo].[room_status](
    [room_status_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](255) NULL
	);
CREATE TABLE [dbo].[motel_room](
    [motel_room_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [create_date] [date] NULL,
    [descriptions] [nvarchar](255) NULL,
    [length] [float] NOT NULL,
    [status] [bit] NOT NULL,
    [video] [varchar](255) NULL,
    [width] [float] NOT NULL,
    [category_room_id] [int] NULL,
    [motel_id] [int] NULL,
    [room_status_id] [int] NULL,
    FOREIGN KEY ([room_status_id]) REFERENCES [dbo].[room_status] ([room_status_id]),
    FOREIGN KEY ([category_room_id]) REFERENCES [dbo].[category_room] ([category_room_id]),
    FOREIGN KEY ([motel_id]) REFERENCES [dbo].[motels] ([motel_id]),
    CONSTRAINT [CK_motel_room_length] CHECK ([length] >= 1),
    CONSTRAINT [CK_motel_room_width] CHECK ([width] >= 1)
	);

CREATE TABLE [dbo].[electricity_cash](
    [electricity_cash_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [create_date] [date] NULL,
    [electricity_bill] [float] NULL,
    [motel_room_id] [int] NULL,
    FOREIGN KEY ([motel_room_id]) REFERENCES [dbo].[motel_room] ([motel_room_id]))

CREATE TABLE [dbo].[favorite_room](
    [favorite_room_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [create_date] [date] NULL,
    [status] [bit] NOT NULL,
    [account_id] [int] NULL,
    [motel_room_id] [int] NULL,
    FOREIGN KEY ([account_id]) REFERENCES [dbo].[accounts] ([account_id]),
    FOREIGN KEY ([motel_room_id]) REFERENCES [dbo].[motel_room] ([motel_room_id])
	);

CREATE TABLE [dbo].[image](
    [image_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [name] [varchar](255) NULL,
    [motel_room_id] [int] NULL,
    FOREIGN KEY ([motel_room_id]) REFERENCES [dbo].[motel_room] ([motel_room_id])
	);

CREATE TABLE [dbo].[indexs](
    [index_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [create_date] [datetime2](7) NULL,
    [electricity_index] [float] NULL,
    [water_index] [float] NULL,
    [motel_room_id] [int] NULL,
    FOREIGN KEY ([motel_room_id]) REFERENCES [dbo].[motel_room] ([motel_room_id])
	);

CREATE TABLE [dbo].[posts](
    [post_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [create_date] [date] NULL,
    [status] [bit] NOT NULL,
    [title] [nvarchar](255) NULL,
    [motel_id] [int] NULL,
    FOREIGN KEY ([motel_id]) REFERENCES [dbo].[motels] ([motel_id])
	);
CREATE TABLE [dbo].[renter](
    [renter_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [change_room_date] [date] NULL,
    [check_out_date] [date] NULL,
    [renter_date] [date] NULL,
    [account_id] [int] NULL,
    [motel_room_id] [int] NULL,
    FOREIGN KEY ([motel_room_id]) REFERENCES [dbo].[motel_room] ([motel_room_id]),
    FOREIGN KEY ([account_id]) REFERENCES [dbo].[accounts] ([account_id])
	);

CREATE TABLE [dbo].[request_authority_status](
    [request_authority_status_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [name] [nvarchar](255) NULL
	);
CREATE TABLE [dbo].[request_authority](
    [request_authority_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [avatar] [varchar](255) NULL,
    [createdate] [date] NULL,
    [descriptions] [nvarchar](255) NULL,
    [respdescriptions] [nvarchar](255) NULL,
    [responsedate] [date] NULL,
    [account_id] [int] NULL,
    [request_authority_status_id] [int] NULL,
    FOREIGN KEY ([account_id]) REFERENCES [dbo].[accounts] ([account_id]),
    FOREIGN KEY ([request_authority_status_id]) REFERENCES [dbo].[request_authority_status] ([request_authority_status_id])
	);
CREATE TABLE [dbo].[invoice](
    [invoice_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [create_date] [date] NULL,
    [new_electricity_index] [float] NULL,
    [new_water_index] [float] NULL,
    [old_electricity_index] [float] NULL,
    [old_water_index] [float] NULL,
    [total_price] [float] NULL,
    [invoice_status_id] [int] NULL,
    [renter_id] [int] NULL,
    FOREIGN KEY ([invoice_status_id]) REFERENCES [dbo].[invoice_status] ([invoice_status_id]),
    FOREIGN KEY ([renter_id]) REFERENCES [dbo].[renter] ([renter_id])
	);

CREATE TABLE [dbo].[room_cash](
    [room_cash_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [create_date] [date] NULL,
    [room_bill] [float] NULL,
    [motel_room_id] [int] NULL,
    FOREIGN KEY ([motel_room_id]) REFERENCES [dbo].[motel_room] ([motel_room_id])
	);

CREATE TABLE [dbo].[water_cash](
    [water_cash_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [create_date] [date] NULL,
    [water_bill] [float] NULL,
    [motel_room_id] [int] NULL,
    FOREIGN KEY ([motel_room_id]) REFERENCES [dbo].[motel_room] ([motel_room_id])
	);

CREATE TABLE [dbo].[wifi_cash](
    [wifi_cash_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [create_date] [date] NULL,
    [wifi_bill] [float] NULL,
    [motel_room_id] [int] NULL,
    FOREIGN KEY ([motel_room_id]) REFERENCES [dbo].[motel_room] ([motel_room_id])
	);

INSERT [dbo].[accounts] ([active], [avatar], [citizen], [create_date], [email], [fullname], [gender], [password], [phone], [role]) VALUES ( 1, NULL, NULL, NULL, N'admin@gmail.com', N'ADMIN', 0, N'$2a$10$uXuofG8QEf4SFRpdWSxt3u9U4/hEX4FPLj8rHdbPo9bipmRjMqVsy', NULL,'admin')
INSERT [dbo].[accounts] ([active], [avatar], [citizen], [create_date], [email], [fullname], [gender], [password], [phone], [role]) VALUES ( 1, NULL, NULL, NULL, N'admin2@gmail.com', N'ADMIN2', 0, N'123456', NULL,'admin')

INSERT [dbo].[invoice_status] ([title]) VALUES (N'Đã thanh toán')
INSERT [dbo].[invoice_status] ([title]) VALUES (N'Chưa thanh toán')

INSERT [dbo].[request_authority_status] ([name]) VALUES (N'Đang xử lí')
INSERT [dbo].[request_authority_status] ([name]) VALUES (N'Đã duyệt')
INSERT [dbo].[request_authority_status] ([name]) VALUES (N'Không duyệt')
INSERT [dbo].[request_authority_status] ([name]) VALUES (N'Yêu cầu đã hủy')

INSERT [dbo].[room_status] ([name]) VALUES (N'Phòng trống')
INSERT [dbo].[room_status] ([name]) VALUES (N'Phòng có người ở')

