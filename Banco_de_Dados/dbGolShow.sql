USE [master]
GO
/****** Object:  Database [dbGolshow]    Script Date: 04/09/2023 00:42:38 ******/
CREATE DATABASE [dbGolshow]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbGolshow', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbGolshow.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbGolshow_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbGolshow_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbGolshow] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbGolshow].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbGolshow] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbGolshow] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbGolshow] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbGolshow] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbGolshow] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbGolshow] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbGolshow] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbGolshow] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbGolshow] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbGolshow] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbGolshow] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbGolshow] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbGolshow] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbGolshow] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbGolshow] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbGolshow] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbGolshow] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbGolshow] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbGolshow] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbGolshow] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbGolshow] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbGolshow] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbGolshow] SET RECOVERY FULL 
GO
ALTER DATABASE [dbGolshow] SET  MULTI_USER 
GO
ALTER DATABASE [dbGolshow] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbGolshow] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbGolshow] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbGolshow] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbGolshow] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbGolshow] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbGolshow', N'ON'
GO
ALTER DATABASE [dbGolshow] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbGolshow] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbGolshow]
GO
/****** Object:  Table [dbo].[tbAlternativa]    Script Date: 04/09/2023 00:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbAlternativa](
	[codAlt] [int] IDENTITY(1,1) NOT NULL,
	[correta] [bit] NOT NULL,
	[alternativa] [text] NOT NULL,
	[codPergunta] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codAlt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbJogador]    Script Date: 04/09/2023 00:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbJogador](
	[codJogador] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NOT NULL,
	[pontuacao] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codJogador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPergunta]    Script Date: 04/09/2023 00:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPergunta](
	[codPergunta] [int] IDENTITY(1,1) NOT NULL,
	[pergunta] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codPergunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbAlternativa] ON 

INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (1, 1, N'17 anos', 1)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (2, 0, N'18 anos', 1)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (3, 0, N'20 anos', 1)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (4, 0, N'16 anos', 1)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (5, 0, N'19 anos', 1)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (6, 1, N'1958', 2)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (7, 0, N'2002', 2)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (8, 0, N'2014', 2)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (9, 0, N'1994', 2)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (10, 0, N'1930', 2)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (11, 1, N'Miroslav Klose', 3)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (12, 0, N'Pelé', 3)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (13, 0, N'Neymar', 3)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (14, 0, N'Ronaldinho', 3)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (15, 0, N'Cafu', 3)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (16, 1, N'Uruguai', 4)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (17, 0, N'Brasil', 4)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (18, 0, N'Alemanha', 4)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (19, 0, N'Itália', 4)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (20, 0, N'França', 4)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (21, 1, N'Coreia do Sul e Japão - Vencedor: Brasil', 5)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (22, 0, N'Brasil e Argentina - Vencedor: Alemanha', 5)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (23, 0, N'França e Itália - Vencedor: França', 5)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (24, 0, N'Espanha e Portugal - Vencedor: Espanha', 5)
INSERT [dbo].[tbAlternativa] ([codAlt], [correta], [alternativa], [codPergunta]) VALUES (25, 0, N'Espanha e Portugal - Vencedor: Portugal', 5)
SET IDENTITY_INSERT [dbo].[tbAlternativa] OFF
GO
SET IDENTITY_INSERT [dbo].[tbJogador] ON 

INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1013, N'Gustavo Teste', 500)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1014, N'Gustavo Teste', 0)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1015, N'Gustavo Teste', 500)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1016, N'Gustavo Teste', 100)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1017, N'Gustavo Teste', 100)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1018, N'Gustavo Teste', 500)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1019, N'Gustavo Teste', 0)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1020, N'Gustavo Teste', 500)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1021, N'Gustavo Teste', 500)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1022, N'Gustavo Teste', 500)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1023, N'Gustavo Teste', 500)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1024, N'Gustavo Teste', 100)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1025, N'Gustavo Teste', 0)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1026, N'Gustavo Teste', 0)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1027, N'', 0)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1028, N'', 300)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1029, N'', 100)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1030, N'', 0)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1031, N'', 0)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1032, N'', 100)
INSERT [dbo].[tbJogador] ([codJogador], [nome], [pontuacao]) VALUES (1033, N'', 100)
SET IDENTITY_INSERT [dbo].[tbJogador] OFF
GO
SET IDENTITY_INSERT [dbo].[tbPergunta] ON 

INSERT [dbo].[tbPergunta] ([codPergunta], [pergunta]) VALUES (1, N'Com quantos anos o Pelé jogou a primeira copa?')
INSERT [dbo].[tbPergunta] ([codPergunta], [pergunta]) VALUES (2, N'Em que ano o Brasil ganhou a primeira copa?')
INSERT [dbo].[tbPergunta] ([codPergunta], [pergunta]) VALUES (3, N'Qual jogador tem o recorde de mais gols em uma copa do mundo?')
INSERT [dbo].[tbPergunta] ([codPergunta], [pergunta]) VALUES (4, N'Qual pais ganhou a primeira copa?')
INSERT [dbo].[tbPergunta] ([codPergunta], [pergunta]) VALUES (5, N'Quais foram os países coanfitriões da Copa do Mundo de 2002 e quem venceu o torneio nessa edição?')
SET IDENTITY_INSERT [dbo].[tbPergunta] OFF
GO
ALTER TABLE [dbo].[tbAlternativa]  WITH CHECK ADD FOREIGN KEY([codPergunta])
REFERENCES [dbo].[tbPergunta] ([codPergunta])
GO
USE [master]
GO
ALTER DATABASE [dbGolshow] SET  READ_WRITE 
GO
