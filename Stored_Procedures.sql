USE [ctintern]
GO
/****** Object:  StoredProcedure [dbo].[spadmins_getallusers]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmins_getallusers] 
AS 
BEGIN
	SELECT * from  dbo.users
	ORDER BY id DESC
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getcurrentuser]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getcurrentuser]
	@email nvarchar(255)
AS
BEGIN
	SELECT * from dbo.users where email = @email
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuser]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuser]
	@userId int 
AS 
BEGIN
	SELECT * from  dbo.users 
	where id = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuserattendance]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuserattendance]
	@userId int 
AS 
BEGIN
	SELECT * from  dbo.userAttendances
	where userId = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getusercurrentattendance]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getusercurrentattendance]
	@userId int, @currentDate date
AS 
BEGIN
	SELECT * from  dbo.userAttendances
	where userId = @userId AND checkInDate = @currentDate
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getusercurrentattendancetest]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getusercurrentattendancetest]
	@userId int, @currentDate date
AS 
BEGIN
	SELECT TOP 1 * from  dbo.userAttendances
	where userId = @userId AND checkInDate = @currentDate
	ORDER BY dbo.userAttendances.id DESC
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuserlatesttimesheets]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuserlatesttimesheets]
	@userId int 
AS 
BEGIN
	SELECT * from  dbo.userTimesheets
	where userId = @userId
	ORDER BY dbo.userTimesheets.id DESC
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuserprofile]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuserprofile]
	@userId int 
AS 
BEGIN
	SELECT dbo.users.id, userId, profileImage, permanentAddress,city, state, country, emergencyPhone, hrmid, name, email, password, phone, role, reportingManager, location, joiningDate from  dbo.users LEFT JOIN dbo.userProfiles ON dbo.users.id = dbo.userProfiles.userId
	where dbo.users.id = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuserprojects]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuserprojects]
	@userId int 
AS 
BEGIN
	SELECT * from  dbo.userProjects
	where userId = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuserrequests]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuserrequests]
	@userId int 
AS 
BEGIN
	SELECT * from  dbo.userRequests
	where userId = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getuserskills]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getuserskills]
	@userId int 
AS 
BEGIN
	SELECT dbo.users.id, userId, primarySkills, secondarySkills, certifications from  dbo.users LEFT JOIN dbo.userSkills ON dbo.userSkills.userId = dbo.users.id
	where dbo.users.id = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_getusertimesheets]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_getusertimesheets]
	@userId int 
AS 
BEGIN
	SELECT * from  dbo.userTimesheets
	where userId = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postusercheckin]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postusercheckin]
	@userId int, @checkInTime nvarchar(255), @checkInDate date, @checkInLocation nvarchar(255), @status nvarchar(255)
AS 
BEGIN
	INSERT INTO dbo.userAttendances (userId, checkInTime, checkInDate, checkInLocation, status)
	values (@userId, @checkInTime, @checkInDate, @checkInLocation, @status)
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postuserprofile]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postuserprofile]
	@userId int, @profileImage nvarchar(MAX), @permanentAddress nvarchar(255), @city nvarchar(255), @state nvarchar(255),@country nvarchar(255), @emergencyPhone nvarchar(255)
AS 
BEGIN
	IF NOT EXISTS (SELECT userId from dbo.userProfiles WHERE userId = @userId)
	INSERT INTO dbo.userProfiles (userId, profileImage, permanentAddress , city, state, country, emergencyPhone)
	values (@userId, @profileImage, @permanentAddress ,  @city ,  @state,@country,  @emergencyPhone)
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postuserproject]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postuserproject]
	@userId int, @projectId nvarchar(255), @projectName nvarchar(255), @assignedOn date, @completeBy date, @teamMembers nvarchar(255), @teamHead nvarchar(255), @department nvarchar(255)
AS 
BEGIN
	IF NOT EXISTS (SELECT userId, projectId from dbo.userProjects WHERE userId = @userId AND projectId = @projectId)
	INSERT INTO dbo.userProjects(userId, projectId, projectName, assignedOn, completeBy, teamMembers, teamHead, department)
	values (@userId, @projectId, @projectName, @assignedOn, @completeBy, @teamMembers, @teamHead, @department)
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postuserrequest]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postuserrequest]
	@userId int, @email nvarchar(255), @startDate date, @endDate date,@leaveType nvarchar(255), @request nvarchar(255), @reason nvarchar(255)
AS 
BEGIN
	INSERT INTO dbo.userRequests(userId, email, startDate, endDate,leaveType, request, reason)
	values (@userId, @email, @startDate,@endDate,@leaveType, @request, @reason)
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postuserskills]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postuserskills]
	@userId int, @primarySkills nvarchar(255), @secondarySkills nvarchar(255),@certifications nvarchar(255)
AS 
BEGIN
	IF NOT EXISTS (SELECT userId from dbo.userSkills WHERE userId = @userId)
	INSERT INTO dbo.userSkills(userId, primarySkills, secondarySkills, certifications)
	values (@userId,@primarySkills,@secondarySkills,@certifications )
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_postusertimesheet]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_postusertimesheet]
	@userId int, @timesheetName nvarchar(255), @clientName nvarchar(255), @projectName nvarchar(255), @jobName nvarchar(255), @workItem nvarchar(255), @date date, @week nvarchar(255), @description nvarchar(255), @startTime nvarchar(255), @endTime nvarchar(255), @billableStatus nvarchar(255), @submittedHours nvarchar(255)
AS 
BEGIN
	IF NOT EXISTS (SELECT userId, date from dbo.userTimesheets WHERE userId = @userId AND date = @date)
	INSERT INTO dbo.userTimesheets(userId, timesheetName, clientName, projectName, jobName, workItem, date, week, description, startTime, endTime, billableStatus, submittedHours)
	values (@userId, @timesheetName, @clientName, @projectName, @jobName, @workItem, @date, @week, @description, @startTime, @endTime, @billableStatus, @submittedHours)
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_updateusercheckout]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_updateusercheckout]
    @userId int ,@checkOutDate date,@checkOutTime nvarchar(255), @checkOutLocation nvarchar(255), @status nvarchar(255), @checkInTime nvarchar(255)
AS 
BEGIN
    UPDATE dbo.userAttendances
    SET checkOutDate=@checkOutDate, checkOutTime=@checkOutTime, checkOutLocation=@checkOutLocation, status=@status
    where userId = @userId AND checkInDate= @checkOutDate AND checkInTime=@checkInTime
    SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_updateuserprofile]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_updateuserprofile]
	@userId int , @profileImage nvarchar(MAX), @permanentAddress nvarchar(255),@city nvarchar(255) ,@state nvarchar(255),@country nvarchar(255), @emergencyPhone nvarchar(255)
AS 
BEGIN
	UPDATE dbo.userProfiles
	SET profileImage=@profileImage, permanentAddress=@permanentAddress, city=@city, state=@state, country = @country,  emergencyPhone=@emergencyPhone
	where userProfiles.id = @userId
	SET NOCOUNT ON;
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_updateusersignup]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_updateusersignup]
	@name nvarchar(255), @email nvarchar(255),@password nvarchar(255)
AS 
BEGIN
	UPDATE dbo.users
	SET name=@name, email=@email, password=@password
	where users.email = @email
	SET NOCOUNT ON; 
END
GO
/****** Object:  StoredProcedure [dbo].[spusers_updateuserskills]    Script Date: 4/20/2023 3:58:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spusers_updateuserskills]
	@userId int ,@primarySkills nvarchar(255),@secondarySkills nvarchar(255) ,@certifications nvarchar(255)
AS 
BEGIN
	UPDATE dbo.userSkills
	SET primarySkills=@primarySkills, secondarySkills=@secondarySkills, certifications=@certifications
	where userId = @userId
	SET NOCOUNT ON;
END
GO
