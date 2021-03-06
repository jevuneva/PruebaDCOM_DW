USE [master]
GO
/****** Object:  Database [PrueDigital]    Script Date: 01/05/2021 9:25:04 ******/
CREATE DATABASE [PrueDigital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PrueDigital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PrueDigital.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PrueDigital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PrueDigital_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PrueDigital] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PrueDigital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PrueDigital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PrueDigital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PrueDigital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PrueDigital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PrueDigital] SET ARITHABORT OFF 
GO
ALTER DATABASE [PrueDigital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PrueDigital] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PrueDigital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PrueDigital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PrueDigital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PrueDigital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PrueDigital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PrueDigital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PrueDigital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PrueDigital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PrueDigital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PrueDigital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PrueDigital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PrueDigital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PrueDigital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PrueDigital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PrueDigital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PrueDigital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PrueDigital] SET RECOVERY FULL 
GO
ALTER DATABASE [PrueDigital] SET  MULTI_USER 
GO
ALTER DATABASE [PrueDigital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PrueDigital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PrueDigital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PrueDigital] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PrueDigital]
GO
/****** Object:  StoredProcedure [dbo].[ACTCLIENTE]    Script Date: 01/05/2021 9:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ACTCLIENTE]

@Cod int,
@Nom varchar(100),
@TipDoc varchar(5),
@NumIdent varchar(20),
@NomRepre varchar(100),
@Tel varchar(20),
@Email varchar(100),
@Cont_persona varchar(100),
@Activos money,
@Pasivo money,
@patrimonio money
as
	UPDATE cliente set
           Nombre = @Nom,
		   Tip_Doc = @TipDoc,
		   Num_Ident = @NumIdent, 
		   Nom_Repre = @NomRepre,
		   Telefono = @Tel, 
		   Email = @Email,
		   Cont_Pers = @Cont_persona,
		   Activos = @Activos,
		   Pasivo = @Pasivo,
		   Patrimonio = @patrimonio
		where codigo = @Cod;


GO
/****** Object:  StoredProcedure [dbo].[INSECLIENTE]    Script Date: 01/05/2021 9:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[INSECLIENTE]

@Nom varchar(100),
@TipDoc varchar(5),
@NumIdent varchar(20),
@NomRepre varchar(100),
@Tel varchar(20),
@Email varchar(100),
@Cont_persona varchar(100),
@Activos money,
@Pasivo money,
@patrimonio money
as
	INSERT INTO cliente
           (Nombre, Tip_Doc, Num_Ident, 
		   Nom_Repre, Telefono, Email,
		   Cont_Pers, Activos, Pasivo, Patrimonio)
     VALUES
           (@Nom, @TipDoc, @NumIdent,
		    @NomRepre, @Tel, @Email,
			@Cont_persona, 
			@Activos, @Pasivo, @patrimonio);



GO
/****** Object:  Table [dbo].[cliente]    Script Date: 01/05/2021 9:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cliente](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Tip_Doc] [varchar](5) NULL,
	[Num_Ident] [varchar](20) NULL,
	[Nom_Repre] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[Cont_Pers] [varchar](100) NULL,
	[Activos] [money] NULL,
	[Pasivo] [money] NULL,
	[Patrimonio] [money] NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [PrueDigital] SET  READ_WRITE 
GO
