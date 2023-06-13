/****** Object:  Database [ctintern]    Script Date: 6/13/2023 11:57:51 PM ******/
CREATE DATABASE [ctintern]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ctintern', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ctintern.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ctintern_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ctintern_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ctintern] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ctintern].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ctintern] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ctintern] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ctintern] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ctintern] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ctintern] SET ARITHABORT OFF 
GO
ALTER DATABASE [ctintern] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ctintern] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ctintern] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ctintern] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ctintern] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ctintern] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ctintern] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ctintern] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ctintern] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ctintern] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ctintern] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ctintern] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ctintern] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ctintern] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ctintern] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ctintern] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ctintern] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ctintern] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ctintern] SET  MULTI_USER 
GO
ALTER DATABASE [ctintern] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ctintern] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ctintern] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ctintern] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ctintern] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ctintern] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ctintern] SET QUERY_STORE = ON
GO
ALTER DATABASE [ctintern] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ctintern]
GO
/****** Object:  Table [dbo].[admins]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins](
	[id] [int] IDENTITY(10001,1) NOT NULL,
	[hrmid] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[department] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[attendances]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attendances](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[check_in_time] [nvarchar](255) NULL,
	[check_out_time] [nvarchar](255) NULL,
	[check_in_date] [date] NULL,
	[check_out_date] [date] NULL,
	[check_in_location] [nvarchar](255) NULL,
	[check_out_location] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notifications]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[notification_id] [nvarchar](255) NOT NULL,
	[content] [nvarchar](255) NOT NULL,
	[sender] [nvarchar](255) NOT NULL,
	[receiver] [nvarchar](255) NOT NULL,
	[date] [nvarchar](255) NOT NULL,
	[status] [nvarchar](255) NOT NULL,
	[type] [nvarchar](255) NULL,
 CONSTRAINT [PK_notification] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profiles]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[profile_image] [nvarchar](max) NULL,
	[hrmid] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[permanent_address] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[state] [nvarchar](255) NULL,
	[country] [nvarchar](255) NULL,
	[emergency_phone] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[projects]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[projects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[project_name] [nvarchar](255) NULL,
	[client_name] [nvarchar](255) NULL,
	[assigned_on] [date] NULL,
	[complete_by] [date] NULL,
	[team_head] [nvarchar](255) NULL,
	[team_members] [nvarchar](max) NULL,
	[department] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requests]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[email] [nvarchar](255) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[date] [date] NULL,
	[leave_type] [nvarchar](255) NULL,
	[request] [nvarchar](255) NULL,
	[reason] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[skills]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[skills](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[primary_skills] [nvarchar](255) NULL,
	[secondary_skills] [nvarchar](255) NULL,
	[certifications] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[timesheets]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[timesheets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[timesheet_id] [nvarchar](255) NULL,
	[timesheet_name] [nvarchar](255) NULL,
	[client_name] [nvarchar](255) NULL,
	[project_name] [nvarchar](255) NULL,
	[job_name] [nvarchar](255) NULL,
	[work_item] [nvarchar](255) NULL,
	[date] [date] NULL,
	[week] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[total_time] [nvarchar](255) NULL,
	[billable_status] [nvarchar](255) NULL,
	[submitted_hours] [nvarchar](255) NULL,
	[approved_hours] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(10001,1) NOT NULL,
	[hrmid] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[role] [nvarchar](255) NULL,
	[department] [nvarchar](255) NULL,
	[location] [nvarchar](255) NULL,
	[joining_date] [date] NULL,
	[reporting_manager] [nvarchar](255) NULL,
	[reports_to] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_admins_deleteproject]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_admins_deleteproject]
	 @id int 
AS 
BEGIN
	DELETE  FROM  dbo.projects
	WHERE id = @id
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_admins_getadmin]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_admins_getadmin]
	@admin_id int 
AS 
BEGIN
	SELECT * FROM  dbo.admins 
	WHERE id = @admin_id
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_admins_getallusers]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_admins_getallusers] 
AS 
BEGIN
	SELECT dbo.users.id, dbo.users.hrmid, dbo.users.name, dbo.profiles.profile_image
	FROM dbo.users
	INNER JOIN dbo.profiles
	ON dbo.users.id = dbo.profiles.user_id
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_admins_getcurrentadmin]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_admins_getcurrentadmin]
	@email nvarchar(255)
AS
BEGIN
	SELECT * FROM dbo.admins
	WHERE email = @email
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_admins_getmonthlyrequests]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_admins_getmonthlyrequests]
	@start_date date
AS 
BEGIN
	SELECT *
	FROM dbo.requests
	WHERE date >= @start_date 
	AND date < DATEADD(month, 1, @start_date)
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_admins_getmonthlytimesheets]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_admins_getmonthlytimesheets]
	@start_date date
AS 
BEGIN
	SELECT *
	FROM dbo.timesheets
	WHERE date >= @start_date 
	AND date < DATEADD(month, 1, @start_date)
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_admins_getprojects]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_admins_getprojects]

AS 
BEGIN
	SELECT *
	FROM  dbo.projects
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_admins_getusers]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_admins_getusers]
	@current_date date
AS
BEGIN
	SELECT dbo.users.id, dbo.profiles.profile_image, dbo.users.hrmid, dbo.users.name, dbo.users.role, dbo.users.department, dbo.users.location, dbo.attendances.status
	FROM dbo.users
	INNER JOIN dbo.profiles
	ON dbo.users.id = dbo.profiles.user_id
	LEFT JOIN dbo.attendances
	ON dbo.users.id = dbo.attendances.user_id
	AND dbo.attendances.check_in_date = @current_date
	AND dbo.attendances.id = (
           SELECT MAX(id)
           FROM dbo.attendances
           WHERE dbo.users.id = dbo.attendances.user_id
        )
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_admins_postproject]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_admins_postproject]
	@project_name nvarchar(255), @client_name nvarchar(255), @assigned_on date, @complete_by date, @team_head nvarchar(255), @team_members nvarchar(MAX), @department nvarchar(255)
AS 
BEGIN
	IF NOT EXISTS (SELECT project_name from dbo.projects WHERE project_name = @project_name)
	INSERT INTO dbo.projects(project_name, client_name, assigned_on, complete_by, team_head, team_members, department, status)
	values (@project_name, @client_name, @assigned_on, @complete_by, @team_head, @team_members, @department, 'Active')
END
GO
/****** Object:  StoredProcedure [dbo].[sp_admins_postuser]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_admins_postuser]
	@hrmid nvarchar(255), @name nvarchar(255), @email nvarchar(255), @phone nvarchar(255), @role nvarchar(255), @department nvarchar(255), @location nvarchar(255), @joining_date date, @reporting_manager nvarchar(255), @reports_to nvarchar(255)
AS 
BEGIN
	IF NOT EXISTS (SELECT email from dbo.users WHERE email = @email)
	INSERT INTO dbo.users (hrmid, name, email, phone, role, department, location, joining_date, reporting_manager, reports_to)
	values (@hrmid, @name, @email, @phone, @role, @department, @location, @joining_date, @reporting_manager, @reports_to)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_admins_updateadminsignup]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_admins_updateadminsignup]
	@name nvarchar(255), @email nvarchar(255),@password nvarchar(255)
AS 
BEGIN
	UPDATE dbo.admins
	SET name = @name, email = @email, password = @password
	WHERE dbo.admins.email = @email
	SET NOCOUNT ON; 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_admins_updateproject]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_admins_updateproject]
	@project_name nvarchar(255), @complete_by date, @team_head nvarchar(255), @team_members nvarchar(MAX), @status nvarchar(255)
AS 
BEGIN
	UPDATE dbo.projects
	SET complete_by = @complete_by, team_head = @team_head, team_members = @team_members, status = @status
	WHERE project_name = @project_name
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_admins_updateuser]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_admins_updateuser]
	@user_id int, @role nvarchar(255), @department nvarchar(255), @location nvarchar(255)
AS 
BEGIN
	UPDATE dbo.users
	SET role = @role, department = @department, location = @location
	WHERE id = @user_id
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_superadmins_postadmin]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_superadmins_postadmin]
	@hrmid nvarchar(255), @name nvarchar(255), @email nvarchar(255), @phone nvarchar(255), @department nvarchar(255)
AS 
BEGIN
	IF NOT EXISTS (SELECT email from dbo.admins WHERE email = @email)
	INSERT INTO dbo.admins (hrmid, name, email, phone, department)
	values (@hrmid, @name, @email, @phone, @department)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_deleteuserrequest]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_deleteuserrequest]
	 @user_id int , @id int 
AS 
BEGIN
	DELETE  FROM  dbo.requests
	WHERE id = @id AND user_id = @user_id
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getallusers]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getallusers] 
AS 
BEGIN
	SELECT dbo.users.id, dbo.users.hrmid, dbo.users.name, dbo.profiles.profile_image
	FROM dbo.users
	INNER JOIN dbo.profiles
	ON dbo.users.id = dbo.profiles.user_id
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getcurrentuser]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getcurrentuser]
	@email nvarchar(255)
AS
BEGIN
	SELECT * FROM dbo.users
	WHERE email = @email
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getcurrentuserprofile]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getcurrentuserprofile]
	@email nvarchar(255)
AS 
BEGIN
	SELECT user_id, profile_image, dbo.users.hrmid, dbo.users.name
	FROM  dbo.users
	INNER JOIN dbo.profiles
	ON dbo.users.id = dbo.profiles.user_id
	WHERE dbo.users.email = @email
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getproject]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getproject]
	@id int 
AS 
BEGIN
	SELECT * FROM  dbo.projects
	WHERE id = @id
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getuser]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getuser]
	@user_id int 
AS 
BEGIN
	SELECT * FROM  dbo.users 
	WHERE id = @user_id
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getuseraddedrequests]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getuseraddedrequests]
	@user_id int 
AS 
BEGIN
	SELECT leave_type, request, start_date, end_date FROM dbo.requests
	WHERE user_id = @user_id AND (status = 'Approved' OR status = 'Pending')
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getuserattendance]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getuserattendance]
	@user_id int 
AS 
BEGIN
	SELECT * FROM  dbo.attendances
	WHERE user_id = @user_id
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getusercurrentattendance]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getusercurrentattendance]
	@user_id int, @current_date date
AS 
BEGIN
	SELECT TOP 1 * FROM  dbo.attendances
	WHERE user_id = @user_id AND check_in_date = @current_date
	ORDER BY dbo.attendances.id DESC
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getusercurrentrequest]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getusercurrentrequest]
	 @user_id int , @id int 
AS 
BEGIN
	SELECT * FROM  dbo.requests
	WHERE id = @id AND user_id =	@user_id
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getusernotifications]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_users_getusernotifications]
	@hrmid nvarchar(255)
AS 
BEGIN
	SELECT * 
	FROM dbo.user_notifications
	WHERE receiver = @hrmid
	ORDER BY id DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getuserprofile]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getuserprofile]
	@user_id int 
AS 
BEGIN
	SELECT user_id, profile_image, dbo.users.hrmid, dbo.users.name, permanent_address,city, state, country, emergency_phone, email, password, phone, role, department, location, joining_date, reporting_manager, reports_to
	FROM  dbo.users
	INNER JOIN dbo.profiles
	ON dbo.users.id = dbo.profiles.user_id
	WHERE dbo.users.id = @user_id
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getuserrequests]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getuserrequests]
	@user_id int 
AS 
BEGIN
	SELECT dbo.requests.id, dbo.requests.user_id, dbo.profiles.profile_image, dbo.profiles.hrmid, dbo.profiles.name, email, start_date, end_date, date, leave_type, request, reason, status
	FROM  dbo.requests
	INNER JOIN dbo.profiles
	ON dbo.requests.user_id = dbo.profiles.user_id
	WHERE dbo.requests.user_id = @user_id
	ORDER BY dbo.requests.id DESC
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getuserskills]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getuserskills]
	@user_id int 
AS 
BEGIN
	SELECT dbo.users.id, user_id, primary_skills, secondary_skills, certifications
	FROM dbo.users
	LEFT JOIN dbo.skills
	ON dbo.skills.user_id = dbo.users.id
	where dbo.users.id = @user_id
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getusersubordinates]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getusersubordinates] 
   @hrmid nvarchar(255)
AS 
BEGIN
	SELECT dbo.profiles.user_id, dbo.users.hrmid, dbo.users.name, role, department, profile_image
	FROM dbo.users
	LEFT JOIN dbo.profiles
	ON dbo.users.id = dbo.profiles.user_id
	WHERE reports_to = @hrmid
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getusersubordinatesrequests]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getusersubordinatesrequests]
	@hrmid nvarchar(255) 
AS 
BEGIN
	SELECT dbo.requests.id, dbo.requests.user_id, dbo.profiles.profile_image, dbo.profiles.hrmid, dbo.profiles.name, dbo.requests.email, role, request, start_date, end_date, leave_type, reason, status
	FROM  dbo.requests
	INNER JOIN dbo.profiles
	ON dbo.requests.user_id = dbo.profiles.user_id
	INNER JOIN dbo.users
	ON dbo.requests.user_id = dbo.users.id
	WHERE dbo.users.reports_to = @hrmid
	ORDER BY dbo.requests.id DESC
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getusersubordinatestimesheets]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getusersubordinatestimesheets]
	@hrmid nvarchar(255) 
AS 
BEGIN
	SELECT dbo.timesheets.id, dbo.timesheets.user_id, dbo.profiles.profile_image, dbo.profiles.hrmid, dbo.profiles.name, timesheet_name, client_name, project_name, job_name, work_item, date, week, description, total_time, billable_status, submitted_hours, approved_hours, status
	FROM  dbo.timesheets
	INNER JOIN dbo.profiles
	ON dbo.timesheets.user_id = dbo.profiles.user_id
	INNER JOIN dbo.users
	ON dbo.timesheets.user_id = dbo.users.id
	WHERE dbo.users.reports_to = @hrmid
	ORDER BY dbo.timesheets.id DESC
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getusersuperiorprofile]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getusersuperiorprofile] 
   @hrmid nvarchar(255)
AS 
BEGIN
	SELECT dbo.profiles.user_id, dbo.profiles.hrmid, dbo.profiles.name, role, department, profile_image
	FROM  dbo.users
	INNER JOIN dbo.profiles
	ON dbo.users.id = dbo.profiles.user_id
	WHERE dbo.users.hrmid = @hrmid
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getusertimesheets]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getusertimesheets]
	@user_id int 
AS 
BEGIN
	SELECT dbo.timesheets.timesheet_id, dbo.timesheets.user_id, dbo.profiles.profile_image, dbo.profiles.hrmid, dbo.profiles.name, timesheet_name, client_name, project_name, job_name, work_item, date, week, description, total_time, billable_status, submitted_hours, approved_hours, status
	FROM  dbo.timesheets
	INNER JOIN dbo.profiles
	ON dbo.timesheets.user_id = dbo.profiles.user_id
	WHERE dbo.timesheets.user_id = @user_id
	ORDER BY dbo.timesheets.id DESC
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_getuserweeklytimesheets]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_getuserweeklytimesheets]
	@user_id int, @week nvarchar(255)
AS 
BEGIN
	SELECT user_id, timesheet_id, timesheet_name, client_name, project_name, job_name, work_item, date, week, description, total_time, billable_status, submitted_hours FROM  dbo.timesheets
	WHERE user_id = @user_id AND week = @week
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_postusercheckin]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_postusercheckin]
	@user_id int, @check_in_location nvarchar(255), @status nvarchar(255)
AS 
BEGIN
	DECLARE @check_in_date date;
	DECLARE @check_in_time nvarchar(255);
	SET @check_in_date = CAST(CURRENT_TIMESTAMP AS date);
	SET @check_in_time = CONVERT(varchar,GETDATE(),8);
	INSERT INTO dbo.attendances (user_id, check_in_time, check_in_date, check_in_location, status)
	values (@user_id, @check_in_time, @check_in_date, @check_in_location, @status)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_postusernotification]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_users_postusernotification]
	@notification_id nvarchar(255), @content nvarchar(255), @sender nvarchar(255), @receiver nvarchar(255), @date nvarchar(255), @type nvarchar(50)
AS 
BEGIN
	INSERT INTO dbo.user_notifications (notification_id, content, sender, receiver, date, status, type)
	values (@notification_id, @content, @sender, @receiver, @date, 'unread', @type)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_postuserprofile]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_postuserprofile]
	@user_id int, @profile_image nvarchar(MAX), @hrmid nvarchar(255), @name nvarchar(255), @permanent_address nvarchar(255), @city nvarchar(255), @state nvarchar(255),@country nvarchar(255), @emergency_phone nvarchar(255)
AS 
BEGIN
	IF NOT EXISTS (SELECT user_id from dbo.profiles WHERE user_id = @user_id)
	INSERT INTO dbo.profiles (user_id, profile_image, hrmid, name, permanent_address , city, state, country, emergency_phone)
	values (@user_id, @profile_image, @hrmid, @name, @permanent_address ,  @city ,  @state,@country,  @emergency_phone)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_postuserrequest]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_postuserrequest]
	@user_id int, @email nvarchar(255), @start_date date, @end_date date,@leave_type nvarchar(255), @request nvarchar(255), @reason nvarchar(255)
AS 
BEGIN
	DECLARE @date date;
	SET @date = CAST(CURRENT_TIMESTAMP AS date);
	INSERT INTO dbo.requests(user_id, email, start_date, end_date, date, leave_type, request, reason, status)
	values (@user_id, @email, @start_date,@end_date, @date, @leave_type, @request, @reason, 'Pending')
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_postuserskills]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_postuserskills]
	@user_id int, @primary_skills nvarchar(255), @secondary_skills nvarchar(255),@certifications nvarchar(255)
AS 
BEGIN
	IF NOT EXISTS (SELECT user_id FROM dbo.skills WHERE user_id = @user_id)
	INSERT INTO dbo.skills(user_id, primary_skills, secondary_skills, certifications)
	values (@user_id,@primary_skills,@secondary_skills,@certifications )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_updateallusernotifications]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_updateallusernotifications]
    @hrmid nvarchar(255)
AS 
BEGIN
	UPDATE dbo.user_notifications
    SET status = 'read'
    WHERE receiver = @hrmid
    SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_updateusercheckout]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_updateusercheckout]
    @user_id int, @check_out_location nvarchar(255), @status nvarchar(255), @check_in_time nvarchar(255)
AS 
BEGIN
	DECLARE @check_out_date date;
	DECLARE @check_out_time nvarchar(255);
	SET @check_out_date = CAST(CURRENT_TIMESTAMP AS date);
	SET @check_out_time = CONVERT(varchar,GETDATE(),8);

    UPDATE dbo.attendances
    SET check_out_date=@check_out_date, check_out_time=@check_out_time, check_out_location=@check_out_location, status=@status
    WHERE user_id = @user_id AND check_in_date= @check_out_date AND check_in_time=@check_in_time
    SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_updateusernotification]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_updateusernotification]
    @hrmid nvarchar(255), @notification_id nvarchar(255)
AS 
BEGIN
	UPDATE dbo.user_notifications
    SET status = 'read'
    WHERE receiver = @hrmid AND notification_id = @notification_id
    SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_updateuserprofile]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_updateuserprofile]
	@user_id int , @profile_image nvarchar(MAX), @permanent_address nvarchar(255),@city nvarchar(255) ,@state nvarchar(255),@country nvarchar(255), @emergency_phone nvarchar(255)
AS 
BEGIN
	UPDATE dbo.profiles
	SET profile_image = @profile_image, permanent_address = @permanent_address, city = @city, state = @state, country = @country,  emergency_phone = @emergency_phone
	WHERE profiles.user_id = @user_id
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_updateuserrequest]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_updateuserrequest]
     @user_id int, @id int, @status nvarchar(255)
AS 
BEGIN
     UPDATE dbo.requests
     SET status = @status
     WHERE user_id = @user_id AND id = @id
     SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_updateusersignup]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_updateusersignup]
	@name nvarchar(255), @email nvarchar(255),@password nvarchar(255)
AS 
BEGIN
	UPDATE dbo.users
	SET name=@name, email=@email, password=@password
	WHERE dbo.users.email = @email
	SET NOCOUNT ON; 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_updateuserskills]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_updateuserskills]
	@user_id int, @primary_skills nvarchar(255), @secondary_skills nvarchar(255), @certifications nvarchar(255)
AS 
BEGIN
	UPDATE dbo.skills
	SET primary_skills = @primary_skills, secondary_skills = @secondary_skills, certifications = @certifications
	WHERE user_id = @user_id
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_users_updateusertimesheet]    Script Date: 6/13/2023 11:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_users_updateusertimesheet]
     @id int, @user_id int, @status nvarchar(255)
AS 
BEGIN
     UPDATE dbo.timesheets
     SET status = @status
     WHERE id = @id AND user_id = @user_id
     SET NOCOUNT ON;
END
GO
USE [master]
GO
ALTER DATABASE [ctintern] SET  READ_WRITE 
GO
