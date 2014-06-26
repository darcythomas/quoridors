USE [master]
GO
/****** Object:  Database [Quoridor]    Script Date: 26/06/2014 11:21:15 a.m. ******/
CREATE DATABASE [Quoridor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Quoridor', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Quoridor.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Quoridor_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Quoridor_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Quoridor] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Quoridor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Quoridor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Quoridor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Quoridor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Quoridor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Quoridor] SET ARITHABORT OFF 
GO
ALTER DATABASE [Quoridor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Quoridor] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Quoridor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Quoridor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Quoridor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Quoridor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Quoridor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Quoridor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Quoridor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Quoridor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Quoridor] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Quoridor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Quoridor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Quoridor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Quoridor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Quoridor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Quoridor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Quoridor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Quoridor] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Quoridor] SET  MULTI_USER 
GO
ALTER DATABASE [Quoridor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Quoridor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Quoridor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Quoridor] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Quoridor]
GO
/****** Object:  StoredProcedure [dbo].[CreateGame]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateGame]

AS
BEGIN
	INSERT Game DEFAULT VALUES;

	SELECT * FROM Game
	WHERE Id = SCOPE_IDENTITY()
	
END



GO
/****** Object:  StoredProcedure [dbo].[CreatePlayer]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreatePlayer]
	@name varchar(50),
	@game_id int
AS
BEGIN
	INSERT INTO Player
	(name, game_id)
	VALUES
	(@name, @game_id)
END


GO
/****** Object:  StoredProcedure [dbo].[CreatePosition]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CreatePosition]
	@PlayerId int,
	@XPos int,
	@YPos int,
	@GameID int
As
Begin
	INSERT INTO Position (x_pos, y_pos, game_id, player_id)
	VALUES (@XPos, @YPos, @GameID, @PlayerId)
End

GO
/****** Object:  StoredProcedure [dbo].[CreateWall]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateWall]
	@XPos int,
	@YPos int,
	@Direction int,
	@GameId int
AS
BEGIN
	INSERT INTO Wall
	(x_pos, y_pos, direction, game_id)
	VALUES
	(@XPos, @YPos, @Direction, @GameId)
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllGame]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllGame]

AS
BEGIN
	SELECT * FROM Game
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllPlayer]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllPlayer]
	
AS
BEGIN
	SELECT	id,
			name,
			game_id 
	FROM	Player
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllPosition]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetAllPosition]

As
begin
	SELECT * from Position
end


GO
/****** Object:  StoredProcedure [dbo].[GetAllWall]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllWall]

AS
BEGIN
	SELECT * FROM Wall
END


GO
/****** Object:  StoredProcedure [dbo].[GetGameById]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetGameById]
	@game_id int
AS
BEGIN
	Select *
	from Game
	Where id=@game_id
END


GO
/****** Object:  StoredProcedure [dbo].[GetPositionByGameId]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetPositionByGameId]
	@game_id int
AS
BEGIN
	Select *
	from Position
	Where game_id=@game_id
END



GO
/****** Object:  StoredProcedure [dbo].[GetPositionByPlayerId]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[GetPositionByPlayerId]
	@player_id int
AS
BEGIN
	Select *
	from Position
	Where player_id=@player_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetWallByGameId]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetWallByGameId]
	@game_id int
AS
BEGIN
	Select *
	from Wall
	Where game_id=@game_id
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateGame]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[UpdateGame]
	@game_id int,
	@game_turns int
As
Begin
	Update Game 
	Set turn=@game_turns
	where id=@game_id
End


GO
/****** Object:  StoredProcedure [dbo].[UpdatePosition]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdatePosition]
	@PlayerId int,
	@XPos int,
	@YPos int,
	@GameID int
As
Begin
	Update Position 
	Set x_pos=@XPos, y_pos=@YPos, game_id=@GameID
	where player_id=@PlayerId
End

GO
/****** Object:  Table [dbo].[Game]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[turn] [int] NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Player]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Player](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[game_id] [int] NOT NULL,
 CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Position]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[player_id] [int] NOT NULL,
	[x_pos] [int] NOT NULL,
	[y_pos] [int] NOT NULL,
	[game_id] [int] NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Wall]    Script Date: 26/06/2014 11:21:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wall](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[x_pos] [int] NOT NULL,
	[y_pos] [int] NOT NULL,
	[direction] [int] NOT NULL,
	[game_id] [int] NOT NULL,
 CONSTRAINT [PK_Wall] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_Game] FOREIGN KEY([game_id])
REFERENCES [dbo].[Game] ([id])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_Game]
GO
ALTER TABLE [dbo].[Position]  WITH CHECK ADD  CONSTRAINT [FK_Position_Game] FOREIGN KEY([game_id])
REFERENCES [dbo].[Game] ([id])
GO
ALTER TABLE [dbo].[Position] CHECK CONSTRAINT [FK_Position_Game]
GO
ALTER TABLE [dbo].[Position]  WITH CHECK ADD  CONSTRAINT [FK_Position_Player] FOREIGN KEY([player_id])
REFERENCES [dbo].[Player] ([id])
GO
ALTER TABLE [dbo].[Position] CHECK CONSTRAINT [FK_Position_Player]
GO
ALTER TABLE [dbo].[Wall]  WITH CHECK ADD  CONSTRAINT [FK_Wall_Game] FOREIGN KEY([game_id])
REFERENCES [dbo].[Game] ([id])
GO
ALTER TABLE [dbo].[Wall] CHECK CONSTRAINT [FK_Wall_Game]
GO
USE [master]
GO
ALTER DATABASE [Quoridor] SET  READ_WRITE 
GO
