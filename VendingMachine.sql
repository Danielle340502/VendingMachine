USE [master]
GO
/****** Object:  Database [VendingMachines]    Script Date: 11.02.2022 3:45:29 ******/
CREATE DATABASE [VendingMachines]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VendingMachines', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\VendingMachines.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VendingMachines_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\VendingMachines_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VendingMachines] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VendingMachines].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VendingMachines] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VendingMachines] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VendingMachines] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VendingMachines] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VendingMachines] SET ARITHABORT OFF 
GO
ALTER DATABASE [VendingMachines] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VendingMachines] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VendingMachines] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VendingMachines] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VendingMachines] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VendingMachines] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VendingMachines] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VendingMachines] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VendingMachines] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VendingMachines] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VendingMachines] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VendingMachines] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VendingMachines] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VendingMachines] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VendingMachines] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VendingMachines] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VendingMachines] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VendingMachines] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VendingMachines] SET  MULTI_USER 
GO
ALTER DATABASE [VendingMachines] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VendingMachines] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VendingMachines] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VendingMachines] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VendingMachines] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VendingMachines] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VendingMachines] SET QUERY_STORE = OFF
GO
USE [VendingMachines]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11.02.2022 3:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coins]    Script Date: 11.02.2022 3:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Denomination] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Coins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drinks]    Script Date: 11.02.2022 3:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drinks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.Drinks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 11.02.2022 3:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendingMachineId] [int] NOT NULL,
	[DrinkId] [int] NOT NULL,
	[AfterUpdate] [int] NOT NULL,
	[Profit] [int] NOT NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendingMachineCoins]    Script Date: 11.02.2022 3:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendingMachineCoins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendingMachineId] [int] NOT NULL,
	[CoinsId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_dbo.VendingMachineCoins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendingMachineDrinks]    Script Date: 11.02.2022 3:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendingMachineDrinks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendingMachineId] [int] NOT NULL,
	[DrinksId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_dbo.VendingMachineDrinks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendingMachines]    Script Date: 11.02.2022 3:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendingMachines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SecretCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.VendingMachines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202112031813037_InitialCreate', N'VendingMachineForDrinksAPI.Models.VendingMachinesContext', 0x1F8B080000000000000AEC5C6D6FDB3610FE3E60FF41D0A76D48A3A4C5802EB05BA47632186B5E10A7C5BE158C74768849942651418261BF6C1FF693F617767AB548891665CB2F698302454C1DEF78778FC823F9D8FFFDF3EFE0FDA3E71A0F1046D46743F3F8F0C83480D9BE43D97C68C67CF6EAADF9FEDDF7DF0DCE1CEFD1F85CC8BD49E4B0278B86E63DE7C1896545F63D78243AF4A81DFA913FE387B6EF59C4F1ADD74747BF58C7C716A00A137519C6E026669C7A907EC08F239FD910F098B817BE036E94B7E39369AAD5B8241E4401B161687E06960CEE82D8F794C1B91F8E43CAFE884EAF27875967D3387529C1814DC19D990661CCE784E3B04F3E4530E5A1CFE6D3001B887BFB1400CACD881B41EECEC9425CD7B3A3D78967D6A263A1CA8E23EE7B1D151EBFC94365C9DD570A7816EF3C98671874FE94789D0674688E7CCA305EB2A593911B26521AC13E4C551C186AC183123508AEE4DF81318A5D1E87306410F390B807C6757CE752FB3778BAF5FF003664B1EB56078E43C7674203365D877E00217FBA8159EECEC4310D4BEC67C91DCB6E953E99AF13C6DFBC368D4B344EEE5C28715189CB94FB21FC0A0C42C2C1B9269C4388699D389046B6665DB23506E67B94E5D95C6EB5AA69602D32B7349F59D0D74B68D6F09251AD8C26FF1799C4A905236B1A17E4F123B039BF1F9A3FE32C794E1FC1291AF2E47E6214A758ECC3C3185A92DF00598FCC4BAB1F104FE1936015FF6C36DBD1CEC88F7861660C36F5886B1AD721FE952F166F4D636A93445F6F0816F1B91E92458917446B217A0A76087C8411DC30AE5784440F4B5683C217706881438C5CFBD2D936BF60E4D75782A5E47A2A26D1A9CDE90374D472491EE83C055F935FA671036EFA34BAA741568C3621EF4B2E7D1EFADE8D9F58530A7D99FA716827C3F4DB246F493807AE3F6479DAD51CBBDC6DB913629B9637529726B7569C47FA28959A34BECC243B9849B2D0EF622A51BE5105BE5ADFA44CF04B21AF7A8504B1967747945D6F2EE8E042AD638B2F92BC9E5372A72E53C26914F9364D7D51D716F9842C06EB8C3986F6EC9C554D8A3913EB28DCFDD200F7BB38C2A1F9532D313AB60AAF2BB61AB51F8B7EA0F62B3606173818C99A9754F12312D924A9F6E49D338E436CC18D3684C9EB4D5C3CB08970EB4E19AFEFCA29B369405C5D1F24059A1BFB6480A529F9C91802B48A23D5CD99CE18CA6AA53E90D29E14C1B6800DAC0A22BB03555A7DBBA048B5146F14BA8AC55C69F47980B9D9AB1DA1BA39AF3A83A92FC87B8073716DD4C39A62A154816C9CAFBBAB42BB79ADAD986B36B06F586E7463EB201647D101BD598FFD42AD5C0E75C293B236DA308E55E5D5B39DA497FBB52B842BD2BBB71375564F631F8E3D206CDE29248FE19137ECA9F1E22DDF5647F9D9A00CCA44FD14B87882B2A8E2C51AD75ADEBB78156ADD8B072DFD6580D7F4C8029DF4A97C6B94EAA459E977B398A4BB92F9A5432F0EAC2AF2ADA75B3240BB6CA74A9F1581ACA1BFCBFEA9A2BC39E2D51702C5560C990C18BDD82DABEF57ADF07B8EA6A2A4575AE93DBE42C5D01E58515CD7D7C6B244ED64F30BD6B986ACE857BCB23D05AF766EA319C5A505CEEA254EEF7155D5347DA0B4386A2A97C60575C5CAB82B05C7C552905C06172408D07685F492B718D38CF1327A35EDCEFDF0321D962DE4455EC84B4B486CC04B65E96932293A704EC3888F0927772439001D395E4D4C51082816AFC26875ADAFA7B458C30AE9E4EF26102B49290DD554AEEB1C7DF5920A2DE573D4D6805ABF9487445C1236704746BE1B7B4C5D29AA7B8B6C90AA1EF1495DE3C0921CA91580B5F0D52A6D31175A9952CE9AEBA4AA59A946AE541D3793AC8CE851ED9FB5E86BC8591BC210B2267D1D1923A3AA226BD91B88B4962CEB4065B9720DC8B429D80C74AA8C8AAA966AFB9E26701373B38685CEA9DCEABC5DDF805775B56FCFD59ACB2B06F10D57DC3B2CD3935E648A5AD2A60ED355498A102255B6EE296237B246E998E88CD9EDAE5F9B03EDE2E85528619407B2FDC076A3601BC845BD2C525A2F8B7BA9881FE405753B9DBD5661672209D1D27FA04E525D4F9F220EDE61227038FDD31DB914FD5D085C10466710F18C3B6D2285FCB54481DF1F3ABA15458EABC349DF3AFB1B0F4291CDDAC6EFEECA4B69207CA7867AA57B7F1DB1AA52A9D90309ED7B12D648A7EB30A551E75D4A96FEC1238F3FAEC5867676C386FE3A125D6718AF96EE15A3F835CD2F2A165D6AAC760B33C12BA1C7A1F957DAF9C498FC2E9D8C4D9C03E32AC415E5C43832FE5E97CEAB3B86BCDB9AA62BCCBDF609B69D02DCE324DD5EF5BDC0AF0FF82D2ACE6EF82BFA6D13809B2428E617395B65062EBD245A9F56B6120D4075B2B00D1ED6B74428DC1537641F31D77A42B937E07BC674BFE21A70BB1CBBE5778C3D10B356029CF22C6A2B34A66F8C9AB76F33DD6EA1B7EBB9AE0304F7883257BF505F8B09971D16E281C49D8F38C8EACD9E48724DAA3745A06BB25563A56C8E65D76E7E0B74BCF641EC15714F08B09A40D75EA87563A43D47429EA9CF34DABB706D885F27BE1B4B386E1ACB5F47BED87365CDF583A2FE8356BB2C5333E0EA9762B8BE567E090A57FC88CE172A92DF856290D64B0BA585CC84CDFC62A99746548848873417C08983CBEE69C8E98CD81C1FDB1045E8BB697C266E8C2267DE1D38137615F320E6E8327877AEF05DE6A45058663FA5F989631E5C05E9B767FB70018749D105B8621F62EA3AE5B8CF1BCE98142A920A243F824E7289050D8739FA986BBAF4653CA914E5E12B0BA75BF002FCA23044576C4A92A3D4EE63C3EF097C8439B19F8ABB4DB592F64488611F8C299987C48B721D8BFEF811318CBF4DF6EE7F000000FFFF030059852499104D0000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[Coins] ON 

INSERT [dbo].[Coins] ([Id], [Denomination]) VALUES (1, 1)
INSERT [dbo].[Coins] ([Id], [Denomination]) VALUES (2, 2)
INSERT [dbo].[Coins] ([Id], [Denomination]) VALUES (3, 5)
INSERT [dbo].[Coins] ([Id], [Denomination]) VALUES (4, 10)
SET IDENTITY_INSERT [dbo].[Coins] OFF
GO
SET IDENTITY_INSERT [dbo].[Drinks] ON 

INSERT [dbo].[Drinks] ([Id], [Name], [Image], [Cost]) VALUES (1, N'Coca-Cola', N'drinks/cocacola33.png', CAST(78.00 AS Decimal(18, 2)))
INSERT [dbo].[Drinks] ([Id], [Name], [Image], [Cost]) VALUES (2, N'FANTA', N'drinks/fanta0.33.png', CAST(86.00 AS Decimal(18, 2)))
INSERT [dbo].[Drinks] ([Id], [Name], [Image], [Cost]) VALUES (3, N'Mountain Dew', N'drinks/md033.png', CAST(84.00 AS Decimal(18, 2)))
INSERT [dbo].[Drinks] ([Id], [Name], [Image], [Cost]) VALUES (4, N'Sprite', N'drinks/sprite033.png', CAST(84.00 AS Decimal(18, 2)))
INSERT [dbo].[Drinks] ([Id], [Name], [Image], [Cost]) VALUES (6, N'pepsi', N'drinks/pepsi.png', CAST(82.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Drinks] OFF
GO
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([Id], [VendingMachineId], [DrinkId], [AfterUpdate], [Profit]) VALUES (1, 1, 1, 2, 78)
INSERT [dbo].[Report] ([Id], [VendingMachineId], [DrinkId], [AfterUpdate], [Profit]) VALUES (2, 1, 2, 3, 0)
INSERT [dbo].[Report] ([Id], [VendingMachineId], [DrinkId], [AfterUpdate], [Profit]) VALUES (3, 1, 3, 5, 84)
INSERT [dbo].[Report] ([Id], [VendingMachineId], [DrinkId], [AfterUpdate], [Profit]) VALUES (4, 1, 4, 2, 0)
INSERT [dbo].[Report] ([Id], [VendingMachineId], [DrinkId], [AfterUpdate], [Profit]) VALUES (5, 1, 6, 8, 0)
SET IDENTITY_INSERT [dbo].[Report] OFF
GO
SET IDENTITY_INSERT [dbo].[VendingMachineCoins] ON 

INSERT [dbo].[VendingMachineCoins] ([Id], [VendingMachineId], [CoinsId], [Count], [IsActive]) VALUES (1, 1, 1, 1, 0)
INSERT [dbo].[VendingMachineCoins] ([Id], [VendingMachineId], [CoinsId], [Count], [IsActive]) VALUES (2, 1, 2, 4, 1)
INSERT [dbo].[VendingMachineCoins] ([Id], [VendingMachineId], [CoinsId], [Count], [IsActive]) VALUES (3, 1, 3, 3, 1)
INSERT [dbo].[VendingMachineCoins] ([Id], [VendingMachineId], [CoinsId], [Count], [IsActive]) VALUES (5, 1, 4, 68, 1)
SET IDENTITY_INSERT [dbo].[VendingMachineCoins] OFF
GO
SET IDENTITY_INSERT [dbo].[VendingMachineDrinks] ON 

INSERT [dbo].[VendingMachineDrinks] ([Id], [VendingMachineId], [DrinksId], [Count]) VALUES (1, 1, 1, 1)
INSERT [dbo].[VendingMachineDrinks] ([Id], [VendingMachineId], [DrinksId], [Count]) VALUES (2, 1, 2, 3)
INSERT [dbo].[VendingMachineDrinks] ([Id], [VendingMachineId], [DrinksId], [Count]) VALUES (3, 1, 3, 4)
INSERT [dbo].[VendingMachineDrinks] ([Id], [VendingMachineId], [DrinksId], [Count]) VALUES (5, 1, 4, 2)
INSERT [dbo].[VendingMachineDrinks] ([Id], [VendingMachineId], [DrinksId], [Count]) VALUES (7, 1, 6, 8)
SET IDENTITY_INSERT [dbo].[VendingMachineDrinks] OFF
GO
SET IDENTITY_INSERT [dbo].[VendingMachines] ON 

INSERT [dbo].[VendingMachines] ([Id], [SecretCode]) VALUES (1, N'U2VjcmV0Q29kZTE=')
SET IDENTITY_INSERT [dbo].[VendingMachines] OFF
GO
/****** Object:  Index [IX_CoinsId]    Script Date: 11.02.2022 3:45:29 ******/
CREATE NONCLUSTERED INDEX [IX_CoinsId] ON [dbo].[VendingMachineCoins]
(
	[CoinsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VendingMachineId]    Script Date: 11.02.2022 3:45:29 ******/
CREATE NONCLUSTERED INDEX [IX_VendingMachineId] ON [dbo].[VendingMachineCoins]
(
	[VendingMachineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DrinksId]    Script Date: 11.02.2022 3:45:29 ******/
CREATE NONCLUSTERED INDEX [IX_DrinksId] ON [dbo].[VendingMachineDrinks]
(
	[DrinksId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VendingMachineId]    Script Date: 11.02.2022 3:45:29 ******/
CREATE NONCLUSTERED INDEX [IX_VendingMachineId] ON [dbo].[VendingMachineDrinks]
(
	[VendingMachineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Drinks] FOREIGN KEY([DrinkId])
REFERENCES [dbo].[Drinks] ([Id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Drinks]
GO
ALTER TABLE [dbo].[VendingMachineCoins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.VendingMachineCoins_dbo.Coins_CoinsId] FOREIGN KEY([CoinsId])
REFERENCES [dbo].[Coins] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VendingMachineCoins] CHECK CONSTRAINT [FK_dbo.VendingMachineCoins_dbo.Coins_CoinsId]
GO
ALTER TABLE [dbo].[VendingMachineCoins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.VendingMachineCoins_dbo.VendingMachines_VendingMachineId] FOREIGN KEY([VendingMachineId])
REFERENCES [dbo].[VendingMachines] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VendingMachineCoins] CHECK CONSTRAINT [FK_dbo.VendingMachineCoins_dbo.VendingMachines_VendingMachineId]
GO
ALTER TABLE [dbo].[VendingMachineDrinks]  WITH CHECK ADD  CONSTRAINT [FK_dbo.VendingMachineDrinks_dbo.Drinks_DrinksId] FOREIGN KEY([DrinksId])
REFERENCES [dbo].[Drinks] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VendingMachineDrinks] CHECK CONSTRAINT [FK_dbo.VendingMachineDrinks_dbo.Drinks_DrinksId]
GO
ALTER TABLE [dbo].[VendingMachineDrinks]  WITH CHECK ADD  CONSTRAINT [FK_dbo.VendingMachineDrinks_dbo.VendingMachines_VendingMachineId] FOREIGN KEY([VendingMachineId])
REFERENCES [dbo].[VendingMachines] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VendingMachineDrinks] CHECK CONSTRAINT [FK_dbo.VendingMachineDrinks_dbo.VendingMachines_VendingMachineId]
GO
USE [master]
GO
ALTER DATABASE [VendingMachines] SET  READ_WRITE 
GO
