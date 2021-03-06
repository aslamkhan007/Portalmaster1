USE [jctdev]
GO
/****** Object:  StoredProcedure [dbo].[jct_payroll_Family_Detail_PortalTempPost]    Script Date: 07/14/2021 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[jct_payroll_Family_Detail_PortalTempPost]                             
--Single                
--Exec jct_payroll_Family_Detail_PortalTempPost '9000000334','25/05/2021','Mohd Aslam','Self'  
--Exec jct_payroll_Family_Detail_PortalTempPost '9000000334','25/05/2021','Abc','Self','Y'  
--Exec jct_payroll_Family_Detail_PortalTempPost '9000000334','25/01/1990','Abc','Self','Y'  
    @NewEmployeecode VARCHAR(10) ,  
    @Dob VARCHAR(50) ,  
    @NAME VARCHAR(50) ,  
    @Relation VARCHAR(50) ,  
    @DisableFlag VARCHAR(50) = NULL  
AS   
    BEGIN                  
      
                                                                                                                                                                                                                                                               
                                                     
---------------------------------GetFIYear(Start) -------------------------------------             
          
        DECLARE @FyYear VARCHAR(50)      
    
        DECLARE @BusinessDate DATETIME     
        SET @BusinessDate = GETDATE()    
    
        IF MONTH(@BusinessDate) < 4   
            BEGIN    
    
                SET @FyYear = ( SELECT  CONVERT(VARCHAR, YEAR(@BusinessDate)  
                                        - 1) + '-'  
                                        + CONVERT(VARCHAR, YEAR(@BusinessDate)) AS FinYear  
                              )  
            END    
     
    
        ELSE   
            IF MONTH(@BusinessDate) >= 4   
                BEGIN    
    
                    SET @FyYear = ( SELECT  CONVERT(VARCHAR, YEAR(@BusinessDate))  
                                            + '-'  
                                            + CONVERT(VARCHAR, YEAR(@BusinessDate)  
                                            + 1) AS FinYear  
                                  )   
                END    
    
     
     
  
  
     
     
  --SELECT * FROM dbo.Jct_Payroll_Group_Insurance_Portal_DumpRecords  
---------------------------------GetFIYear(End) -------------------------------------                
  
------------------------------------------------Age Calcuation Logic ---------------------------------------  
  
--DECLARE @dob  datetime  
--SET @dob='1992-01-09 00:00:00'  
  
--SELECT DATEDIFF(hour,@dob,GETDATE())/8766.0 AS AgeYearsDecimal  
--    ,CONVERT(int,ROUND(DATEDIFF(hour,@dob,GETDATE())/8766.0,0)) AS AgeYearsIntRound  
--    ,DATEDIFF(hour,@dob,GETDATE())/8766 AS AgeYearsIntTrunc  
  
  
------------------------------------------------Age Calcuation Logic ---------------------------------------  
  
  
--SELECT * FROM Jct_Payroll_Group_Insurance_Portal_DumpRecords  
--TRUNCATE TABLE Jct_Payroll_Group_Insurance_Portal_DumpRecords  
--SELECT * FROM Jct_Payroll_Group_Insurance_Portal  
  
  
        INSERT  INTO dbo.Jct_Payroll_Group_Insurance_Portal_DumpRecords  
                ( ecode ,  
                  dept ,  
                  Name ,  
                  Designation ,  
                  Age ,  
                  DOB ,  
                  Relation ,  
                  STATUS ,  
                  Mode ,  
                  Entry_date ,  
                  Entered_By ,  
                  FinancialYear ,  
                  DisableFlag ,  
                  Plant ,  
                  Location ,  
                  NewEmployeeCode  
                )  
                SELECT  a.EmployeeCode ,  
                        b.Department_Long_Description ,  
                        @NAME ,  
                        c.Desg_Long_Description ,  
                        --'' AS Age ,  
                          
                        DATEDIFF(yy,CONVERT(VARCHAR, CONVERT(DATETIME, @DOB, 103), 101),GETDATE()),  
                          
                        CONVERT(VARCHAR, CONVERT(DATETIME, @DOB, 103), 101) ,  
                        @Relation AS Relation ,  
                        'A' ,  
                        'Save' ,  
          GETDATE() ,  
                        a.NewEmployeeCode ,  
                        @FyYear ,  
                        @DisableFlag AS DisableFlag ,  
                        a.Plant ,  
                        a.Location ,  
                        A.newEmployeecode  
                FROM    dbo.JCT_Payroll_Employees_Master AS a  
                        INNER JOIN dbo.JCT_payroll_department_master AS b ON a.Department = b.Department_code  
                        INNER JOIN dbo.JCT_payroll_designation_master AS c ON a.Designation = c.Designation_code  
                WHERE   a.STATUS = 'A'  
                        AND a.Active = 'Y'  
                        AND B.STATUS = 'A'  
                        AND C.STATUS = 'A'  
                        AND a.NewEmployeeCode = @NewEmployeecode  
  
          
    
---------------------------------Family Detail Insert(End) -------------------------------------                                                                                                                        
  
SELECT * FROM Jct_Payroll_Group_Insurance_Portal_DumpRecords  
                                                      
    END       
      
          
--SELECT * FROM Jct_Payroll_Emp_Address_Detail           
--WHERE EmployeeCode = 'r-03584'      
      
--SELECT * FROM Jct_Payroll_Emp_Address_Detail ORDER BY EntryOn  DESC      
      
--SELECT * FROM Jct_Payroll_Emp_Address_Detail       
--WHERE CardNo = ''      
      
--DELETE FROM Jct_Payroll_Emp_Address_Detail       
--WHERE CardNo = ''      
      
      
      
--SELECT * INTO Jct_Payroll_Emp_Address_Detail_Portal FROM Jct_Payroll_Emp_Address_Detail
GO
/****** Object:  Table [dbo].[Jct_Payroll_Portal_Cities]    Script Date: 07/14/2021 17:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Jct_Payroll_Portal_Cities](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city_name] [varchar](100) NOT NULL,
	[city_state] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Jct_Payroll_Portal_Cities] ON
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1792, N'UNA', N'Himachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1793, N'GHAZIABAD', N'UTTAR PRADESH')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1, N'Kolhapur', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (2, N'Port Blair', N'Andaman and Nicobar Islands')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (3, N'Adilabad', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (4, N'Adoni', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (5, N'Amadalavalasa', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (6, N'Amalapuram', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (7, N'Anakapalle', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (8, N'Anantapur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (9, N'Badepalle', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (10, N'Banganapalle', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (11, N'Bapatla', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (12, N'Bellampalle', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (13, N'Bethamcherla', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (14, N'Bhadrachalam', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (15, N'Bhainsa', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (16, N'Bheemunipatnam', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (17, N'Bhimavaram', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (18, N'Bhongir', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (19, N'Bobbili', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (20, N'Bodhan', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (21, N'Chilakaluripet', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (22, N'Chirala', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (23, N'Chittoor', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (24, N'Cuddapah', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (25, N'Devarakonda', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (26, N'Dharmavaram', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (27, N'Eluru', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (28, N'Farooqnagar', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (29, N'Gadwal', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (30, N'Gooty', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (31, N'Gudivada', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (32, N'Gudur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (33, N'Guntakal', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (34, N'Guntur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (35, N'Hanuman Junction', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (36, N'Hindupur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (37, N'Hyderabad', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (38, N'Ichchapuram', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (39, N'Jaggaiahpet', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (40, N'Jagtial', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (41, N'Jammalamadugu', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (42, N'Jangaon', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (43, N'Kadapa', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (44, N'Kadiri', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (45, N'Kagaznagar', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (46, N'Kakinada', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (47, N'Kalyandurg', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (48, N'Kamareddy', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (49, N'Kandukur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (50, N'Karimnagar', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (51, N'Kavali', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (52, N'Khammam', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (53, N'Koratla', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (54, N'Kothagudem', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (55, N'Kothapeta', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (56, N'Kovvur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (57, N'Kurnool', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (58, N'Kyathampalle', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (59, N'Macherla', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (60, N'Machilipatnam', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (61, N'Madanapalle', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (62, N'Mahbubnagar', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (63, N'Mancherial', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (64, N'Mandamarri', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (65, N'Mandapeta', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (66, N'Manuguru', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (67, N'Markapur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (68, N'Medak', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (69, N'Miryalaguda', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (70, N'Mogalthur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (71, N'Nagari', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (72, N'Nagarkurnool', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (73, N'Nandyal', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (74, N'Narasapur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (75, N'Narasaraopet', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (76, N'Narayanpet', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (77, N'Narsipatnam', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (78, N'Nellore', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (79, N'Nidadavole', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (80, N'Nirmal', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (81, N'Nizamabad', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (82, N'Nuzvid', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (83, N'Ongole', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (84, N'Palacole', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (85, N'Palasa Kasibugga', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (86, N'Palwancha', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (87, N'Parvathipuram', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (88, N'Pedana', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (89, N'Peddapuram', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (90, N'Pithapuram', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (91, N'Pondur', N'Andhra pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (92, N'Ponnur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (93, N'Proddatur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (94, N'Punganur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (95, N'Puttur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (96, N'Rajahmundry', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (97, N'Rajam', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (98, N'Ramachandrapuram', N'Andhra Pradesh')
GO
print 'Processed 100 total records'
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (99, N'Ramagundam', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (100, N'Rayachoti', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (101, N'Rayadurg', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (102, N'Renigunta', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (103, N'Repalle', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (104, N'Sadasivpet', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (105, N'Salur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (106, N'Samalkot', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (107, N'Sangareddy', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (108, N'Sattenapalle', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (109, N'Siddipet', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (110, N'Singapur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (111, N'Sircilla', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (112, N'Srikakulam', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (113, N'Srikalahasti', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (114, N'Suryapet', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (115, N'Tadepalligudem', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (116, N'Tadpatri', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (117, N'Tandur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (118, N'Tanuku', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (119, N'Tenali', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (120, N'Tirupati', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (121, N'Tuni', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (122, N'Uravakonda', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (123, N'Venkatagiri', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (124, N'Vicarabad', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (125, N'Vijayawada', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (126, N'Vinukonda', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (127, N'Visakhapatnam', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (128, N'Vizianagaram', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (129, N'Wanaparthy', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (130, N'Warangal', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (131, N'Yellandu', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (132, N'Yemmiganur', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (133, N'Yerraguntla', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (134, N'Zahirabad', N'Andhra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (135, N'Rajampet', N'Andra Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (136, N'Along', N'Arunachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (137, N'Bomdila', N'Arunachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (138, N'Itanagar', N'Arunachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (139, N'Naharlagun', N'Arunachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (140, N'Pasighat', N'Arunachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (141, N'Abhayapuri', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (142, N'Amguri', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (143, N'Anandnagaar', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (144, N'Barpeta', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (145, N'Barpeta Road', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (146, N'Bilasipara', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (147, N'Bongaigaon', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (148, N'Dhekiajuli', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (149, N'Dhubri', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (150, N'Dibrugarh', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (151, N'Digboi', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (152, N'Diphu', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (153, N'Dispur', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (154, N'Gauripur', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (155, N'Goalpara', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (156, N'Golaghat', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (157, N'Guwahati', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (158, N'Haflong', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (159, N'Hailakandi', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (160, N'Hojai', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (161, N'Jorhat', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (162, N'Karimganj', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (163, N'Kokrajhar', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (164, N'Lanka', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (165, N'Lumding', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (166, N'Mangaldoi', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (167, N'Mankachar', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (168, N'Margherita', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (169, N'Mariani', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (170, N'Marigaon', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (171, N'Nagaon', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (172, N'Nalbari', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (173, N'North Lakhimpur', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (174, N'Rangia', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (175, N'Sibsagar', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (176, N'Silapathar', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (177, N'Silchar', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (178, N'Tezpur', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (179, N'Tinsukia', N'Assam')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (180, N'Amarpur', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (181, N'Araria', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (182, N'Areraj', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (183, N'Arrah', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (184, N'Asarganj', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (185, N'Aurangabad', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (186, N'Bagaha', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (187, N'Bahadurganj', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (188, N'Bairgania', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (189, N'Bakhtiarpur', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (190, N'Banka', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (191, N'Banmankhi Bazar', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (192, N'Barahiya', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (193, N'Barauli', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (194, N'Barbigha', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (195, N'Barh', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (196, N'Begusarai', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (197, N'Behea', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (198, N'Bettiah', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (199, N'Bhabua', N'Bihar')
GO
print 'Processed 200 total records'
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (200, N'Bhagalpur', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (201, N'Bihar Sharif', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (202, N'Bikramganj', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (203, N'Bodh Gaya', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (204, N'Buxar', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (205, N'Chandan Bara', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (206, N'Chanpatia', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (207, N'Chhapra', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (208, N'Colgong', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (209, N'Dalsinghsarai', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (210, N'Darbhanga', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (211, N'Daudnagar', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (212, N'Dehri-on-Sone', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (213, N'Dhaka', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (214, N'Dighwara', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (215, N'Dumraon', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (216, N'Fatwah', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (217, N'Forbesganj', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (218, N'Gaya', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (219, N'Gogri Jamalpur', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (220, N'Gopalganj', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (221, N'Hajipur', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (222, N'Hilsa', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (223, N'Hisua', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (224, N'Islampur', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (225, N'Jagdispur', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (226, N'Jamalpur', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (227, N'Jamui', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (228, N'Jehanabad', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (229, N'Jhajha', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (230, N'Jhanjharpur', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (231, N'Jogabani', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (232, N'Kanti', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (233, N'Katihar', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (234, N'Khagaria', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (235, N'Kharagpur', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (236, N'Kishanganj', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (237, N'Lakhisarai', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (238, N'Lalganj', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (239, N'Madhepura', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (240, N'Madhubani', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (241, N'Maharajganj', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (242, N'Mahnar Bazar', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (243, N'Makhdumpur', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (244, N'Maner', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (245, N'Manihari', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (246, N'Marhaura', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (247, N'Masaurhi', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (248, N'Mirganj', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (249, N'Mokameh', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (250, N'Motihari', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (251, N'Motipur', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (252, N'Munger', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (253, N'Murliganj', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (254, N'Muzaffarpur', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (255, N'Narkatiaganj', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (256, N'Naugachhia', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (257, N'Nawada', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (258, N'Nokha', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (259, N'Patna', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (260, N'Piro', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (261, N'Purnia', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (262, N'Rafiganj', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (263, N'Rajgir', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (264, N'Ramnagar', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (265, N'Raxaul Bazar', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (266, N'Revelganj', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (267, N'Rosera', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (268, N'Saharsa', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (269, N'Samastipur', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (270, N'Sasaram', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (271, N'Sheikhpura', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (272, N'Sheohar', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (273, N'Sherghati', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (274, N'Silao', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (275, N'Sitamarhi', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (276, N'Siwan', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (277, N'Sonepur', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (278, N'Sugauli', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (279, N'Sultanganj', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (280, N'Supaul', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (281, N'Warisaliganj', N'Bihar')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (282, N'Ahiwara', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (283, N'Akaltara', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (284, N'Ambagarh Chowki', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (285, N'Ambikapur', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (286, N'Arang', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (287, N'Bade Bacheli', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (288, N'Balod', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (289, N'Baloda Bazar', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (290, N'Bemetra', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (291, N'Bhatapara', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (292, N'Bilaspur', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (293, N'Birgaon', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (294, N'Champa', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (295, N'Chirmiri', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (296, N'Dalli-Rajhara', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (297, N'Dhamtari', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (298, N'Dipka', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (299, N'Dongargarh', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (300, N'Durg-Bhilai Nagar', N'Chhattisgarh')
GO
print 'Processed 300 total records'
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (301, N'Gobranawapara', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (302, N'Jagdalpur', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (303, N'Janjgir', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (304, N'Jashpurnagar', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (305, N'Kanker', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (306, N'Kawardha', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (307, N'Kondagaon', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (308, N'Korba', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (309, N'Mahasamund', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (310, N'Mahendragarh', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (311, N'Mungeli', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (312, N'Naila Janjgir', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (313, N'Raigarh', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (314, N'Raipur', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (315, N'Rajnandgaon', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (316, N'Sakti', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (317, N'Tilda Newra', N'Chhattisgarh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (318, N'Amli', N'Dadra & Nagar Haveli')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (319, N'Silvassa', N'Dadra and Nagar Haveli')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (320, N'Daman and Diu', N'Daman & Diu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (321, N'Daman and Diu', N'Daman & Diu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (322, N'Asola', N'Delhi')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (323, N'Delhi', N'Delhi')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (324, N'Aldona', N'Goa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (325, N'Curchorem Cacora', N'Goa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (326, N'Madgaon', N'Goa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (327, N'Mapusa', N'Goa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (328, N'Margao', N'Goa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (329, N'Marmagao', N'Goa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (330, N'Panaji', N'Goa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (331, N'Ahmedabad', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (332, N'Amreli', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (333, N'Anand', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (334, N'Ankleshwar', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (335, N'Bharuch', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (336, N'Bhavnagar', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (337, N'Bhuj', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (338, N'Cambay', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (339, N'Dahod', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (340, N'Deesa', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (342, N'Dholka', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (343, N'Gandhinagar', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (344, N'Godhra', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (345, N'Himatnagar', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (346, N'Idar', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (347, N'Jamnagar', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (348, N'Junagadh', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (349, N'Kadi', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (350, N'Kalavad', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (351, N'Kalol', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (352, N'Kapadvanj', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (353, N'Karjan', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (354, N'Keshod', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (355, N'Khambhalia', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (356, N'Khambhat', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (357, N'Kheda', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (358, N'Khedbrahma', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (359, N'Kheralu', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (360, N'Kodinar', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (361, N'Lathi', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (362, N'Limbdi', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (363, N'Lunawada', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (364, N'Mahesana', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (365, N'Mahuva', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (366, N'Manavadar', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (367, N'Mandvi', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (368, N'Mangrol', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (369, N'Mansa', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (370, N'Mehmedabad', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (371, N'Modasa', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (372, N'Morvi', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (373, N'Nadiad', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (374, N'Navsari', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (375, N'Padra', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (376, N'Palanpur', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (377, N'Palitana', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (378, N'Pardi', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (379, N'Patan', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (380, N'Petlad', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (381, N'Porbandar', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (382, N'Radhanpur', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (383, N'Rajkot', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (384, N'Rajpipla', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (385, N'Rajula', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (386, N'Ranavav', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (387, N'Rapar', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (388, N'Salaya', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (389, N'Sanand', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (390, N'Savarkundla', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (391, N'Sidhpur', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (392, N'Sihor', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (393, N'Songadh', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (394, N'Surat', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (395, N'Talaja', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (396, N'Thangadh', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (397, N'Tharad', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (398, N'Umbergaon', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (399, N'Umreth', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (400, N'Una', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (401, N'Unjha', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (402, N'Upleta', N'Gujarat')
GO
print 'Processed 400 total records'
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (403, N'Vadnagar', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (404, N'Vadodara', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (405, N'Valsad', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (406, N'Vapi', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (407, N'Vapi', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (408, N'Veraval', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (409, N'Vijapur', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (410, N'Viramgam', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (411, N'Visnagar', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (412, N'Vyara', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (413, N'Wadhwan', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (414, N'Wankaner', N'Gujarat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (415, N'Adalaj', N'Gujrat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (416, N'Adityana', N'Gujrat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (417, N'Alang', N'Gujrat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (418, N'Ambaji', N'Gujrat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (419, N'Ambaliyasan', N'Gujrat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (420, N'Andada', N'Gujrat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (421, N'Anjar', N'Gujrat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (422, N'Anklav', N'Gujrat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (423, N'Antaliya', N'Gujrat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (424, N'Arambhada', N'Gujrat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (425, N'Atul', N'Gujrat')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (426, N'Ballabhgarh', N'Hariyana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (427, N'Ambala', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (428, N'Ambala', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (429, N'Asankhurd', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (430, N'Assandh', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (431, N'Ateli', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (432, N'Babiyal', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (433, N'Bahadurgarh', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (434, N'Barwala', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (435, N'Bhiwani', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (436, N'Charkhi Dadri', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (437, N'Cheeka', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (438, N'Ellenabad ', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (439, N'Faridabad', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (440, N'Fatehabad', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (441, N'Ganaur', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (442, N'Gharaunda', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (443, N'Gohana', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (444, N'Gurgaon', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (445, N'Haibat(Yamuna Nagar)', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (446, N'Hansi', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (447, N'Hisar', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (448, N'Hodal', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (449, N'Jhajjar', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (450, N'Jind', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (451, N'Kaithal', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (452, N'Kalan Wali', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (453, N'Kalka', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (454, N'Karnal', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (455, N'Ladwa', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (456, N'Mahendragarh', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (457, N'Mandi Dabwali', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (458, N'Narnaul', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (459, N'Narwana', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (460, N'Palwal', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (461, N'Panchkula', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (462, N'Panipat', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (463, N'Pehowa', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (464, N'Pinjore', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (465, N'Rania', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (466, N'Ratia', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (467, N'Rewari', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (468, N'Rohtak', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (469, N'Safidon', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (470, N'Samalkha', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (471, N'Shahbad', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (472, N'Sirsa', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (473, N'Sohna', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (474, N'Sonipat', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (475, N'Taraori', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (476, N'Thanesar', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (477, N'Tohana', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (478, N'Yamunanagar', N'Haryana')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (479, N'Arki', N'Himachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (480, N'Baddi', N'Himachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (481, N'Bilaspur', N'Himachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (482, N'Chamba', N'Himachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (483, N'Dalhousie', N'Himachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (484, N'Dharamsala', N'Himachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (485, N'Hamirpur', N'Himachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (486, N'Mandi', N'Himachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (487, N'Nahan', N'Himachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (488, N'Shimla', N'Himachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (489, N'Solan', N'Himachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (490, N'Sundarnagar', N'Himachal Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (491, N'Jammu', N'Jammu & Kashmir')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (492, N'Achabbal', N'Jammu and Kashmir')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (493, N'Akhnoor', N'Jammu and Kashmir')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (494, N'Anantnag', N'Jammu and Kashmir')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (495, N'Arnia', N'Jammu and Kashmir')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (496, N'Awantipora', N'Jammu and Kashmir')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (497, N'Bandipore', N'Jammu and Kashmir')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (498, N'Baramula', N'Jammu and Kashmir')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (499, N'Kathua', N'Jammu and Kashmir')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (500, N'Leh', N'Jammu and Kashmir')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (501, N'Punch', N'Jammu and Kashmir')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (502, N'Rajauri', N'Jammu and Kashmir')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (503, N'Sopore', N'Jammu and Kashmir')
GO
print 'Processed 500 total records'
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (504, N'Srinagar', N'Jammu and Kashmir')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (505, N'Udhampur', N'Jammu and Kashmir')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (506, N'Amlabad', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (507, N'Ara', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (508, N'Barughutu', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (509, N'Bokaro Steel City', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (510, N'Chaibasa', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (511, N'Chakradharpur', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (512, N'Chandrapura', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (513, N'Chatra', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (514, N'Chirkunda', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (515, N'Churi', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (516, N'Daltonganj', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (517, N'Deoghar', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (518, N'Dhanbad', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (519, N'Dumka', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (520, N'Garhwa', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (521, N'Ghatshila', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (522, N'Giridih', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (523, N'Godda', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (524, N'Gomoh', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (525, N'Gumia', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (526, N'Gumla', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (527, N'Hazaribag', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (528, N'Hussainabad', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (529, N'Jamshedpur', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (530, N'Jamtara', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (531, N'Jhumri Tilaiya', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (532, N'Khunti', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (533, N'Lohardaga', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (534, N'Madhupur', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (535, N'Mihijam', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (536, N'Musabani', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (537, N'Pakaur', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (538, N'Patratu', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (539, N'Phusro', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (540, N'Ramngarh', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (541, N'Ranchi', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (542, N'Sahibganj', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (543, N'Saunda', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (544, N'Simdega', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (545, N'Tenu Dam-cum- Kathhara', N'Jharkhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (546, N'Arasikere', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (547, N'Bangalore', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (548, N'Belgaum', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (549, N'Bellary', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (550, N'Chamrajnagar', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (551, N'Chikkaballapur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (552, N'Chintamani', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (553, N'Chitradurga', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (554, N'Gulbarga', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (555, N'Gundlupet', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (556, N'Hassan', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (557, N'Hospet', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (558, N'Hubli', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (559, N'Karkala', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (560, N'Karwar', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (561, N'Kolar', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (562, N'Kota', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (563, N'Lakshmeshwar', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (564, N'Lingsugur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (565, N'Maddur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (566, N'Madhugiri', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (567, N'Madikeri', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (568, N'Magadi', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (569, N'Mahalingpur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (570, N'Malavalli', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (571, N'Malur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (572, N'Mandya', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (573, N'Mangalore', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (574, N'Manvi', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (575, N'Mudalgi', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (576, N'Mudbidri', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (577, N'Muddebihal', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (578, N'Mudhol', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (579, N'Mulbagal', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (580, N'Mundargi', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (581, N'Mysore', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (582, N'Nanjangud', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (583, N'Pavagada', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (584, N'Puttur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (585, N'Rabkavi Banhatti', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (586, N'Raichur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (587, N'Ramanagaram', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (588, N'Ramdurg', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (589, N'Ranibennur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (590, N'Robertson Pet', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (591, N'Ron', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (592, N'Sadalgi', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (593, N'Sagar', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (594, N'Sakleshpur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (595, N'Sandur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (596, N'Sankeshwar', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (597, N'Saundatti-Yellamma', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (598, N'Savanur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (599, N'Sedam', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (600, N'Shahabad', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (601, N'Shahpur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (602, N'Shiggaon', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (603, N'Shikapur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (604, N'Shimoga', N'Karnataka')
GO
print 'Processed 600 total records'
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (605, N'Shorapur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (606, N'Shrirangapattana', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (607, N'Sidlaghatta', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (608, N'Sindgi', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (609, N'Sindhnur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (610, N'Sira', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (611, N'Sirsi', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (612, N'Siruguppa', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (613, N'Srinivaspur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (614, N'Talikota', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (615, N'Tarikere', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (616, N'Tekkalakota', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (617, N'Terdal', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (618, N'Tiptur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (619, N'Tumkur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (620, N'Udupi', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (621, N'Vijayapura', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (622, N'Wadi', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (623, N'Yadgir', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (624, N'Adoor', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (625, N'Akathiyoor', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (626, N'Alappuzha', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (627, N'Ancharakandy', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (628, N'Aroor', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (629, N'Ashtamichira', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (630, N'Attingal', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (631, N'Avinissery', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (632, N'Chalakudy', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (633, N'Changanassery', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (634, N'Chendamangalam', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (635, N'Chengannur', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (636, N'Cherthala', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (637, N'Cheruthazham', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (638, N'Chittur-Thathamangalam', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (639, N'Chockli', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (640, N'Erattupetta', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (641, N'Guruvayoor', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (642, N'Irinjalakuda', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (643, N'Kadirur', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (644, N'Kalliasseri', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (645, N'Kalpetta', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (646, N'Kanhangad', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (647, N'Kanjikkuzhi', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (648, N'Kannur', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (649, N'Kasaragod', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (650, N'Kayamkulam', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (651, N'Kochi', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (652, N'Kodungallur', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (653, N'Kollam', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (654, N'Koothuparamba', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (655, N'Kothamangalam', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (656, N'Kottayam', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (657, N'Kozhikode', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (658, N'Kunnamkulam', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (659, N'Malappuram', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (660, N'Mattannur', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (661, N'Mavelikkara', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (662, N'Mavoor', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (663, N'Muvattupuzha', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (664, N'Nedumangad', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (665, N'Neyyattinkara', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (666, N'Ottappalam', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (667, N'Palai', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (668, N'Palakkad', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (669, N'Panniyannur', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (670, N'Pappinisseri', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (671, N'Paravoor', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (672, N'Pathanamthitta', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (673, N'Payyannur', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (674, N'Peringathur', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (675, N'Perinthalmanna', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (676, N'Perumbavoor', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (677, N'Ponnani', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (678, N'Punalur', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (679, N'Quilandy', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (680, N'Shoranur', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (681, N'Taliparamba', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (682, N'Thiruvalla', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (683, N'Thiruvananthapuram', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (684, N'Thodupuzha', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (685, N'Thrissur', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (686, N'Tirur', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (687, N'Vadakara', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (688, N'Vaikom', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (689, N'Varkala', N'Kerala')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (690, N'Kavaratti', N'Lakshadweep')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (691, N'Ashok Nagar', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (692, N'Balaghat', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (693, N'Betul', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (694, N'Bhopal', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (695, N'Burhanpur', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (696, N'Chhatarpur', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (697, N'Dabra', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (698, N'Datia', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (699, N'Dewas', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (700, N'Dhar', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (701, N'Fatehabad', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (702, N'Gwalior', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (703, N'Indore', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (704, N'Itarsi', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (705, N'Jabalpur', N'Madhya Pradesh')
GO
print 'Processed 700 total records'
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (706, N'Katni', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (707, N'Kotma', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (708, N'Lahar', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (709, N'Lundi', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (710, N'Maharajpur', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (711, N'Mahidpur', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (712, N'Maihar', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (713, N'Malajkhand', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (714, N'Manasa', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (715, N'Manawar', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (716, N'Mandideep', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (717, N'Mandla', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (718, N'Mandsaur', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (719, N'Mauganj', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (720, N'Mhow Cantonment', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (721, N'Mhowgaon', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (722, N'Morena', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (723, N'Multai', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (724, N'Murwara', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (725, N'Nagda', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (726, N'Nainpur', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (727, N'Narsinghgarh', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (728, N'Narsinghgarh', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (729, N'Neemuch', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (730, N'Nepanagar', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (731, N'Niwari', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (732, N'Nowgong', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (733, N'Nowrozabad', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (734, N'Pachore', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (735, N'Pali', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (736, N'Panagar', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (737, N'Pandhurna', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (738, N'Panna', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (739, N'Pasan', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (740, N'Pipariya', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (741, N'Pithampur', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (742, N'Porsa', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (743, N'Prithvipur', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (744, N'Raghogarh-Vijaypur', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (745, N'Rahatgarh', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (746, N'Raisen', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (747, N'Rajgarh', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (748, N'Ratlam', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (749, N'Rau', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (750, N'Rehli', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (751, N'Rewa', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (752, N'Sabalgarh', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (753, N'Sagar', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (754, N'Sanawad', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (755, N'Sarangpur', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (756, N'Sarni', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (757, N'Satna', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (758, N'Sausar', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (759, N'Sehore', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (760, N'Sendhwa', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (761, N'Seoni', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (762, N'Seoni-Malwa', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (763, N'Shahdol', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (764, N'Shajapur', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (765, N'Shamgarh', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (766, N'Sheopur', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (767, N'Shivpuri', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (768, N'Shujalpur', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (769, N'Sidhi', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (770, N'Sihora', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (771, N'Singrauli', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (772, N'Sironj', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (773, N'Sohagpur', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (774, N'Tarana', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (775, N'Tikamgarh', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (776, N'Ujhani', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (777, N'Ujjain', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (778, N'Umaria', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (779, N'Vidisha', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (780, N'Wara Seoni', N'Madhya Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (781, N'Ahmednagar', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (782, N'Akola', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (783, N'Amravati', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (784, N'Aurangabad', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (785, N'Baramati', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (786, N'Chalisgaon', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (787, N'Chinchani', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (788, N'Devgarh', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (789, N'Dhule', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (790, N'Dombivli', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (791, N'Durgapur', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (792, N'Ichalkaranji', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (793, N'Jalna', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (794, N'Kalyan', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (795, N'Latur', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (796, N'Loha', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (797, N'Lonar', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (798, N'Lonavla', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (799, N'Mahad', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (800, N'Mahuli', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (801, N'Malegaon', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (802, N'Malkapur', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (803, N'Manchar', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (804, N'Mangalvedhe', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (805, N'Mangrulpir', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (806, N'Manjlegaon', N'Maharashtra')
GO
print 'Processed 800 total records'
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (807, N'Manmad', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (808, N'Manwath', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (809, N'Mehkar', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (810, N'Mhaswad', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (811, N'Miraj', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (812, N'Morshi', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (813, N'Mukhed', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (814, N'Mul', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (815, N'Mumbai', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (816, N'Murtijapur', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (817, N'Nagpur', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (818, N'Nalasopara', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (819, N'Nanded-Waghala', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (820, N'Nandgaon', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (821, N'Nandura', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (822, N'Nandurbar', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (823, N'Narkhed', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (824, N'Nashik', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (825, N'Navi Mumbai', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (826, N'Nawapur', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (827, N'Nilanga', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (828, N'Osmanabad', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (829, N'Ozar', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (830, N'Pachora', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (831, N'Paithan', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (832, N'Palghar', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (833, N'Pandharkaoda', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (834, N'Pandharpur', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (835, N'Panvel', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (836, N'Parbhani', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (837, N'Parli', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (838, N'Parola', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (839, N'Partur', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (840, N'Pathardi', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (841, N'Pathri', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (842, N'Patur', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (843, N'Pauni', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (844, N'Pen', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (845, N'Phaltan', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (846, N'Pulgaon', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (847, N'Pune', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (848, N'Purna', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (849, N'Pusad', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (850, N'Rahuri', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (851, N'Rajura', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (852, N'Ramtek', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (853, N'Ratnagiri', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (854, N'Raver', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (855, N'Risod', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (856, N'Sailu', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (857, N'Sangamner', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (858, N'Sangli', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (859, N'Sangole', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (860, N'Sasvad', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (861, N'Satana', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (862, N'Satara', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (863, N'Savner', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (864, N'Sawantwadi', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (865, N'Shahade', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (866, N'Shegaon', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (867, N'Shendurjana', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (868, N'Shirdi', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (869, N'Shirpur-Warwade', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (870, N'Shirur', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (871, N'Shrigonda', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (872, N'Shrirampur', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (873, N'Sillod', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (874, N'Sinnar', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (875, N'Solapur', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (876, N'Soyagaon', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (877, N'Talegaon Dabhade', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (878, N'Talode', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (879, N'Tasgaon', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (880, N'Tirora', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (881, N'Tuljapur', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (882, N'Tumsar', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (883, N'Uran', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (884, N'Uran Islampur', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (885, N'Wadgaon Road', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (886, N'Wai', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (887, N'Wani', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (888, N'Wardha', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (889, N'Warora', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (890, N'Warud', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (891, N'Washim', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (892, N'Yevla', N'Maharashtra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (893, N'Uchgaon', N'Maharastra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (894, N'Udgir', N'Maharastra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (895, N'Umarga', N'Maharastra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (896, N'Umarkhed', N'Maharastra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (897, N'Umred', N'Maharastra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (898, N'Vadgaon Kasba', N'Maharastra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (899, N'Vaijapur', N'Maharastra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (900, N'Vasai', N'Maharastra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (901, N'Virar', N'Maharastra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (902, N'Vita', N'Maharastra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (903, N'Yavatmal', N'Maharastra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (904, N'Yawal', N'Maharastra')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (905, N'Imphal', N'Manipur')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (906, N'Kakching', N'Manipur')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (907, N'Lilong', N'Manipur')
GO
print 'Processed 900 total records'
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (908, N'Mayang Imphal', N'Manipur')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (909, N'Thoubal', N'Manipur')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (910, N'Jowai', N'Meghalaya')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (911, N'Nongstoin', N'Meghalaya')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (912, N'Shillong', N'Meghalaya')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (913, N'Tura', N'Meghalaya')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (914, N'Aizawl', N'Mizoram')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (915, N'Champhai', N'Mizoram')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (916, N'Lunglei', N'Mizoram')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (917, N'Saiha', N'Mizoram')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (918, N'Dimapur', N'Nagaland')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (919, N'Kohima', N'Nagaland')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (920, N'Mokokchung', N'Nagaland')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (921, N'Tuensang', N'Nagaland')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (922, N'Wokha', N'Nagaland')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (923, N'Zunheboto', N'Nagaland')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (924, N'Anandapur', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (925, N'Anugul', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (926, N'Asika', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (927, N'Balangir', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (928, N'Balasore', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (929, N'Baleshwar', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (930, N'Bamra', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (931, N'Barbil', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (932, N'Bargarh', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (933, N'Bargarh', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (934, N'Baripada', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (935, N'Basudebpur', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (936, N'Belpahar', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (937, N'Bhadrak', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (938, N'Bhawanipatna', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (939, N'Bhuban', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (940, N'Bhubaneswar', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (941, N'Biramitrapur', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (942, N'Brahmapur', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (943, N'Brajrajnagar', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (944, N'Byasanagar', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (945, N'Cuttack', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (946, N'Debagarh', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (947, N'Dhenkanal', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (948, N'Gunupur', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (949, N'Hinjilicut', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (950, N'Jagatsinghapur', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (951, N'Jajapur', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (952, N'Jaleswar', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (953, N'Jatani', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (954, N'Jeypur', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (955, N'Jharsuguda', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (956, N'Joda', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (957, N'Kantabanji', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (958, N'Karanjia', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (959, N'Kendrapara', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (960, N'Kendujhar', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (961, N'Khordha', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (962, N'Koraput', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (963, N'Malkangiri', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (964, N'Nabarangapur', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (965, N'Paradip', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (966, N'Parlakhemundi', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (967, N'Pattamundai', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (968, N'Phulabani', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (969, N'Puri', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (970, N'Rairangpur', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (971, N'Rajagangapur', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (972, N'Raurkela', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (973, N'Rayagada', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (974, N'Sambalpur', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (975, N'Soro', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (976, N'Sunabeda', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (977, N'Sundargarh', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (978, N'Talcher', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (979, N'Titlagarh', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (980, N'Umarkote', N'Orissa')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (981, N'Karaikal', N'Pondicherry')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (982, N'Mahe', N'Pondicherry')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (983, N'Pondicherry', N'Pondicherry')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (984, N'Yanam', N'Pondicherry')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (985, N'Ahmedgarh', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (986, N'Amritsar', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (987, N'Barnala', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (988, N'Batala', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (989, N'Bathinda', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (990, N'Bhagha Purana', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (991, N'Budhlada', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (992, N'Chandigarh', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (993, N'Dasua', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (994, N'Dhuri', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (995, N'Dinanagar', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (996, N'Faridkot', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (997, N'Fazilka', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (998, N'Firozpur', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (999, N'Firozpur Cantt.', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1000, N'Giddarbaha', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1001, N'Gobindgarh', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1002, N'Gurdaspur', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1003, N'Hoshiarpur', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1004, N'Jagraon', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1005, N'Jaitu', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1006, N'Jalalabad', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1007, N'Jalandhar', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1008, N'Jalandhar Cantt.', N'Punjab')
GO
print 'Processed 1000 total records'
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1009, N'Jandiala', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1010, N'Kapurthala', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1011, N'Karoran', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1012, N'Kartarpur', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1013, N'Khanna', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1014, N'Kharar', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1015, N'Kot Kapura', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1016, N'Kurali', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1017, N'Longowal', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1018, N'Ludhiana', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1019, N'Malerkotla', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1020, N'Malout', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1021, N'Mansa', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1022, N'Maur', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1023, N'Moga', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1024, N'Mohali', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1025, N'Morinda', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1026, N'Mukerian', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1027, N'Muktsar', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1028, N'Nabha', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1029, N'Nakodar', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1030, N'Nangal', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1031, N'Nawanshahr', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1032, N'Pathankot', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1033, N'Patiala', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1034, N'Patran', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1035, N'Patti', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1036, N'Phagwara', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1037, N'Phillaur', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1038, N'Qadian', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1039, N'Raikot', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1040, N'Rajpura', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1041, N'Rampura Phul', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1042, N'Rupnagar', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1043, N'Samana', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1044, N'Sangrur', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1045, N'Sirhind Fatehgarh Sahib', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1046, N'Sujanpur', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1047, N'Sunam', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1048, N'Talwara', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1049, N'Tarn Taran', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1050, N'Urmar Tanda', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1051, N'Zira', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1052, N'Zirakpur', N'Punjab')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1053, N'Bali', N'Rajastan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1054, N'Banswara', N'Rajastan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1055, N'Ajmer', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1056, N'Alwar', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1057, N'Bandikui', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1058, N'Baran', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1059, N'Barmer', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1060, N'Bikaner', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1061, N'Fatehpur', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1062, N'Jaipur', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1063, N'Jaisalmer', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1064, N'Jodhpur', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1065, N'Kota', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1066, N'Lachhmangarh', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1067, N'Ladnu', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1068, N'Lakheri', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1069, N'Lalsot', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1070, N'Losal', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1071, N'Makrana', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1072, N'Malpura', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1073, N'Mandalgarh', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1074, N'Mandawa', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1075, N'Mangrol', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1076, N'Merta City', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1077, N'Mount Abu', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1078, N'Nadbai', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1079, N'Nagar', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1080, N'Nagaur', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1081, N'Nargund', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1082, N'Nasirabad', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1083, N'Nathdwara', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1084, N'Navalgund', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1085, N'Nawalgarh', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1086, N'Neem-Ka-Thana', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1087, N'Nelamangala', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1088, N'Nimbahera', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1089, N'Nipani', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1090, N'Niwai', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1091, N'Nohar', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1092, N'Nokha', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1093, N'Pali', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1094, N'Phalodi', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1095, N'Phulera', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1096, N'Pilani', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1097, N'Pilibanga', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1098, N'Pindwara', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1099, N'Pipar City', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1100, N'Prantij', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1101, N'Pratapgarh', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1102, N'Raisinghnagar', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1103, N'Rajakhera', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1104, N'Rajaldesar', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1105, N'Rajgarh (Alwar)', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1106, N'Rajgarh (Churu', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1107, N'Rajsamand', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1108, N'Ramganj Mandi', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1109, N'Ramngarh', N'Rajasthan')
GO
print 'Processed 1100 total records'
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1110, N'Ratangarh', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1111, N'Rawatbhata', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1112, N'Rawatsar', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1113, N'Reengus', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1114, N'Sadri', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1115, N'Sadulshahar', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1116, N'Sagwara', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1117, N'Sambhar', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1118, N'Sanchore', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1119, N'Sangaria', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1120, N'Sardarshahar', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1121, N'Sawai Madhopur', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1122, N'Shahpura', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1123, N'Shahpura', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1124, N'Sheoganj', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1125, N'Sikar', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1126, N'Sirohi', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1127, N'Sojat', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1128, N'Sri Madhopur', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1129, N'Sujangarh', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1130, N'Sumerpur', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1131, N'Suratgarh', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1132, N'Taranagar', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1133, N'Todabhim', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1134, N'Todaraisingh', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1135, N'Tonk', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1136, N'Udaipur', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1137, N'Udaipurwati', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1138, N'Vijainagar', N'Rajasthan')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1139, N'Gangtok', N'Sikkim')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1140, N'Calcutta', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1141, N'Arakkonam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1142, N'Arcot', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1143, N'Aruppukkottai', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1144, N'Bhavani', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1145, N'Chengalpattu', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1146, N'Chennai', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1147, N'Chinna salem', N'Tamil nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1148, N'Coimbatore', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1149, N'Coonoor', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1150, N'Cuddalore', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1151, N'Dharmapuri', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1152, N'Dindigul', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1153, N'Erode', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1154, N'Gudalur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1155, N'Gudalur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1156, N'Gudalur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1157, N'Kanchipuram', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1158, N'Karaikudi', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1159, N'Karungal', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1160, N'Karur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1161, N'Kollankodu', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1162, N'Lalgudi', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1163, N'Madurai', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1164, N'Nagapattinam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1165, N'Nagercoil', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1166, N'Namagiripettai', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1167, N'Namakkal', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1168, N'Nandivaram-Guduvancheri', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1169, N'Nanjikottai', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1170, N'Natham', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1171, N'Nellikuppam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1172, N'Neyveli', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1173, N'O'' Valley', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1174, N'Oddanchatram', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1175, N'P.N.Patti', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1176, N'Pacode', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1177, N'Padmanabhapuram', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1178, N'Palani', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1179, N'Palladam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1180, N'Pallapatti', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1181, N'Pallikonda', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1182, N'Panagudi', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1183, N'Panruti', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1184, N'Paramakudi', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1185, N'Parangipettai', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1186, N'Pattukkottai', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1187, N'Perambalur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1188, N'Peravurani', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1189, N'Periyakulam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1190, N'Periyasemur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1191, N'Pernampattu', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1192, N'Pollachi', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1193, N'Polur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1194, N'Ponneri', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1195, N'Pudukkottai', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1196, N'Pudupattinam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1197, N'Puliyankudi', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1198, N'Punjaipugalur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1199, N'Rajapalayam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1200, N'Ramanathapuram', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1201, N'Rameshwaram', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1202, N'Rasipuram', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1203, N'Salem', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1204, N'Sankarankoil', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1205, N'Sankari', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1206, N'Sathyamangalam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1207, N'Sattur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1208, N'Shenkottai', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1209, N'Sholavandan', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1210, N'Sholingur', N'Tamil Nadu')
GO
print 'Processed 1200 total records'
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1211, N'Sirkali', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1212, N'Sivaganga', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1213, N'Sivagiri', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1214, N'Sivakasi', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1215, N'Srivilliputhur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1216, N'Surandai', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1217, N'Suriyampalayam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1218, N'Tenkasi', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1219, N'Thammampatti', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1220, N'Thanjavur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1221, N'Tharamangalam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1222, N'Tharangambadi', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1223, N'Theni Allinagaram', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1224, N'Thirumangalam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1225, N'Thirunindravur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1226, N'Thiruparappu', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1227, N'Thirupuvanam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1228, N'Thiruthuraipoondi', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1229, N'Thiruvallur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1230, N'Thiruvarur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1231, N'Thoothukudi', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1232, N'Thuraiyur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1233, N'Tindivanam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1234, N'Tiruchendur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1235, N'Tiruchengode', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1236, N'Tiruchirappalli', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1237, N'Tirukalukundram', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1238, N'Tirukkoyilur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1239, N'Tirunelveli', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1240, N'Tirupathur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1241, N'Tirupathur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1242, N'Tiruppur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1243, N'Tiruttani', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1244, N'Tiruvannamalai', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1245, N'Tiruvethipuram', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1246, N'Tittakudi', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1247, N'Udhagamandalam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1248, N'Udumalaipettai', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1249, N'Unnamalaikadai', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1250, N'Usilampatti', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1251, N'Uthamapalayam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1252, N'Uthiramerur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1253, N'Vadakkuvalliyur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1254, N'Vadalur', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1255, N'Vadipatti', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1256, N'Valparai', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1257, N'Vandavasi', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1258, N'Vaniyambadi', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1259, N'Vedaranyam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1260, N'Vellakoil', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1261, N'Vellore', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1262, N'Vikramasingapuram', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1263, N'Viluppuram', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1264, N'Virudhachalam', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1265, N'Virudhunagar', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1266, N'Viswanatham', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1267, N'Agartala', N'Tripura')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1268, N'Badharghat', N'Tripura')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1269, N'Dharmanagar', N'Tripura')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1270, N'Indranagar', N'Tripura')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1271, N'Jogendranagar', N'Tripura')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1272, N'Kailasahar', N'Tripura')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1273, N'Khowai', N'Tripura')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1274, N'Pratapgarh', N'Tripura')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1275, N'Udaipur', N'Tripura')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1276, N'Achhnera', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1277, N'Adari', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1278, N'Agra', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1279, N'Aligarh', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1280, N'Allahabad', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1281, N'Amroha', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1282, N'Azamgarh', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1283, N'Bahraich', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1284, N'Ballia', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1285, N'Balrampur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1286, N'Banda', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1287, N'Bareilly', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1288, N'Chandausi', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1289, N'Dadri', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1290, N'Deoria', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1291, N'Etawah', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1292, N'Fatehabad', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1293, N'Fatehpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1294, N'Fatehpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1295, N'Greater Noida', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1296, N'Hamirpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1297, N'Hardoi', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1298, N'Jajmau', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1299, N'Jaunpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1300, N'Jhansi', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1301, N'Kalpi', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1302, N'Kanpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1303, N'Kota', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1304, N'Laharpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1305, N'Lakhimpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1306, N'Lal Gopalganj Nindaura', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1307, N'Lalganj', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1308, N'Lalitpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1309, N'Lar', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1310, N'Loni', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1311, N'Lucknow', N'Uttar Pradesh')
GO
print 'Processed 1300 total records'
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1312, N'Mathura', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1313, N'Meerut', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1314, N'Modinagar', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1315, N'Muradnagar', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1316, N'Nagina', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1317, N'Najibabad', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1318, N'Nakur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1319, N'Nanpara', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1320, N'Naraura', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1321, N'Naugawan Sadat', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1322, N'Nautanwa', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1323, N'Nawabganj', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1324, N'Nehtaur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1325, N'NOIDA', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1326, N'Noorpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1327, N'Obra', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1328, N'Orai', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1329, N'Padrauna', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1330, N'Palia Kalan', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1331, N'Parasi', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1332, N'Phulpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1333, N'Pihani', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1334, N'Pilibhit', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1335, N'Pilkhuwa', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1336, N'Powayan', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1337, N'Pukhrayan', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1338, N'Puranpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1339, N'Purquazi', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1340, N'Purwa', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1341, N'Rae Bareli', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1342, N'Rampur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1343, N'Rampur Maniharan', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1344, N'Rasra', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1345, N'Rath', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1346, N'Renukoot', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1347, N'Reoti', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1348, N'Robertsganj', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1349, N'Rudauli', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1350, N'Rudrapur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1351, N'Sadabad', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1352, N'Safipur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1353, N'Saharanpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1354, N'Sahaspur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1355, N'Sahaswan', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1356, N'Sahawar', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1357, N'Sahjanwa', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1359, N'Sambhal', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1360, N'Samdhan', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1361, N'Samthar', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1362, N'Sandi', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1363, N'Sandila', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1364, N'Sardhana', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1365, N'Seohara', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1368, N'Shahganj', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1369, N'Shahjahanpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1370, N'Shamli', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1373, N'Sherkot', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1375, N'Shikohabad', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1376, N'Shishgarh', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1377, N'Siana', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1378, N'Sikanderpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1379, N'Sikandra Rao', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1380, N'Sikandrabad', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1381, N'Sirsaganj', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1382, N'Sirsi', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1383, N'Sitapur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1384, N'Soron', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1385, N'Suar', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1386, N'Sultanpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1387, N'Sumerpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1388, N'Tanda', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1389, N'Tanda', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1390, N'Tetri Bazar', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1391, N'Thakurdwara', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1392, N'Thana Bhawan', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1393, N'Tilhar', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1394, N'Tirwaganj', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1395, N'Tulsipur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1396, N'Tundla', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1397, N'Unnao', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1398, N'Utraula', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1399, N'Varanasi', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1400, N'Vrindavan', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1401, N'Warhapur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1402, N'Zaidpur', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1403, N'Zamania', N'Uttar Pradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1404, N'Almora', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1405, N'Bazpur', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1406, N'Chamba', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1407, N'Dehradun', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1408, N'Haldwani', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1409, N'Haridwar', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1410, N'Jaspur', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1411, N'Kashipur', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1412, N'kichha', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1413, N'Kotdwara', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1414, N'Manglaur', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1415, N'Mussoorie', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1416, N'Nagla', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1417, N'Nainital', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1418, N'Pauri', N'Uttarakhand')
GO
print 'Processed 1400 total records'
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1419, N'Pithoragarh', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1420, N'Ramnagar', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1421, N'Rishikesh', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1422, N'Roorkee', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1423, N'Rudrapur', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1424, N'Sitarganj', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1425, N'Tehri', N'Uttarakhand')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1426, N'Muzaffarnagar', N'Uttarpradesh')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1428, N'Alipurduar', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1429, N'Arambagh', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1430, N'Asansol', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1431, N'Baharampur', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1432, N'Bally', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1433, N'Balurghat', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1434, N'Bankura', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1435, N'Barakar', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1436, N'Barasat', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1437, N'Bardhaman', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1438, N'Bidhan Nagar', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1439, N'Chinsura', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1440, N'Contai', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1441, N'Cooch Behar', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1442, N'Darjeeling', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1443, N'Durgapur', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1444, N'Haldia', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1445, N'Howrah', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1446, N'Islampur', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1447, N'Jhargram', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1448, N'Kharagpur', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1449, N'Kolkata', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1450, N'Mainaguri', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1451, N'Mal', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1452, N'Mathabhanga', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1453, N'Medinipur', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1454, N'Memari', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1455, N'Monoharpur', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1456, N'Murshidabad', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1457, N'Nabadwip', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1458, N'Naihati', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1459, N'Panchla', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1460, N'Pandua', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1461, N'Paschim Punropara', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1462, N'Purulia', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1463, N'Raghunathpur', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1464, N'Raiganj', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1465, N'Rampurhat', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1466, N'Ranaghat', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1467, N'Sainthia', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1468, N'Santipur', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1469, N'Siliguri', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1470, N'Sonamukhi', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1471, N'Srirampore', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1472, N'Suri', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1473, N'Taki', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1474, N'Tamluk', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1475, N'Tarakeswar', N'West Bengal')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1476, N'Chikmagalur', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1477, N'Davanagere', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1478, N'Dharwad', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1479, N'Gadag', N'Karnataka')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1480, N'Chennai', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1481, N'Coimbatore', N'Tamil Nadu')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1482, N'Barrackpur', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1483, N'Barwani', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1484, N'Basna', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1485, N'Bawal', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1486, N'Beawar', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1487, N'Berhampur', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1488, N'Bhajanpura', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1489, N'Bhandara', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1490, N'Bharatpur', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1491, N'Bharthana', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1492, N'Bhilai', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1493, N'Bhilwara', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1494, N'Bhinmal', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1495, N'Bhiwandi', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1496, N'Bhusawal', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1497, N'Bidar', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1498, N'Bijnaur', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1499, N'Bilara', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1500, N'Budaun', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1501, N'Bulandshahr', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1502, N'Burla', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1503, N'Chakeri', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1504, N'Champawat', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1505, N'Chandil', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1506, N'Chandrapur', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1507, N'Chapirevula', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1508, N'Charkhari', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1509, N'Charkhi Dadri', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1510, N'Chhindwara', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1511, N'Chiplun', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1512, N'Chitrakoot', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1513, N'Churu', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1514, N'Dalkhola', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1515, N'Damoh', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1516, N'Daund', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1517, N'Dehgam', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1518, N'Devgarh', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1519, N'Dhulian', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1520, N'Dumdum', N'unknown')
GO
print 'Processed 1500 total records'
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1521, N'Dwarka', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1522, N'Etah', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1523, N'Faizabad', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1524, N'Falna', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1525, N'Farrukhabad', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1526, N'Fatehgarh', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1527, N'Fatehpur Chaurasi', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1528, N'Fatehpur Sikri', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1529, N'Firozabad', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1530, N'Gadchiroli', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1531, N'Gandhidham', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1532, N'Ganjam', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1533, N'Ghatampur', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1534, N'Ghatanji', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1535, N'Ghaziabad', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1536, N'Ghazipur', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1537, N'Goa Velha', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1538, N'Gokak', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1539, N'Gondiya', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1540, N'Gorakhpur', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1541, N'Guna', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1542, N'Hanumangarh', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1543, N'Harda', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1544, N'Harsawa', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1545, N'Hastinapur', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1546, N'Hathras', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1547, N'Jagadhri', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1548, N'Jais', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1549, N'Jaitaran', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1550, N'Jalgaon', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1551, N'Jalore', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1552, N'Jhabua', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1553, N'Jhalawar', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1554, N'Jhunjhunu', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1555, N'Junnar', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1556, N'Kailaras', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1557, N'Kalburgi', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1558, N'Kalimpong', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1559, N'Kamthi', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1560, N'Kanpur', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1561, N'Karad', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1562, N'Keylong', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1563, N'Kheri', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1564, N'Khurai', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1565, N'Kodad', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1566, N'Konnagar', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1567, N'Krishnanagar', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1568, N'Kuchinda', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1569, N'Madhyamgram', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1570, N'Mahabaleswar', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1571, N'Mahoba', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1572, N'Mahwa', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1573, N'Manesar', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1574, N'Mangalagiri', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1575, N'Mira-Bhayandar', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1576, N'Mirzapur', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1577, N'Mithapur', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1578, N'Mohania', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1579, N'Mokama', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1580, N'Moradabad', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1581, N'Mukatsar', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1582, N'Nagalapuram', N'unknown')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1791, N'KURUKSHETRA', N'HARYANA')
INSERT [dbo].[Jct_Payroll_Portal_Cities] ([city_id], [city_name], [city_state]) VALUES (1695, N'CHANDIGARH', N'CHANDIGARH')
SET IDENTITY_INSERT [dbo].[Jct_Payroll_Portal_Cities] OFF
/****** Object:  Table [dbo].[Jct_Payroll_Portal_State]    Script Date: 07/14/2021 17:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Jct_Payroll_Portal_State](
	[id] [int] NOT NULL,
	[state] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (1, N'ANDAMAN AND NICOBAR ISLANDS')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (2, N'ANDHRA PRADESH')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (3, N'ARUNACHAL PRADESH')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (4, N'ASSAM')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (5, N'BIHAR')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (6, N'CHATTISGARH')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (7, N'CHANDIGARH')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (8, N'DAMAN AND DIU')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (9, N'DELHI')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (10, N'DADRA AND NAGAR HAVELI')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (11, N'GOA')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (12, N'GUJARAT')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (13, N'HIMACHAL PRADESH')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (14, N'HARYANA')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (15, N'JAMMU AND KASHMIR')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (16, N'JHARKHAND')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (17, N'KERALA')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (18, N'KARNATAKA')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (19, N'LAKSHADWEEP')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (20, N'MEGHALAYA')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (21, N'MAHARASHTRA')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (22, N'MANIPUR')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (23, N'MADHYA PRADESH')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (24, N'MIZORAM')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (25, N'NAGALAND')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (26, N'ORISSA')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (27, N'PUNJAB')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (28, N'PONDICHERRY')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (29, N'RAJASTHAN')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (30, N'SIKKIM')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (31, N'TAMIL NADU')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (32, N'TRIPURA')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (33, N'UTTARAKHAND')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (34, N'UTTAR PRADESH')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (35, N'WEST BENGAL')
INSERT [dbo].[Jct_Payroll_Portal_State] ([id], [state]) VALUES (36, N'Other')
/****** Object:  Table [dbo].[Jct_Payroll_Emp_Address_Detail_Portal]    Script Date: 07/14/2021 17:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Jct_Payroll_Emp_Address_Detail_Portal](
	[CardNo] [varchar](10) NULL,
	[EmployeeCode] [varchar](10) NULL,
	[AddressType] [varchar](30) NULL,
	[Address1] [varchar](60) NULL,
	[Address2] [varchar](60) NULL,
	[Address3] [varchar](60) NULL,
	[City] [varchar](60) NULL,
	[State] [varchar](60) NULL,
	[Country] [varchar](60) NULL,
	[Pincode] [varchar](20) NULL,
	[PrimaryMobileNo] [numeric](10, 0) NULL,
	[SecondaryMobileNo] [numeric](10, 0) NULL,
	[PrimaryLandlineNo] [varchar](12) NULL,
	[SecondaryLandlineNo] [varchar](12) NULL,
	[EmailID] [varchar](35) NULL,
	[Status] [varchar](1) NULL,
	[EntryBy] [varchar](30) NULL,
	[EntryOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1167', N'D-00764', N'Permanent', N'VPO-DHAKK PANDORI', N'TES-PHAGWARA', N'DIST-KAPURTHALA', N'PHAGWARA', N'PUNJAB', N'India', N'1444401', CAST(9814919532 AS Numeric(10, 0)), CAST(6280374057 AS Numeric(10, 0)), N'', N'', N'dharminders@jctltd.com', N'A', N'9000000613', CAST(0x0000AD6400AAAD1A AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1167', N'D-00764', N'Current', N'VPO-DHAKK PANDORI', N'TES-PHAGWARA', N'DIST-KAPURTHALA', N'PHAGWARA', N'PUNJAB', N'India', N'1444401', CAST(9814919532 AS Numeric(10, 0)), CAST(6280374057 AS Numeric(10, 0)), N'', N'', N'dharminders@jctltd.com', N'A', N'9000000613', CAST(0x0000AD6400AAAD1A AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'3213', N'BAN-T02', N'Permanent', N'245,1ST FLOOR,4TH CROSS,OIL MILL ROAD,', N'LINGARAJAPURAM', N'', N'BANGALORE', N'KARNATAKA', N'India', N'560084', CAST(9663305462 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'tsk123kumar@yahoo.com', N'A', N'9000000725', CAST(0x0000AD6400ABE784 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'3213', N'BAN-T02', N'Current', N'245,1ST FLOOR,4TH CROSS,OIL MILL ROAD,', N'LINGARAJAPURAM', N'', N'BANGALORE', N'KARNATAKA', N'India', N'560084', CAST(9663305462 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'tsk123kumar@yahoo.com', N'A', N'9000000725', CAST(0x0000AD6400ABE784 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2606', N'K-02046', N'Permanent', N'HOUSE NO. 493', N'BLOCK - I', N'BRS NAGAR ', N'LUDHIANA', N'PUNJAB', N'India', N'141012', CAST(7087437706 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'Khushwinder@jctltd.com', N'A', N'9000000402', CAST(0x0000AD6400AE2FEF AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2606', N'K-02046', N'Current', N'HOUSE NO. 493', N'BLOCK - I', N'BRS NAGAR ', N'LUDHIANA', N'PUNJAB', N'India', N'141012', CAST(7087437706 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'Khushwinder@jctltd.com', N'A', N'9000000402', CAST(0x0000AD6400AE2FEF AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1154', N'S-13850', N'Permanent', N'SUSHIL KUMAR DUBEY', N'ONKAR NAGAR GALI N:- 4B', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9914019034 AS Numeric(10, 0)), CAST(7355438115 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000617', CAST(0x0000AD6400B28D51 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1154', N'S-13850', N'Current', N'SUSHIL KUMAR DUBEY', N'ONKAR NAGAR GALI N:- 4B', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9914019034 AS Numeric(10, 0)), CAST(7355438115 AS Numeric(10, 0)), N'', N'', N'phs@JctLtd.com', N'A', N'9000000617', CAST(0x0000AD6400B28D51 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1434', N'K-02175', N'Permanent', N'VILLAGE NAWAN PIND TAPPRIAN', N'TEHSIL BALACHAUR', N'DISTT S.B.S.NAGAR', N'NAWANSHAHR', N'PUNJAB', N'India', N'144521', CAST(9915003587 AS Numeric(10, 0)), CAST(9464503587 AS Numeric(10, 0)), N'01824521523', N'', N'kamakjitb@jctltd.com', N'A', N'9000000731', CAST(0x0000AD6400C0DAA0 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1434', N'K-02175', N'Current', N'HOUSE NO 562', N'URBAN ESTATE ', N'DISTT KAPURTHALA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9915003587 AS Numeric(10, 0)), CAST(9464503587 AS Numeric(10, 0)), N'01824521523', N'', N'kamajitb@jctltd.com', N'A', N'9000000731', CAST(0x0000AD6400C0DAA0 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2943', N'V-04342', N'Permanent', N'IHT 31', N'THAPAR COLONY', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(7888640125 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01824521523', N'', N'vinaydogra@jctltd.com', N'A', N'9000000489', CAST(0x0000AD6400C280F5 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2943', N'V-04342', N'Current', N'IHT 31', N'THAPAR COLONY', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(7888640125 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01824521523', N'', N'vinaydogra@jctltd.com', N'A', N'9000000489', CAST(0x0000AD6400C280F5 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1862', N'O-02807', N'Permanent', N'MOHALLA JAGOTIAN', N'RAHON', N'HNO.  B - 12 / 443 GHATI TELIAN', N'NAWANSHAHR', N'PUNJAB', N'India', N'144517', CAST(9464086663 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'saini.onkar10@gmail.com', N'D', N'', CAST(0x0000AD6400C34CEB AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1862', N'O-02807', N'Current', N'I.H.T. 19', N'THAPER COLONEY', N'JCT MILL PHAGWARA.', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9464086663 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'onkarsaini@jctltd.com', N'D', N'', CAST(0x0000AD6400C34CEB AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1383', N'S-13844', N'Permanent', N'KHOTHRAN ROAD, NEAR AMAN PUBLIC SCHOOL, STREET NO 4B', N'', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9023674293 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'4052', N'', N'sunilkumar@JctLtd.com', N'A', N'9000000600', CAST(0x0000AD6400C4E44F AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1383', N'S-13844', N'Current', N'KHOTHRAN ROAD, NEAR AMAN PUBLIC SCHOOL, STREET NO 4B', N'', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9023674293 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'4052', N'', N'sunilkumar@JctLtd.com', N'A', N'9000000600', CAST(0x0000AD6400C4E44F AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2194', N'B-00342', N'Permanent', N'C27 THAPAR COLONY', N'JCT MILL', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9653178133 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1548', N'', N'bibhutisharma@JctLtd.com', N'A', N'9000000254', CAST(0x0000AD6400C6C986 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2194', N'B-00342', N'Current', N'C27 THAPAR COLONY', N'JCT MILL', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9653178133 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1548', N'', N'bibhutisharma@JctLtd.com', N'A', N'9000000254', CAST(0x0000AD6400C6C986 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2917', N'A-00211', N'Permanent', N'115/4 SITE NO-1', N'KIDWAI NAGAR', N'KANPUR', N'KANPUR', N'UTTAR PRADESH', N'India', N'208011', CAST(7696636165 AS Numeric(10, 0)), CAST(9041669975 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000483', CAST(0x0000AD6400DEBA43 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2917', N'A-00211', N'Current', N'IHMS-66', N'JCT COLONY', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144404', CAST(7696636165 AS Numeric(10, 0)), CAST(9041669975 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000483', CAST(0x0000AD6400DEBA43 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2949', N'V-04343', N'Permanent', N'22- SHASTRI NAGAR, ', N'STREET NO. 1,', N'MAJITHA ROAD', N'AMRITSAR', N'PUNJAB', N'India', N'143001', CAST(8427779598 AS Numeric(10, 0)), CAST(9417347389 AS Numeric(10, 0)), N'', N'', N'mailme.vishalg@gmail.com', N'A', N'9000000505', CAST(0x0000AD640106364B AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2949', N'V-04343', N'Current', N'IHS- 57', N'THAPAR COLONY', N'JCT LIMITED', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8427779598 AS Numeric(10, 0)), CAST(9417347389 AS Numeric(10, 0)), N'', N'', N'Airjetwvg@JctLtd.com', N'A', N'9000000505', CAST(0x0000AD640106364B AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2841', N'J-01844', N'Permanent', N'VPO  DHARAM KOT RANDHAWA', N'TEH. DERA BABA NANAK', N'DISTRICT GURDASPUR', N'GURDASPUR', N'PUNJAB', N'India', N'143604', CAST(9417347389 AS Numeric(10, 0)), CAST(7973018312 AS Numeric(10, 0)), N'', N'', N'Jatinder75sharma@yahoo.com', N'A', N'9000000468', CAST(0x0000AD64010662A4 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2841', N'J-01844', N'Current', N'C-25    THAPAR CALONY', N'JCT LIMITED', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9417347389 AS Numeric(10, 0)), CAST(7973018312 AS Numeric(10, 0)), N'', N'', N'jatinder75sharmayah@JctLtd.com', N'A', N'9000000468', CAST(0x0000AD64010662A4 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2541', N'M-02550', N'Permanent', N'VILLAGE -SARAIBIMSEN', N'POST- MANDHATA', N'DISTT- PRATAPGARH', N'ALLAHABAD', N'UTTAR PRADESH', N'India', N'230402', CAST(9878257250 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'MOTILAL1744@GMAIL.COM', N'A', N'9000000388', CAST(0x0000AD64010A6B69 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2541', N'M-02550', N'Current', N'ROOM NO. IHS-5', N'JCT MILL THAPER COLONY', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9878257250 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'prdn@JctLtd.com', N'A', N'9000000388', CAST(0x0000AD64010A6B69 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8049', N'28049', N'Permanent', N'D72 , THAPAR CLOLONY', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146024', CAST(9501684994 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'kumar_harish@JctLtd.com', N'A', N'9000000073', CAST(0x0000AD64010DB45D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8049', N'28049', N'Current', N'D72 , THAPAR CLOLONY', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146024', CAST(9501684994 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'kumar_harish@JctLtd.com', N'A', N'9000000073', CAST(0x0000AD64010DB45D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8204', N'28204', N'Permanent', N'H.NO.  812/2', N'STREET MAI BHAGO KI', N'AMRITSAR ROAD', N'MOGA', N'PUNJAB', N'India', N'142001', CAST(9876351256 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000124', CAST(0x0000AD64011159D6 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8204', N'28204', N'Current', N'B01 , THAPAR CLOLONY', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146024', CAST(9876351256 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'parveen_sharma@JctLtd.com', N'A', N'9000000124', CAST(0x0000AD64011159D6 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2715', N'H-01436', N'Permanent', N'HOUSE NO PH52B0526, NEW COLONY', N'GOBINDPURA, NEAR GURUDWARA,', N'SHRI GOBIND DASS JI', N'PHAGWARA', N'PUNJAB', N'India', N'1444401', CAST(9878885833 AS Numeric(10, 0)), CAST(9592885833 AS Numeric(10, 0)), N'01824521626', N'', N'hitesh@jctltd.com', N'A', N'9000000432', CAST(0x0000AD64011B915E AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2715', N'H-01436', N'Current', N'HOUSE NO PH52B0526, NEW COLONY', N'GOBINDPURA, NEAR GURUDWARA,', N'SHRI GOBIND DASS JI', N'PHAGWARA', N'PUNJAB', N'India', N'1444401', CAST(9878885833 AS Numeric(10, 0)), CAST(9592885833 AS Numeric(10, 0)), N'01824521626', N'', N'hitesh@jctltd.com', N'A', N'9000000432', CAST(0x0000AD64011B915E AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'3211', N'MUM-N02', N'Permanent', N'A1, SAI NIWAS ', N'SAIBABA COMPLEX ', N'MOHAN GOKHALE ROAD', N'MUMBAI', N'MAHARASHTRA', N'India', N'400063', CAST(9819189745 AS Numeric(10, 0)), CAST(9920239971 AS Numeric(10, 0)), N'', N'', N'NALINI@jctltd.com', N'A', N'9000000722', CAST(0x0000AD64012CEFD9 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'3211', N'MUM-N02', N'Current', N'A1, SAI NIWAS ', N'SAIBABA COMPLEX ', N'MOHAN GOKHALE ROAD', N'MUMBAI', N'MAHARASHTRA', N'India', N'400063', CAST(9819189745 AS Numeric(10, 0)), CAST(9920239971 AS Numeric(10, 0)), N'', N'', N'NALINI@jctltd.com', N'A', N'9000000722', CAST(0x0000AD64012CEFD9 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1299', N'K-02107', N'Permanent', N'STREET NO. 4-D, KHALSA ENCALVE', N'SABZI MANDI ROAD', N'IN FRONT OF SUVIDHA CENTRE', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9815744095 AS Numeric(10, 0)), CAST(9888263444 AS Numeric(10, 0)), N'01824304018', N'', N'kamal@JctLtd.com', N'A', N'9000000287', CAST(0x0000AD64012DED02 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1299', N'K-02107', N'Current', N'STREET NO. 4-D, KHALSA ENCALVE', N'SABZI MANDI ROAD', N'IN FRONT OF SUVIDHA CENTRE', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9815744095 AS Numeric(10, 0)), CAST(9888263444 AS Numeric(10, 0)), N'01824304018', N'', N'kamal@JctLtd.com', N'A', N'9000000287', CAST(0x0000AD64012DED02 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1430', N'R-03584', N'Permanent', N'H.NO 261 ', N'GREATER KALISH ', N'G.T. ROAD PHAGWARA ', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9876870777 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'rajan@JctLtd.com', N'A', N'9000000334', CAST(0x0000AD6500A13C61 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1430', N'R-03584', N'Current', N'H.NO 261 ', N'GREATER KALISH ', N'G.T. ROAD PHAGWARA ', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9876870777 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'rajan@JctLtd.com', N'A', N'9000000334', CAST(0x0000AD6500A13C61 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2876', N'V-04338', N'Permanent', N'SAHEED BHAGAT SINGH EXT-2 COLONY', N'V.P.O KHOTHRAN, TEH BANGA', N' ', N'PHAGWARA', N'PUNJAB', N'India', N'144632', CAST(6284039094 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1568', N'', N'vinodkumar@JctLtd.com', N'A', N'9000000476', CAST(0x0000AD6500AF5DC0 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2876', N'V-04338', N'Current', N'SAHEED BHAGAT SINGH EXT-2', N'V.P.O KHOTHRAN, TEH BANGA', N' ', N'PHAGWARA', N'PUNJAB', N'India', N'144632', CAST(6284039094 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1568', N'', N'vinodkumar@JctLtd.com', N'A', N'9000000476', CAST(0x0000AD6500AF5DC0 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8011', N'28011', N'Permanent', N'V.P.O. MUNAK KALAN, ', N'TEH.DASUYA', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(9915276649 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'arshpreet_singh@JctLtd.com', N'A', N'9000000056', CAST(0x0000AD6500AFD32D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1482', N'R-03666', N'Permanent', N'#6/4, NEW MANSA DEVI NAGAR, ', N'SATNAMPURA', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9915003585 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000963', CAST(0x0000AD6300D727F1 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1482', N'R-03666', N'Current', N'#6/4, NEW MANSA DEVI NAGAR, ', N'SATNAMPURA', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9915003585 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000963', CAST(0x0000AD6300D727F1 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2577', N'S-13766', N'Permanent', N'H. NO. 86,', N'GOVT. LABOUR COLONY, ', N'OPP. JCT LTD. ', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9417632847 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01824304122', N'', N'sdsharma86@gmail.com', N'A', N'9000000492', CAST(0x0000AD6300D7D252 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2577', N'S-13766', N'Current', N'H. NO. 86,', N'GOVT. LABOUR COLONY, ', N'OPP. JCT LTD. ', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9417632847 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01824304122', N'', N'sdsharma86@gmail.com', N'A', N'9000000492', CAST(0x0000AD6300D7D252 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1424', N'R-03644', N'Permanent', N'H.NO19', N'URBAN ESTATE', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8725001550 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01824524005', N'', N'rajeshkapoor@JctLtd.com', N'A', N'9000000395', CAST(0x0000AD6300D7EE22 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1424', N'R-03644', N'Current', N'H.NO19', N'URBAN ESTATE', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8725001550 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01824524005', N'', N'rajeshkapoor@JctLtd.com', N'A', N'9000000395', CAST(0x0000AD6300D7EE22 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1641', N'D-00770', N'Permanent', N'227-G M.M.S COLONY, BIRRING', N'NEAR SAMRAT HEALTH CLUB', N'JALANDHAR CANTT', N'JALANDHAR CANTT.', N'PUNJAB', N'India', N'144005', CAST(9417654678 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000669', CAST(0x0000AD6300D807B2 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8705', N'28705', N'Permanent', N'SAHA ALAM MONDAL', N'VILL- AVIRAMPUR, PO- JOLKUL', N'DIST-HOOGHLY', N'CHINSURA', N'WEST BENGAL', N'India', N'712303', CAST(7574815005 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sam@JctLtd.com', N'A', N'9000001325', CAST(0x0000AD6300D9EEB8 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8705', N'28705', N'Current', N'A-5 THAPAR COLONY VPO CHOHAL', N'DHARMASHALA ROAD', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146024', CAST(7574815005 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sam@jctltd.com', N'A', N'9000001325', CAST(0x0000AD6300D9EEB8 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8548', N'28548', N'Permanent', N'H.NO.372. URBAN ESTATE,PHASE-1', N'JALANDHAR CITY', N'', N'JALANDHAR', N'PUNJAB', N'India', N'144022', CAST(9872667882 AS Numeric(10, 0)), CAST(9779151235 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000360', CAST(0x0000AD6300DC2190 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8548', N'28548', N'Current', N'H.NO.372. URBAN ESTATE,PHASE-1', N'JALANDHAR CITY', N'', N'JALANDHAR', N'PUNJAB', N'India', N'144022', CAST(9872667882 AS Numeric(10, 0)), CAST(9779151235 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000360', CAST(0x0000AD6300DC2190 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'3206', N'K-02171', N'Permanent', N'HOUSE NO 509', N'ELDECO GREENS', N'NAKODAR ROAD', N'JALANDHAR', N'PUNJAB', N'India', N'144026', CAST(9872983912 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000001105', CAST(0x0000AD6300E0FDA9 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'3206', N'K-02171', N'Current', N'HOUSE NO 509', N'ELDECO GREENS', N'NAKODAR ROAD', N'JALANDHAR', N'PUNJAB', N'India', N'144026', CAST(9872983912 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000001105', CAST(0x0000AD6300E0FDA9 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1473', N'P-03113', N'Permanent', N'HOUSE NO. 151', N'OHRIAN STREET', N'KATEHRA BAZAR', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9878589258 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01824521523', N'', N'parveen@jctltd.com', N'A', N'9000000731', CAST(0x0000AD6300E51D0A AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1473', N'P-03113', N'Current', N'HOUSE NO. 151', N'OHRIAN STREET', N'KATEHRA BAZAR', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9878589258 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01824521523', N'', N'parveen@jctltd.com', N'A', N'9000000731', CAST(0x0000AD6300E51D0A AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1620', N'S-13855', N'Permanent', N'SATWINDER SINGH', N'V.P.O -PALAHI', N'VIA-PHAGWARA ', N'PHAGWARA', N'PUNJAB', N'India', N'144402', CAST(9988088377 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1483', N'', N'satwindersingh@JctLtd.com', N'A', N'9000000636', CAST(0x0000AD6300E7A95A AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1620', N'S-13855', N'Current', N'SATWINDER SINGH', N'V.P.O -PALAHI', N'VIA-PHAGWARA ', N'PHAGWARA', N'PUNJAB', N'India', N'144402', CAST(9988088377 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1483', N'', N'satwindersingh@JctLtd.com', N'A', N'9000000636', CAST(0x0000AD6300E7A95A AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'7092', N'27092', N'Permanent', N'H.NO. 16/254, 2ND FLOOR,', N'NEW MOTI NAGAR', N'NEW DELHI', N'DELHI', N'DELHI', N'India', N'110015', CAST(9818209440 AS Numeric(10, 0)), CAST(9810752662 AS Numeric(10, 0)), N'', N'', N'rajeshkumar@jctltd.com', N'A', N'9000000359', CAST(0x0000AD6300ECCA3D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'7092', N'27092', N'Current', N'H.NO. 16/254, 2ND FLOOR,', N'NEW MOTI NAGAR', N'NEW DELHI', N'DELHI', N'DELHI', N'India', N'110015', CAST(9818209440 AS Numeric(10, 0)), CAST(9810752662 AS Numeric(10, 0)), N'', N'', N'rajeshkumar@jctltd.com', N'A', N'9000000359', CAST(0x0000AD6300ECCA3D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2785', N'A-00098', N'Permanent', N'C/O JEET RAM SHARMA BEHIND', N'BEHIND DELUXE FURNITURE HOUSE ', N'MANAV NARAGR HADIABAD', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9855404659 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1626', N'', N'ashish@JctLtd.com', N'A', N'9000000593', CAST(0x0000AD6300F1C835 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2785', N'A-00098', N'Current', N'C/O JEET RAM SHARMA BEHIND', N'BEHIND DELUXE FURNITURE HOUSE ', N'MANAV NARAGR HADIABAD', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9855404659 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1626', N'', N'ashish@JctLtd.com', N'A', N'9000000593', CAST(0x0000AD6300F1C835 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2982', N'H-01543', N'Permanent', N'186-A, PARAS ESTATE', N'LEATHER COMPLEX ROAD', N'BASTI PEERDAD', N'JALANDHAR', N'PUNJAB', N'India', N'144002', CAST(9888949627 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'harshsoni@jctltd.com', N'A', N'9000000453', CAST(0x0000AD6300F1D323 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2982', N'H-01543', N'Current', N'186-A, PARAS ESTATE', N'LEATHER COMPLEX ROAD', N'BASTI PEERDAD', N'JALANDHAR', N'PUNJAB', N'India', N'144002', CAST(9888949627 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'harshsoni@jctltd.com', N'A', N'9000000453', CAST(0x0000AD6300F1D323 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1648', N'G-01351', N'Permanent', N'HNO 413 , BISHAMBER NAGAR ', N'WARD NO - 22 , NEAR BUS STAND ', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(8146698520 AS Numeric(10, 0)), CAST(6280272561 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000443', CAST(0x0000AD6300F35079 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1648', N'G-01351', N'Current', N'HNO 413 , BISHAMBER NAGAR ', N'WARD NO - 22 , NEAR BUS STAND ', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(8146698520 AS Numeric(10, 0)), CAST(6280272561 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000443', CAST(0x0000AD6300F35079 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2865', N'A-00110', N'Permanent', N'VILLAGE FRANCI', N'DISTT HISAR', N'', N'HISAR', N'HARYANA', N'India', N'125052', CAST(969850892 AS Numeric(10, 0)), CAST(9877455519 AS Numeric(10, 0)), N'', N'', N'Anilkajla_04@yahoo.com', N'A', N'9000000528', CAST(0x0000AD6400712323 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2865', N'A-00110', N'Current', N'IHS 91', N'THAPER COLONY', N'JCT MILL', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9569850892 AS Numeric(10, 0)), CAST(9877455519 AS Numeric(10, 0)), N'', N'', N'Anilkajla_04@yahoo.com', N'A', N'9000000528', CAST(0x0000AD6400712323 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8011', N'28011', N'Current', N'V.P.O. MUNAK KALAN, ', N'TEH.DASUYA', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(9915276649 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'arshpreet_singh@JctLtd.com', N'A', N'9000000056', CAST(0x0000AD6500AFD332 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1394', N'S-03659', N'Permanent', N'C-6,THAPAR COLONY', N'G.T.ROAD', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9888539055 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1509', N'', N'skj@jctltd.com', N'A', N'9000000342', CAST(0x0000AD6500B01055 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1394', N'S-03659', N'Current', N'C-6, THAPAR COLONY', N'G.T.ROAD', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9888539055 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'skj@jctltd.com', N'A', N'9000000342', CAST(0x0000AD6500B01055 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2481', N'S-13753', N'Permanent', N'HOUSE NO. 2337,', N'GALI NO. 2, DHARAMPURA, ', N'NEAR JAURA FATAK, AMRITSAR ', N'AMRITSAR', N'PUNJAB', N'India', N'143001', CAST(9814445809 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000367', CAST(0x0000AD6500B08C50 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2481', N'S-13753', N'Current', N'OLD C 12', N'THAPAR COLONY ', N'G.T.ROAD,  PHAGWARA', N'KAPURTHALA', N'PUNJAB', N'India', N'144401', CAST(9814445809 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sundeepw@jctltd.com', N'A', N'9000000367', CAST(0x0000AD6500B08C50 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1641', N'D-00770', N'Current', N'227-G M.M.S COLONY, BIRRING', N'NEAR SAMRAT HEALTH CLUB', N'JALANDHAR CANTT', N'JALANDHAR CANTT.', N'PUNJAB', N'India', N'144005', CAST(9417654678 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000669', CAST(0x0000AD6300D807B2 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1648', N'G-01351', N'Permanent', N'HNO 413 , BISHAMBER NAGAR , ', N'NEAR BUS STAND ', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(8146698520 AS Numeric(10, 0)), CAST(6280272561 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000806', CAST(0x0000AD6300E08EA4 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1648', N'G-01351', N'Current', N'HNO 413 , BISHAMBER NAGAR , ', N'NEAR BUS STAND ', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(8146698520 AS Numeric(10, 0)), CAST(6280272561 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000806', CAST(0x0000AD6300E08EA4 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'3204', N'R-03648', N'Permanent', N'B-III/153, NAI ABADI', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(9872670496 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sood_rk@jctltd.com', N'A', N'9000000221', CAST(0x0000AD6300ED16D5 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'3204', N'R-03648', N'Current', N'B-III/153, NAI ABADI', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(9872670496 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sood_rk@jctltd.com', N'A', N'9000000221', CAST(0x0000AD6300ED16D5 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1439', N'S-03794', N'Permanent', N'SUPER C-40 THAPAR COLONY', N'JCT LIMTED', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9888195898 AS Numeric(10, 0)), CAST(7888647421 AS Numeric(10, 0)), N'01824521522', N'', N'sewasingh@jctltd.com', N'A', N'9000000094', CAST(0x0000AD6300ED6A96 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1439', N'S-03794', N'Current', N'SUPER C-40 THAPAR COLONY', N'JCT LIMTED', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9888195898 AS Numeric(10, 0)), CAST(7888647421 AS Numeric(10, 0)), N'01824521522', N'', N'sewasingh@jctltd.com', N'A', N'9000000094', CAST(0x0000AD6300ED6A9B AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8048', N'28048', N'Permanent', N'VILL- KAPAHAT, PO- MUSTAPUR, D', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146026', CAST(9465955057 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'2185', N'', N'workattend@JctLtd.com', N'A', N'9000000072', CAST(0x0000AD6300EF5AE9 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8048', N'28048', N'Current', N'VILL- KAPAHAT, PO- MUSTAPUR, D', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146026', CAST(9465955057 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'2185', N'', N'workattend@JctLtd.com', N'A', N'9000000072', CAST(0x0000AD6300EF5AE9 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1325', N'A-00245', N'Permanent', N'B-34, 7104 ', N'DURGA PURI HAIBOWAL KALAN', N'LUDHIANA', N'LUDHIANA', N'PUNJAB', N'India', N'141001', CAST(9888130201 AS Numeric(10, 0)), CAST(7743007053 AS Numeric(10, 0)), N'', N'', N'amandeepk@jctltd.com', N'A', N'9000000593', CAST(0x0000AD6300F1BB5A AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1325', N'A-00245', N'Current', N'B-34, 7104 ', N'DURGA PURI HAIBOWAL KALAN', N'LUDHIANA', N'LUDHIANA', N'PUNJAB', N'India', N'141001', CAST(9888130201 AS Numeric(10, 0)), CAST(7743007053 AS Numeric(10, 0)), N'', N'', N'amandeepk@jctltd.com', N'A', N'9000000593', CAST(0x0000AD6300F1BB5A AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1545', N'P-03163', N'Permanent', N'NEW GOVINDPURA COLONY', N'', N'', N'PHAGWARA', N'PUNJAB', N'India', N'1444001', CAST(9501173189 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'poonamsingh@jctltd.com', N'A', N'9000000453', CAST(0x0000AD6300F2616D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1545', N'P-03163', N'Current', N'NEW GOVINDPURA COLONY', N'', N'', N'PHAGWARA', N'PUNJAB', N'India', N'1444001', CAST(9501173189 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'poonamsingh@jctltd.com', N'A', N'9000000453', CAST(0x0000AD6300F2616D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2718', N'R-03339', N'Permanent', N'HOUSE NO 2331', N'SECTOR 38 C', N'', N'CHANDIGARH', N'CHANDIGARH', N'India', N'160036', CAST(9878649707 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000507', CAST(0x0000AD6300F3D31E AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2718', N'R-03339', N'Current', N'HOUSE NO 278', N'GREATER KAILASH', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9878649707 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'RBaksshi@jctltd.com', N'A', N'9000000507', CAST(0x0000AD6300F3D31E AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1421', N'S-13866', N'Permanent', N'VILLAGE DESHAN', N'P.O. KODHARA', N'TEHSIL BARSAR, DISTT. HAMIRPUR', N'HAMIRPUR', N'HIMACHAL PRADESH', N'India', N'174311', CAST(9872931781 AS Numeric(10, 0)), CAST(9872931293 AS Numeric(10, 0)), N'', N'', N'SHIVRAJ@JCTLTD.COM', N'A', N'9000001325', CAST(0x0000AD6300F793DF AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1421', N'S-13866', N'Current', N'IHMS-111', N'THAPAR COLONY', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9872931781 AS Numeric(10, 0)), CAST(9872931293 AS Numeric(10, 0)), N'01824521473', N'', N'shivraj@jctltd.com', N'A', N'9000001325', CAST(0x0000AD6300F793DF AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8054', N'28054', N'Permanent', N'# 24, HOSHIARPUR ENCLAVE,', N'KAKKON, HOSIARPUR', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(9815990242 AS Numeric(10, 0)), CAST(7814261380 AS Numeric(10, 0)), N'', N'', N'satwant_patyal@JctLtd.com', N'A', N'9000000077', CAST(0x0000AD6500B0C8BC AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8054', N'28054', N'Current', N'# 24, HOSHIARPUR ENCLAVE,', N'KAKKON, HOSIARPUR', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(9815990242 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'satwant_patyal@JctLtd.com', N'A', N'9000000077', CAST(0x0000AD6500B0C8BC AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2946', N'S-13814', N'Permanent', N'VILLAGE-BANSARA', N'POST-PACHADHI', N'DISTRICT-DARBHANGA', N'DARBHANGA', N'BIHAR', N'India', N'847337', CAST(8699509784 AS Numeric(10, 0)), CAST(7889141283 AS Numeric(10, 0)), N'', N'', N'sunil.mishra711@gmail.com', N'A', N'9000000492', CAST(0x0000AD6500B11B84 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2946', N'S-13814', N'Current', N'THAPAR COLONY', N'JCT MILL LIMITED', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8699509784 AS Numeric(10, 0)), CAST(7889141283 AS Numeric(10, 0)), N'', N'', N'sunilmishra@jctltd.com', N'A', N'9000000492', CAST(0x0000AD6500B11B84 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2685', N'S-13883', N'Permanent', N'VILL- KHOTHRAN', N'NEAR VODAFONE TOWET,SBS NAGAR', N'DISTT.- NAWANSHAHR', N'PHAGWARA', N'PUNJAB', N'India', N'144632', CAST(9501395135 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1606', N'', N'SUMAN@JCTLTD.COM', N'A', N'9000001160', CAST(0x0000AD6500B17C2D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2685', N'S-13883', N'Current', N'VILL- KHOTHRAN', N'NEAR VODAFONE TOWER, SBS NAGAR', N'DIST.- NAWANSHAHR', N'PHAGWARA', N'PUNJAB', N'India', N'144632', CAST(9501395135 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1606', N'', N'suman@jctltd.com', N'A', N'9000001160', CAST(0x0000AD6500B17C2D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2995', N'A-00221', N'Permanent', N'249, URBAN ESTATE', N'NEAR SHIV MANDIR', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8283815042 AS Numeric(10, 0)), CAST(9464544306 AS Numeric(10, 0)), N'', N'', N'AshishVinayak@jctltd.com', N'A', N'9000000513', CAST(0x0000AD6500B26FA3 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2995', N'A-00221', N'Current', N'249, URBAN ESTATE', N'NEAR SHIV MANDIR', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8283815042 AS Numeric(10, 0)), CAST(9464544306 AS Numeric(10, 0)), N'', N'', N'AshishVinayak@jctltd.com', N'A', N'9000000513', CAST(0x0000AD6500B26FA3 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8057', N'28057', N'Permanent', N'E-191 MURLIPURA SCHEME', N'', N'', N'JAIPUR', N'RAJASTHAN', N'India', N'14', CAST(8427764433 AS Numeric(10, 0)), CAST(8427764433 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000078', CAST(0x0000AD6500B2C66D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8057', N'28057', N'Current', N'A14 , THAPAR CLOLONY', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146024', CAST(8427764433 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'skkejriwal@jctltd.com', N'A', N'9000000078', CAST(0x0000AD6500B2C672 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'H067', N'DHO-P01', N'Permanent', N'KHASRA NO 97/20 BLOCK -F', N'GALI NO 11 TOMAR COLONY', N'BURARI', N'DELHI', N'DELHI', N'India', N'110084', CAST(9868971511 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'puransingh@jctltd.com', N'A', N'9000000017', CAST(0x0000AD6500B3CA0D AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'H067', N'DHO-P01', N'Current', N'KHASRA NO 97/20 BLOCK -F', N'GALI NO 11 TOMAR COLONY', N'BURARI', N'DELHI', N'DELHI', N'India', N'110084', CAST(9868971511 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'puransingh@jctltd.com', N'A', N'9000000017', CAST(0x0000AD6500B3CA0D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2965', N'J-01849', N'Permanent', N'VPO VIRK', N'PATTI YADHPUR', N'TEHSIL PHILLAUR, DISTRICT JALANDHAR', N'PHAGWARA', N'PUNJAB', N'India', N'144632', CAST(8283055662 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'JAGDEEPSAINI1983@GMAIL.COM', N'A', N'9000000497', CAST(0x0000AD6500B5752F AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2965', N'J-01849', N'Current', N'VPO VIRK', N'PATTI YADHPUR', N'TEHSIL PHILLAUR, DISTRICT JALANDHAR', N'PHAGWARA', N'PUNJAB', N'India', N'144632', CAST(8283055662 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'JAGDEEPSAINI1983@GMAIL.COM', N'A', N'9000000497', CAST(0x0000AD6500B57533 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1540', N'D-00614', N'Permanent', N'B-12', N'THAPAR COLONY', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9876015139 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1599', N'', N'dineshk@JctLtd.com', N'A', N'9000000259', CAST(0x0000AD6500B66CC2 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1540', N'D-00614', N'Current', N'B-12', N'THAPAR COLONY', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9876015139 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1599', N'', N'dineshk@JctLtd.com', N'A', N'9000000259', CAST(0x0000AD6500B66CC2 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1646', N'M-02477', N'Permanent', N'H.NO.8, DIDDIAN MOHALA, HADIABAD', N'PHAGWARA', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144402', CAST(9646615926 AS Numeric(10, 0)), CAST(7888691884 AS Numeric(10, 0)), N'4016', N'', N'maheshbhatia@JctLtd.com', N'A', N'9000001186', CAST(0x0000AD6500B6A7E2 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1646', N'M-02477', N'Current', N'H.NO.8, DIDDIAN MOHALA, HADIABAD', N'PHAGWARA', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144402', CAST(9646615926 AS Numeric(10, 0)), CAST(7888691884 AS Numeric(10, 0)), N'4016', N'', N'maheshbhatia@JctLtd.com', N'A', N'9000001186', CAST(0x0000AD6500B6A7E2 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1279', N'D-00666', N'Permanent', N'H.NO.- 207, NEAR BAULI SAHIB GURUDWARA,', N'MOH. SANDHIRAN, HADIABAD', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144402', CAST(9041991234 AS Numeric(10, 0)), CAST(7009672217 AS Numeric(10, 0)), N'', N'', N'VNKAUSHIK18@YAHOO.COM', N'A', N'9000000679', CAST(0x0000AD6500B7C630 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1279', N'D-00666', N'Current', N'H.NO.- 207, NEAR BAULI SAHIB GURUDWARA,', N'MOH. SANDHIRAN, HADIABAD', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144402', CAST(9041991234 AS Numeric(10, 0)), CAST(7009672217 AS Numeric(10, 0)), N'', N'', N'VNKAUSHIK18@YAHOO.COM', N'A', N'9000000679', CAST(0x0000AD6500B7C630 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1448', N'S-13856', N'Permanent', N'ONKAR NAGAR', N'STREET NO.9', N'KHOTHRAN ROAD', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8699309776 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sandeepyadav@jctltd.com', N'A', N'9000000627', CAST(0x0000AD6500B803C0 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1448', N'S-13856', N'Current', N'ONKAR NAGAR', N'STREET NO.9', N'KHOTHRAN ROAD', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8699309776 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sandeepyadav@jctltd.com', N'A', N'9000000627', CAST(0x0000AD6500B803C0 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2983', N'A-00217', N'Permanent', N'GALI NO.3C', N'ONKAR NAGAR, ', N'KHOTHARAN ROAD', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9463670589 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'ashutoshtiwari@jctltd.com', N'A', N'9000000510', CAST(0x0000AD6500BEA7A5 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2983', N'A-00217', N'Current', N'GALI NO.3C', N'ONKAR NAGAR, ', N'KHOTHARAN ROAD', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9463670589 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'ashutoshtiwari@jctltd.com', N'A', N'9000000510', CAST(0x0000AD6500BEA7A5 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2709', N'V-04241', N'Permanent', N'VPO VIRK', N'PATTI MAALO VIRK, DIST. JALANDHAR', N'TEHSILE PHILLAUR', N'PHILLAUR', N'PUNJAB', N'India', N'144632', CAST(9646775432 AS Numeric(10, 0)), CAST(7528909955 AS Numeric(10, 0)), N'', N'', N'vijayk@jctltd.com', N'A', N'9000000427', CAST(0x0000AD6500BF89BF AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2709', N'V-04241', N'Current', N'VPO VIRK', N'PATTI MAALO VIRK, DIST. JALANDHAR', N'TEHSILE PHILLAUR', N'PHILLAUR', N'PUNJAB', N'India', N'144632', CAST(9646775432 AS Numeric(10, 0)), CAST(7528909955 AS Numeric(10, 0)), N'', N'', N'vijayk@jctltd.com', N'A', N'9000000427', CAST(0x0000AD6500BF89BF AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8397', N'28397', N'Permanent', N'63, DURGA COLONY', N'BESIDE HMV COLLEGE', N'JALNADHAR CITY', N'JALANDHAR', N'PUNJAB', N'India', N'144008', CAST(9779885526 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000178', CAST(0x0000AD6500BF9D0B AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8397', N'28397', N'Current', N'A18 , THAPAR CLOLONY', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146024', CAST(9779885526 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01882258780', N'', N'sunil_sharma@JctLtd.com', N'A', N'9000000178', CAST(0x0000AD6500BF9D0B AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1649', N'V-04358', N'Permanent', N'H. NO: 12,  ', N'DEE ESS ESTATE,', N'DHAKOLI', N'ZIRAKPUR', N'PUNJAB', N'India', N'140603', CAST(7743008791 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'jaitelyvivek@gmail.com', N'A', N'9000001248', CAST(0x0000AD6500C02C99 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1649', N'V-04358', N'Current', N'H. NO: 173', N'GREATER KAILASH SOCIETY', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(7743008791 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'vivekj@jctltd.com', N'A', N'9000001248', CAST(0x0000AD6500C02C99 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1586', N'V-04347', N'Permanent', N'HOUSE NO 70', N'GREATER KAILASH COLONY', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9876028282 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1527', N'', N'vishaltandon@jctltd.com', N'A', N'9000000547', CAST(0x0000AD6500C1B837 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1586', N'V-04347', N'Current', N'HOUSE NO 70, ', N'GREATER KAILASH COLONY', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9876028282 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1527', N'', N'vishaltandon@jctltd.com', N'A', N'9000000547', CAST(0x0000AD6500C1B837 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1178', N'D-00622', N'Permanent', N'GI APTS ONKAR NAGAR,PHAGWARA', N'GI APTS ONKAR NAGAR,PHAGWARA', N'GI APTS ONKAR NAGAR,PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'1444401', CAST(8872175699 AS Numeric(10, 0)), CAST(7347042455 AS Numeric(10, 0)), N'8872175699', N'', N'deepak31327@gmail.com', N'A', N'9000000260', CAST(0x0000AD6500C248A2 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1178', N'D-00622', N'Current', N'GI APTS ONKAR NAGAR,PHAGWARA', N'GI APTS ONKAR NAGAR,PHAGWARA', N'GI APTS ONKAR NAGAR,PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8872175699 AS Numeric(10, 0)), CAST(7347042455 AS Numeric(10, 0)), N'8872175699', N'', N'Sulzer@jctltd.com', N'A', N'9000000260', CAST(0x0000AD6500C248A6 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1570', N'L-02208', N'Permanent', N'I.H.T.22, THAPER COLONY', N'', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9878949531 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'rd@jctltd.com', N'A', N'9000000292', CAST(0x0000AD6400FE8F02 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1570', N'L-02208', N'Current', N'I.H.T.22, THAPER COLONY', N'', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9878949531 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'rd@jctltd.com', N'A', N'9000000292', CAST(0x0000AD6400FE8F02 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1562', N'S-03674', N'Permanent', N'SUPER C-33, THAPAR COLONY', N'JCT LIMITED, PHAGWARA', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8847484830 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sanjayjain@jctltd.com', N'A', N'9000000343', CAST(0x0000AD6400FF90B1 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1562', N'S-03674', N'Current', N'SUPER C-33, THAPAR COLONY', N'JCT LIMITED, PHAGWARA', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8847484830 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sanjayjain@jctltd.com', N'A', N'9000000343', CAST(0x0000AD6400FF90B1 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1572', N'A-00034', N'Permanent', N'HOUSE NO:- 3/363,KALA KUWA HOUSING BOARD', N'ALWAR,RAJASTHAN (301001)', N'', N'ALWAR', N'RAJASTHAN', N'India', N'301001', CAST(9217771474 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'SHARMA.ASHOKBHARDWAJ@GMAIL.COM', N'A', N'9000000050', CAST(0x0000AD650090AC66 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1572', N'A-00034', N'Current', N'I.H.T-37,THAPAR COLONEY,', N'JCT MILL LTD.', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9217771474 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'qafabtestc@jctltd.com', N'A', N'9000000050', CAST(0x0000AD650090AC66 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8220', N'28220', N'Permanent', N'NAI ABADI , HOSHIARPUR', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(8054232217 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000129', CAST(0x0000AD6500943622 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8220', N'28220', N'Current', N'NAI ABADI , HOSHIARPUR', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(8054232217 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000129', CAST(0x0000AD6500943622 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'3208', N'DSO-S01', N'Permanent', N'A-155, POCKET-A,', N'MAYUR VIHAR, PHASE-2,', N'', N'DELHI', N'DELHI', N'India', N'110091', CAST(7982164743 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sanjaykhurana@jctltd.com', N'A', N'9000000727', CAST(0x0000AD6500BBC6F0 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'3208', N'DSO-S01', N'Current', N'A-155, POCKET-A,', N'MAYUR VIHAR, PHASE-2,', N'', N'DELHI', N'DELHI', N'India', N'110091', CAST(7982164743 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sanjaykhurana@jctltd.com', N'A', N'9000000727', CAST(0x0000AD6500BBC6F0 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1320', N'C-00415', N'Permanent', N'CHANDER MOHAN', N'VILLAGE KHAGNA,TEHSIL CHOPAL,', N'DISTT.SHIMLA.', N'SHIMLA', N'HIMACHAL PRADESH', N'India', N'171211', CAST(8284950641 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'cms668@yahoo.co.in', N'A', N'9000000586', CAST(0x0000AD6500BC659E AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1320', N'C-00415', N'Current', N'FLAT NO IHMS-75, THAPAR COLONY JCT LTD.', N'G.T.ROAD PHAGWARA.', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8284950641 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'chandermohan@jctltd.com', N'A', N'9000000586', CAST(0x0000AD6500BC659E AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1056', N'A-00234', N'Permanent', N'IHT 41', N'JCT MILL ', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8283839953 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'amitsharma@jctltd.com', N'A', N'9000000668', CAST(0x0000AD6500C26370 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1056', N'A-00234', N'Current', N'IHT 41', N'JCT MILL ', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8283839953 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'amitsharma@jctltd.com', N'A', N'9000000668', CAST(0x0000AD6500C26370 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1895', N'P-03143', N'Permanent', N'JAIN STREET', N'NEAR JAIN MANDIR', N'', N'SEOHARA', N'UTTAR PRADESH', N'India', N'246746', CAST(8923334449 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000315', CAST(0x0000AD6500C2E5CF AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1895', N'P-03143', N'Current', N'IHMS-113', N'THAPAR COLONY', N'G.T. ROAD, JCT MILLS', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8146612395 AS Numeric(10, 0)), CAST(9914290950 AS Numeric(10, 0)), N'01824521479', N'', N'Pushpraj@jctltd.com', N'A', N'9000000315', CAST(0x0000AD6500C2E5CF AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1292', N'S-13708', N'Permanent', N'1 GANESH NAGAR BASTI NAU', N'SAME', N'', N'JALANDHAR', N'PUNJAB', N'India', N'144401', CAST(8283820315 AS Numeric(10, 0)), CAST(9780032274 AS Numeric(10, 0)), N'', N'', N'SANJEEVKUNDRA@JCTLTD.COM', N'A', N'9000000360', CAST(0x0000AD6500C33518 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1292', N'S-13708', N'Current', N'1 GANESH NAGAR BASTI NAU', N'SAME', N'', N'JALANDHAR', N'PUNJAB', N'India', N'144401', CAST(8283820315 AS Numeric(10, 0)), CAST(9780032274 AS Numeric(10, 0)), N'', N'', N'SANJEEVKUNDRA@JCTLTD.COM', N'A', N'9000000360', CAST(0x0000AD6500C33518 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2520', N'A-00190', N'Permanent', N'NEW CHACHOKI COLONY WARD NO 33', N'NEAR PARBHAKAR MARBELS', N'PHAGWARA ', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9876025060 AS Numeric(10, 0)), CAST(7888801299 AS Numeric(10, 0)), N'', N'', N'whg@jctltd.com', N'A', N'9000000382', CAST(0x0000AD6500C44023 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2520', N'A-00190', N'Current', N'NEW CHACHOKI COLONY WARD NO 33', N'NEAR PARBHAKAR MARBELS', N'PHAGWARA ', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9876025060 AS Numeric(10, 0)), CAST(7888801299 AS Numeric(10, 0)), N'', N'', N'whg@jctltd.com', N'A', N'9000000382', CAST(0x0000AD6500C44023 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2991', N'A-00219', N'Permanent', N'GOBIND PURA. NEW COLONY NEAR GURDWARA PHAGWARA ', N'', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9041556954 AS Numeric(10, 0)), CAST(8847406393 AS Numeric(10, 0)), N'', N'', N'ajit_0687@yahoo.com', N'A', N'9000000511', CAST(0x0000AD6500C4B510 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2991', N'A-00219', N'Current', N'GOBIND PURA. NEW COLONY NEAR GURDWARA PHAGWARA ', N'', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9041556954 AS Numeric(10, 0)), CAST(8847406393 AS Numeric(10, 0)), N'', N'', N'ajit_0687@yahoo.com', N'A', N'9000000511', CAST(0x0000AD6500C4B510 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1333', N'M-02570', N'Permanent', N'NEW MODEL TOWN', N'BACK SIDE NEW COURT', N'NEAR MAYA TOWER', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(7888805048 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'manisapra@jctltd.com', N'A', N'9000000649', CAST(0x0000AD6500C5BB08 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1333', N'M-02570', N'Current', N'NEW MODEL TOWN', N'BACK SIDE NEW COURT', N'NEAR MAYA TOWER', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(7888805048 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'manisapra@jctltd.com', N'A', N'9000000649', CAST(0x0000AD6500C5BB08 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8520', N'28520', N'Permanent', N'AIKYA APARTMENT', N'FLAT NO.B1, 1ST FLOOR', N'22/9, BRINDABON MULLICK LANE, KADAMTALA', N'HOWRAH', N'WEST BENGAL', N'India', N'711101', CAST(8329041768 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'chattopadhyay.s@rediffmail.com', N'A', N'9000000832', CAST(0x0000AD6500C5EEBE AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8520', N'28520', N'Current', N'JCT THAPAR COLONY', N'FLAT NO. - A/17', N'DHARAMSALA ROAD', N'HOSHIARPUR', N'PUNJAB', N'India', N'146024', CAST(8329041768 AS Numeric(10, 0)), CAST(9855915949 AS Numeric(10, 0)), N'', N'', N'subhra_chattopadhyay@jctltd.com', N'A', N'9000000832', CAST(0x0000AD6500C5EEBE AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2686', N'N-02750', N'Permanent', N'VILL _SEEHOOPUR', N'POST ,_RAR', N'', N'KANPUR', N'UTTAR PRADESH', N'India', N'209206', CAST(8238810637 AS Numeric(10, 0)), CAST(9898261161 AS Numeric(10, 0)), N'', N'', N'neerajtex@yahoo.co.in', N'A', N'9000001225', CAST(0x0000AD6500C6C992 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2686', N'N-02750', N'Current', N'JCT MILL PHAGWARA', N'', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8238810637 AS Numeric(10, 0)), CAST(8238810637 AS Numeric(10, 0)), N'', N'', N'neerajtex@yahoo.co.in', N'A', N'9000001225', CAST(0x0000AD6500C6C992 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2646', N'V-04329', N'Permanent', N'H NO. 213 NEAR PANJ PEER ROAD', N'NEW GOLDEN AVENUE ', N'AMRITSAR', N'AMRITSAR', N'PUNJAB', N'India', N'143006', CAST(9815822774 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'vivsrm@yahoo.com', N'A', N'9000000417', CAST(0x0000AD6500C755C6 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2646', N'V-04329', N'Current', N'IHT-43, THAPAR COLONY, JCT MILL, PHAGWARA', N'', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9815822774 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'vivsrm@yahoo.com', N'A', N'9000000417', CAST(0x0000AD6500C755C6 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2572', N'S-13765', N'Permanent', N'VILLAGE-MAHNAULI', N'POST OFFICE-PANCHOV', N'DIST-DARBHANGA', N'DARBHANGA', N'BIHAR', N'India', N'846003', CAST(9888059901 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sanjeevmah1977@gmail.com', N'A', N'9000000396', CAST(0x0000AD6500C839FA AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2572', N'S-13765', N'Current', N'HOUSE NO.IHMS-110, THAPAR COLONY', N'JCT MILLS, PHAGWARA', N'DIS-KAPURTHALLA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9888059901 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sanjeevkumar@jctltd.com', N'A', N'9000000396', CAST(0x0000AD6500C839FA AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1435', N'S-13895', N'Permanent', N'HOUSE NO.8212/27/31', N'STREET NO.11/5', N'KABIR NAGAR', N'LUDHIANA', N'PUNJAB', N'India', N'141003', CAST(9888065358 AS Numeric(10, 0)), CAST(7009008021 AS Numeric(10, 0)), N'', N'', N'sunilku@jctltd.com', N'A', N'9000001313', CAST(0x0000AD6500C9F72F AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1435', N'S-13895', N'Current', N'HOUSE NO.8212/27/31', N'STREET NO.11/5', N'KABIR NAGAR', N'LUDHIANA', N'PUNJAB', N'India', N'141003', CAST(9888065358 AS Numeric(10, 0)), CAST(7009008021 AS Numeric(10, 0)), N'', N'', N'sunilku@jctltd.com', N'A', N'9000001313', CAST(0x0000AD6500C9F72F AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2181', N'R-03595', N'Permanent', N'BEDIAN MOHALLA', N'KHALWARA GATE', N'NEAR NIKKA LIGHT AND SOUND', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9888567163 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'rohitsaccher@jctltd.com', N'A', N'9000000337', CAST(0x0000AD6500CDF0E2 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2181', N'R-03595', N'Current', N'BEDIAN MOHALLA', N'KHALWARA GATE', N'NEAR NIKKA LIGHT AND SOUND', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9888567163 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'rohitsaccher@jctltd.com', N'A', N'9000000337', CAST(0x0000AD6500CDF0E2 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2940', N'N-02741', N'Permanent', N'H.NO 71, GALI NO 3', N'STAR CITY ', N'TIBBA ROAD', N'LUDHIANA', N'PUNJAB', N'India', N'141007', CAST(9914790128 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000496', CAST(0x0000AD6500D044BE AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2940', N'N-02741', N'Current', N'QTR NO IHMS 85', N'THAPAR COLONY', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144404', CAST(9914790128 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'napindersingh@jctltd.com', N'A', N'9000000496', CAST(0x0000AD6500D044BE AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1260', N'D-00761', N'Permanent', N'HOUSE NO.-82', N'VILL.-RASULPUR, POST/O- JHAROLI', N'DIST.- GURDASPUR', N'DINANAGAR', N'PUNJAB', N'India', N'143533', CAST(9872372402 AS Numeric(10, 0)), CAST(8427632453 AS Numeric(10, 0)), N'', N'', N'varun.salmotra@gmail.com', N'A', N'9000000567', CAST(0x0000AD6500D0AF46 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1260', N'D-00761', N'Current', N'OLD C-17,THAPAR CONONY', N'JCT MILL. (PHAGWARA)', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9872372402 AS Numeric(10, 0)), CAST(8427632453 AS Numeric(10, 0)), N'01824521627', N'', N'dineshsharma@JctLtd.com', N'A', N'9000000567', CAST(0x0000AD6500D0AF46 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1022', N'R-03454', N'Permanent', N'350 - R ', N'MODEL TOWN', N'JALANDHAR CITY', N'JALANDHAR', N'PUNJAB', N'India', N'144003', CAST(9876110350 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01812270673', N'', N'ramanjot@jctltd.com', N'A', N'9000000319', CAST(0x0000AD6500D1B49F AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1022', N'R-03454', N'Current', N'350 - R ', N'MODEL TOWN', N'JALANDHAR CITY', N'JALANDHAR', N'PUNJAB', N'India', N'144003', CAST(9876110350 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01812270673', N'', N'ramanjot@jctltd.com', N'A', N'9000000319', CAST(0x0000AD6500D1B49F AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1150', N'R-03620', N'Permanent', N'IHT 5 ', N'JCT MILL', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9855688518 AS Numeric(10, 0)), CAST(7009004583 AS Numeric(10, 0)), N'1586', N'', N'RAMANKUMAR@JCTLTD.COM', N'A', N'9000000558', CAST(0x0000AD6400D2CB68 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1150', N'R-03620', N'Current', N'IHT 5 ', N'JCT MILL', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9855688518 AS Numeric(10, 0)), CAST(7009004583 AS Numeric(10, 0)), N'1586', N'', N'RAMANKUMAR@JCTLTD.COM', N'A', N'9000000558', CAST(0x0000AD6400D2CB68 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1582', N'M-02566', N'Permanent', N'IHT 5 ', N'JCT MILL', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8360501990 AS Numeric(10, 0)), CAST(9855688518 AS Numeric(10, 0)), N'01824521483', N'', N'manisha@JctLtd.com', N'A', N'9000000550', CAST(0x0000AD6400D462F2 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1582', N'M-02566', N'Current', N'IHT 5 ', N'JCT MILL', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8360501990 AS Numeric(10, 0)), CAST(9855688518 AS Numeric(10, 0)), N'01824521483', N'', N'manisha@JctLtd.com', N'A', N'9000000550', CAST(0x0000AD6400D462F2 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2636', N'R-03325', N'Permanent', N'12-A, ', N'GALI NO. 2', N'JAGDAMBEY COLONY', N'AMRITSAR', N'PUNJAB', N'India', N'143001', CAST(7837875765 AS Numeric(10, 0)), CAST(7888493981 AS Numeric(10, 0)), N'', N'', N'rakeshasr72@yahoo.co.in', N'A', N'9000000410', CAST(0x0000AD64010989FD AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2636', N'R-03325', N'Current', N'IHMS-52', N'THAPAR COLONY', N'JCT LTD, PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(7837875765 AS Numeric(10, 0)), CAST(7888493981 AS Numeric(10, 0)), N'', N'', N'Weaving@jctltd.com', N'A', N'9000000410', CAST(0x0000AD64010989FD AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2954', N'C-00412', N'Permanent', N'C-18.   THAPAR COLONY ', N'J. C. T. LTD. ', N'G. T. ROAD', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8427366046 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'ckchawla@gmail.com', N'A', N'9000000494', CAST(0x0000AD65002FBFC5 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2954', N'C-00412', N'Current', N'C-18     THAPAR COLONY', N'J. C. T. LTD. ', N'G. T. ROAD', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8427366046 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'Weaving@jctltd.com', N'A', N'9000000494', CAST(0x0000AD65002FBFC5 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'H059', N'DHO-A04', N'Permanent', N'H NO 3/31-C', N'HARI OM GALI', N'BABARPUR EXT. SHAHDARA', N'DELHI', N'DELHI', N'India', N'1100032', CAST(9868215591 AS Numeric(10, 0)), CAST(9868501850 AS Numeric(10, 0)), N'', N'', N'ashokkumar@jctltd.com', N'A', N'9000000013', CAST(0x0000AD6500AFCDFA AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'H059', N'DHO-A04', N'Current', N'H NO 3/31-C', N'HARI OM GALI', N'BABARPUR EXT. SHAHDARA', N'DELHI', N'DELHI', N'India', N'1100032', CAST(9868215591 AS Numeric(10, 0)), CAST(9868501850 AS Numeric(10, 0)), N'', N'', N'ashokkumar@jctltd.com', N'A', N'9000000013', CAST(0x0000AD6500AFCDFA AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1771', N'H-01419', N'Permanent', N'V&PO - SAIDPUR', N'', N'', N'GREATER NOIDA', N'UTTAR PRADESH', N'India', N'201201', CAST(9915598748 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'harendra@jctltd.com', N'A', N'9000000273', CAST(0x0000AD6500AFDC42 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1771', N'H-01419', N'Current', N'C-10A', N'THAPAR COLONY', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9915598748 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01824304089', N'', N'harendra@JctLtd.com', N'A', N'9000000273', CAST(0x0000AD6500AFDC42 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2888', N'J-01847', N'Permanent', N'H.NO-432/F-13', N'NEHRU COLONY,MAJITHA ROAD', N'AMRITSAR', N'AMRITSAR', N'PUNJAB', N'India', N'143001', CAST(9463417780 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'prncjssl@gmail.com', N'A', N'9000000482', CAST(0x0000AD6500B01111 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2888', N'J-01847', N'Current', N'IHS-45', N'THAPAR COLONY', N'JCT MILL', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9463417780 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'jagdeepsingh@jctltd.com', N'A', N'9000000482', CAST(0x0000AD6500B01111 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1409', N'S-13845', N'Permanent', N'STREET NO 3, ONKAR NAGAR', N'KHOTHRAN ROAD', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9915473678 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sauravgupta_786@yahoo.in', N'A', N'9000000604', CAST(0x0000AD6500B0474D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1409', N'S-13845', N'Current', N'STREET NO 3, ONKAR NAGAR', N'KHOTHRAN ROAD', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9915473678 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sauravgupta_786@yahoo.in', N'A', N'9000000604', CAST(0x0000AD6500B0474D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8083', N'28083', N'Permanent', N'HOUSE NO 31', N'GURKIRAT ESTATE, ASLAMABAD', N'CHANDIGARH ROAD', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(9465841402 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'anil_sani@jctltd.com', N'A', N'9000000088', CAST(0x0000AD6500B08C42 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8083', N'28083', N'Current', N'HOUSE NO 31', N'GURKIRAT ESTATE, ASLAMABAD', N'CHANDIGARH ROAD', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(9465841402 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'anil_sani@jctltd.com', N'A', N'9000000088', CAST(0x0000AD6500B08C42 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1441', N'J-01924', N'Permanent', N'VPO KHOTHARAN', N'', N'', N'NAWANSHAHR', N'PUNJAB', N'India', N'144602', CAST(8146872687 AS Numeric(10, 0)), CAST(8360933992 AS Numeric(10, 0)), N'', N'', N'jaisingh@jctltd.com', N'A', N'9000000282', CAST(0x0000AD6500B0AB4F AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1441', N'J-01924', N'Current', N'VPO KHOTHARAN', N'', N'', N'NAWANSHAHR', N'PUNJAB', N'India', N'144602', CAST(8146872687 AS Numeric(10, 0)), CAST(8360933992 AS Numeric(10, 0)), N'', N'', N'jaisingh@jctltd.com', N'A', N'9000000282', CAST(0x0000AD6500B0AB4F AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8051', N'28051', N'Permanent', N'VPO- GUMANIWALA', N'KAPOOR FARM', N'NEAR SHAYAMPUR BYE PASS', N'RISHIKESH', N'UTTARAKHAND', N'India', N'249204', CAST(9878490712 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'PREM_BISHT@JCTLTD.COM', N'A', N'9000000075', CAST(0x0000AD6500B11745 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8051', N'28051', N'Current', N'GH-201', N'JCT LIMITED', N'CHOHAL', N'HOSHIARPUR', N'PUNJAB', N'India', N'146024', CAST(9878490712 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'PREM_BISHT@JCTLTD.COM', N'A', N'9000000075', CAST(0x0000AD6500B11745 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2776', N'T-03811', N'Permanent', N'HOUSE NO. 414', N'WARD NO. 12 ', N'MOHALLA NANGAL KOTLI,', N'GURDASPUR', N'PUNJAB', N'India', N'143521', CAST(9779925231 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'tajinder36@yahoo.co.uk', N'A', N'9000000451', CAST(0x0000AD6500B11E77 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2776', N'T-03811', N'Current', N'B-10,THAPAR COLONY ', N'PHAGWARA', N'DISTT. KAPURTHALA ', N'KAPURTHALA', N'PUNJAB', N'India', N'144401', CAST(9779925231 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'tajinderpal@jctltd.com', N'A', N'9000000451', CAST(0x0000AD6500B11E77 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1368', N'V-04253', N'Permanent', N'# 7654, ST NO 2 ', N'MAYA PURI , NEAR ATTA CHAKKI ', N'TIBBA ROAD , LUDHIANA ', N'LUDHIANA', N'PUNJAB', N'India', N'141007', CAST(7743007051 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'varunsood@jctltd.com', N'A', N'9000000634', CAST(0x0000AD6500B14B9A AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1368', N'V-04253', N'Current', N'# 7654, ST NO 2 ', N'MAYA PURI , NEAR ATTA CHAKKI ', N'TIBBA ROAD , LUDHIANA ', N'LUDHIANA', N'PUNJAB', N'India', N'141007', CAST(7743007051 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'varunsood@jctltd.com', N'A', N'9000000634', CAST(0x0000AD6500B14B9E AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1308', N'G-01306', N'Permanent', N'HOUSE NO.C-1', N'THAPAR COLONY', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9888606855 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'gopal@jctltd.com', N'A', N'9000000270', CAST(0x0000AD6500B17144 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1308', N'G-01306', N'Current', N'HOUSE NO.C-1', N'THAPAR COLONY', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9888606855 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'gopal@jctltd.com', N'A', N'9000000270', CAST(0x0000AD6500B17144 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8226', N'28226', N'Permanent', N'VPO NANDACHAUR, DISTT HOSHIARP', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146114', CAST(9815678911 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'2142', N'', N'singh_jaswinder@JctLtd.com', N'A', N'9000000132', CAST(0x0000AD6500B226AB AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8226', N'28226', N'Current', N'VPO NANDACHAUR, DISTT HOSHIARP', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146114', CAST(9815678911 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'2142', N'', N'singh_jaswinder@JctLtd.com', N'A', N'9000000132', CAST(0x0000AD6500B226AB AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2901', N'K-02157', N'Permanent', N'HOUSE ON LIG -39 ', N'URBAN ESTATE', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9914021271 AS Numeric(10, 0)), CAST(8699167141 AS Numeric(10, 0)), N'', N'', N'kkapilkashyap@gmail.com', N'A', N'9000000479', CAST(0x0000AD6500B268C0 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2901', N'K-02157', N'Current', N'HOUSE NO IHT-13', N'THAPAR COLONY', N'JCT MILL PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9914021271 AS Numeric(10, 0)), CAST(8699167141 AS Numeric(10, 0)), N'1498', N'', N'Kapilkumar@JctLtd.com', N'A', N'9000000479', CAST(0x0000AD6500B268C0 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1214', N'M-02466', N'Permanent', N'MANOJ SHARMA', N'V.P.O.KHANIYARA TEH DHARMSHALA', N'DISTT.KANGRA', N'DHARAMSALA', N'HIMACHAL PRADESH', N'India', N'176218', CAST(8146718707 AS Numeric(10, 0)), CAST(7986050353 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000534', CAST(0x0000AD6500B2B1A5 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1214', N'M-02466', N'Current', N'MANOJ SHARMA', N'IHMS-105 THAPAR COLONY', N'JCT MILL PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8146718707 AS Numeric(10, 0)), CAST(7986050353 AS Numeric(10, 0)), N'', N'', N'manojs@jctltd.com', N'A', N'9000000534', CAST(0x0000AD6500B2B1A5 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1657', N'S-13896', N'Permanent', N'VILLAGE BHARNAL PO DHALWAN', N'TEHSIL BALDWARA', N'DISTRICT MANDI', N'MANDI', N'HIMACHAL PRADESH', N'India', N'175004', CAST(9914945899 AS Numeric(10, 0)), CAST(7087180921 AS Numeric(10, 0)), N'8091704813', N'', N'SKRG81@GMAIL.COM', N'A', N'9000001325', CAST(0x0000AD6500B3B89A AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1657', N'S-13896', N'Current', N'IHMS 51', N'THAPAR COLONY', N'JCT LTD', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9914945899 AS Numeric(10, 0)), CAST(7087180921 AS Numeric(10, 0)), N'1824301473', N'', N'santoshkumar@jctltd.com', N'A', N'9000001325', CAST(0x0000AD6500B3B89A AS DateTime))
GO
print 'Processed 200 total records'
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2419', N'B-00343', N'Permanent', N'H NO.-305', N'VARINDER NAGAR MEHLI GATE', N'NEAR PUNJ MANDRI', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9417076256 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'bipankumar@jctltd.com', N'A', N'9000000255', CAST(0x0000AD6500B6878D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2419', N'B-00343', N'Current', N'H NO.-305', N'VARINDER NAGAR MEHLI GATE', N'NEAR PUNJ MANDRI', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9417076256 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'bipankumar@jctltd.com', N'A', N'9000000255', CAST(0x0000AD6500B6878D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1375', N'A-00151', N'Permanent', N'C-16 THAPAR COLONY', N'', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9876133069 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'arunsinghal@jctltd.com', N'A', N'9000000244', CAST(0x0000AD6500B6A71D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1375', N'A-00151', N'Current', N'C-16 THAPAR COLONY', N'', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9876133069 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'arunsinghal@jctltd.com', N'A', N'9000000244', CAST(0x0000AD6500B6A71D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1898', N'R-03591', N'Permanent', N'HOUSE NO-  ITH-10', N'THAPAR  COLONY', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(7087198176 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'rpatial26@gmail.com', N'A', N'9000000336', CAST(0x0000AD6500B6EF34 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1898', N'R-03591', N'Current', N'HOUSE NO-  IHT-10', N'THAPAR COLONY', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(7087198176 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1606', N'', N'rakeshpatial@JctLtd.com', N'A', N'9000000336', CAST(0x0000AD6500B6EF34 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8522', N'28522', N'Permanent', N'SUKHVINDER SINGH S/O SATWANT SINGH', N'VILLAGE: HARGARH', N'POST OFFICE: NAINOWAL JATTAN', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(8968852912 AS Numeric(10, 0)), CAST(6283277010 AS Numeric(10, 0)), N'', N'', N'VICKYRAHANU66@GMAIL.COM', N'A', N'9000001153', CAST(0x0000AD65006E31B6 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8522', N'28522', N'Current', N'SUKHVINDER SINGH S/O SATWANT SINGH', N'VILLAGE: HARGARH', N'POST OFFICE: NAINOWAL JATTAN', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(8968852912 AS Numeric(10, 0)), CAST(6283277010 AS Numeric(10, 0)), N'', N'', N'VICKYRAHANU66@GMAIL.COM', N'A', N'9000001153', CAST(0x0000AD65006E31B6 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8506', N'28506', N'Permanent', N'VPO BANKHANDI TEHSIL DEHRA', N'DISTT KANGRA', N'', N'DHARAMSALA', N'HIMACHAL PRADESH', N'India', N'177114', CAST(9418400787 AS Numeric(10, 0)), CAST(7807311520 AS Numeric(10, 0)), N'', N'', N'kaundal.mohit1993@gmail.com', N'A', N'9000000948', CAST(0x0000AD6500B77AE0 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8506', N'28506', N'Current', N'B-18', N'JCT LIMITED', N'THAPAR STAFF COLONY', N'HOSHIARPUR', N'PUNJAB', N'India', N'146024', CAST(9418400787 AS Numeric(10, 0)), CAST(7807311520 AS Numeric(10, 0)), N'', N'', N'mohit_kaundal@jctltd.com', N'A', N'9000000948', CAST(0x0000AD6500B77AE0 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2104', N'L-02212', N'Permanent', N'BXL-49', N'DR.MEHNGA MAL BUILDING, ', N'MOH.PREM NAGAR, STREET NO.1, RAILWAY ROAD,', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8283826126 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01824461227', N'', N'lalitsharma@jctltd.com', N'A', N'9000000293', CAST(0x0000AD6500B80061 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2104', N'L-02212', N'Current', N'BXL-49', N'DR.MEHNGA MAL BUILDING, ', N'MOH.PREM NAGAR, STREET NO.1, RAILWAY ROAD,', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8283826126 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01824461227', N'', N'lalitsharma@jctltd.com', N'A', N'9000000293', CAST(0x0000AD6500B80061 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8089', N'28089', N'Permanent', N'# 439/10, STREET NO 2, JAGATPURA', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(9878227008 AS Numeric(10, 0)), CAST(7009367899 AS Numeric(10, 0)), N'2058', N'', N'vishal_singh@JctLtd.com', N'A', N'9000000092', CAST(0x0000AD6500B85D2D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8089', N'28089', N'Current', N'# 439/10, STREET NO 2, JAGATPURA', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(9878227008 AS Numeric(10, 0)), CAST(7009367899 AS Numeric(10, 0)), N'2058', N'', N'vishal_singh@JctLtd.com', N'A', N'9000000092', CAST(0x0000AD6500B85D2D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2880', N'V-04248', N'Permanent', N'24A EKTA VIHAR', N'NEAR 120 FEET ROAD', N'JALANDHAR', N'JALANDHAR', N'PUNJAB', N'India', N'144001', CAST(9781738789 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'venusjain@jctltd.com', N'A', N'9000000478', CAST(0x0000AD6500B92D88 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2880', N'V-04248', N'Current', N'24A EKTA VIHAR', N'NEAR 120 FEET ROAD', N'JALANDHAR', N'JALANDHAR', N'PUNJAB', N'India', N'144001', CAST(9781738789 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'venusjain@jctltd.com', N'A', N'9000000478', CAST(0x0000AD6500B92D88 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1166', N'O-02811', N'Permanent', N'VILLAGE - BHORAHA ( PANDEY TOLA )', N'POST - BHORAHA ( TARAIYA )', N'DISTRICT - SARAN ( BIHAR )', N'CHHAPRA', N'BIHAR', N'India', N'841424', CAST(9876586980 AS Numeric(10, 0)), CAST(7009492053 AS Numeric(10, 0)), N'', N'', N'om26005@gmail.com', N'A', N'9000000611', CAST(0x0000AD6500BADA20 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1166', N'O-02811', N'Current', N'HOUSE NO. IHS-17', N'THAPAR COLONY JCT MILL', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9876586980 AS Numeric(10, 0)), CAST(7009492053 AS Numeric(10, 0)), N'', N'', N'Om26005@gmail.com', N'A', N'9000000611', CAST(0x0000AD6500BADA20 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8554', N'28554', N'Permanent', N'VILLAGE- TAJOWAL', N'PO-HUKRAN', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(9990898397 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000001267', CAST(0x0000AD6500BC40DA AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8554', N'28554', N'Current', N'VILLAGE- TAJOWAL', N'PO-HUKRAN', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(9990898397 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000001267', CAST(0x0000AD6500BC40DA AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1344', N'U-04009', N'Permanent', N'UMESH KUMAR ', N'V.P.O. KOT . TEHSIL TAUNI DEVI', N'DISTT. HAMIRPUR', N'HAMIRPUR', N'HIMACHAL PRADESH', N'India', N'177027', CAST(8283098637 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'umeshk.rana76@gmail.com', N'A', N'9000000582', CAST(0x0000AD6500DC8F8D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1344', N'U-04009', N'Current', N'UMESH KUMAR', N'I.H.M.S.- 109 THAPAR COLONY ', N'G.T. ROAD PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8283098637 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'umeshrana@jctltd.com', N'A', N'9000000582', CAST(0x0000AD6500DC8F8D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2623', N'R-03323', N'Permanent', N'HOUSE NO.69, NEW JAWALA NAGAR', N'NEAR DISPENSARY, NAGRA ROAD', N'MAQSUDAN, JALANDHAR', N'JALANDHAR', N'PUNJAB', N'India', N'144008', CAST(9876192943 AS Numeric(10, 0)), CAST(8360521677 AS Numeric(10, 0)), N'7347042458', N'', N'rajesharora@JctLtd.com', N'A', N'9000000407', CAST(0x0000AD6500EAD56D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2623', N'R-03323', N'Current', N'HOUSE NO.69, NEW JAWALA NAGAR', N'NEAR DISPENSARY, NAGRA ROAD', N'MAQSUDAN, JALANDHAR', N'JALANDHAR', N'PUNJAB', N'India', N'144008', CAST(9876192943 AS Numeric(10, 0)), CAST(8360521677 AS Numeric(10, 0)), N'7347042458', N'', N'rajesharora@JctLtd.com', N'A', N'9000000407', CAST(0x0000AD6500EAD56D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1283', N'R-03653', N'Permanent', N'VILL BIKA PUR POST OFFICE', N'GANGUWAL TEH ANAND PUR SAHIB', N'DIST ROPAR', N'RUPNAGAR', N'PUNJAB', N'India', N'140123', CAST(9417022152 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000001104', CAST(0x0000AD6500EC1856 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1283', N'R-03653', N'Current', N'QTR NO IHS 49', N'THAPER COLONY JCT LTD ', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9417022152 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'Ravi_dutt05@yahoo.co.in', N'A', N'9000001104', CAST(0x0000AD6500EC1856 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1425', N'D-00667', N'Permanent', N'GRAM POST DELHWA', N'THANA KALWARI', N'DIST BASTI', N'TANDA', N'UTTAR PRADESH', N'India', N'272301', CAST(7888491882 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000681', CAST(0x0000AD6500F04AA2 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1425', N'D-00667', N'Current', N'H NO 14 MANOHAR NAGAR', N'G T ROAD', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(7888491882 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'dineshchand@jctltd.com', N'A', N'9000000681', CAST(0x0000AD6500F04AA2 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2961', N'R-03606', N'Permanent', N'31/A BAISHANAB PARA 1ST LANE', N'MAHESH,HOOGHLY', N'', N'SRIRAMPORE', N'WEST BENGAL', N'India', N'712201', CAST(8556874291 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'ROBIN@JCTLTD.COM', N'A', N'9000000495', CAST(0x0000AD6500F284AD AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2961', N'R-03606', N'Current', N'JCT MILL THAPAR COLONY ', N'IHS-67', N'', N'PHAGWARA', N'PUNJAB', N'India', N'1444401', CAST(8556874291 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'ROBIN@jctltd.com', N'A', N'9000000495', CAST(0x0000AD6500F284AD AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2739', N'S-13786', N'Permanent', N'C-5', N'THAPAR COLONY', N'JCT MILL', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9855062955 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01824521613', N'', N'sanjivkumar@JctLtd.com', N'A', N'9000000439', CAST(0x0000AD6501090780 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2739', N'S-13786', N'Current', N'C-5', N'THAPAR COLONY', N'JCT MILL', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9855062955 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01824521613', N'', N'sanjivkumar@JctLtd.com', N'A', N'9000000439', CAST(0x0000AD6501090780 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2604', N'D-00646', N'Permanent', N'HOUSE NO.38', N'VILLAGE - GARAH, TEHSIL - HIRANAGAR', N'DISTRICT - KATHUA', N'KATHUA', N'JAMMU AND KASHMIR', N'India', N'184142', CAST(9596613962 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000406', CAST(0x0000AD65010AAA80 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2604', N'D-00646', N'Current', N'HOUSE NO. C-15', N'THAPAR COLONY', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(7780880548 AS Numeric(10, 0)), CAST(9915847675 AS Numeric(10, 0)), N'', N'', N'electricalengg@jctltd.com', N'A', N'9000000406', CAST(0x0000AD65010AAA80 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1094', N'N-02653', N'Permanent', N'MR. NARINDER SINGH RANA', N'QT. NO. IHT-12, THAPAR COLONY,', N'J. C. T. MILL, PHAGWARA.', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9041642391 AS Numeric(10, 0)), CAST(8427292923 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000306', CAST(0x0000AD65010C0890 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1094', N'N-02653', N'Current', N'MR. NARINDER SINGH RANA', N'QT. NO. IHT-12, THAPAR COLONY,', N'J. C. T. MILL, PHAGWARA.', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9041642391 AS Numeric(10, 0)), CAST(8427292923 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000306', CAST(0x0000AD65010C0890 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8284', N'28284', N'Permanent', N'H.NO-543,NEW MODEL TOWN.', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(9463290500 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'shuklaanil10768@gmail.com', N'A', N'9000000153', CAST(0x0000AD65010DBCD9 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8284', N'28284', N'Current', N'H.NO.543, NEW MODEL TOWN,HOSHI', N'', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(9463290500 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1882222601', N'', N'chemlab_office@JctLtd.com', N'A', N'9000000153', CAST(0x0000AD65010DBCD9 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1449', N'R-03636', N'Permanent', N'KAMARUDDIN PUR', N'RAMPUR', N'JAUNPUR', N'JAUNPUR', N'UTTAR PRADESH', N'India', N'221201', CAST(9517518613 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'SINGHRAGHVENDRA@GMAIL.COM', N'A', N'9000000625', CAST(0x0000AD65010FDE10 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1449', N'R-03636', N'Current', N'IHS-53', N'THAPAR COLONY', N'JCT MILL GT ROAD PHAGWAREA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9517518613 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1455', N'', N'RAGHVENDRA@JctLtd.com', N'A', N'9000000625', CAST(0x0000AD65010FDE10 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2777', N'N-02638', N'Permanent', N'QNO.C-2 KV STAFF COLONY', N'SURANUSSI ', N'', N'JALANDHAR', N'PUNJAB', N'India', N'144027', CAST(9988367659 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'narendrasingh@jctltd.com', N'A', N'9000000452', CAST(0x0000AD6500CA837F AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2777', N'N-02638', N'Current', N'QNO.C-2 KV STAFF COLONY', N'SURANUSSI ', N'', N'JALANDHAR', N'PUNJAB', N'India', N'144027', CAST(9988367659 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'narendrasingh@jctltd.com', N'A', N'9000000452', CAST(0x0000AD6500CA837F AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2770', N'S-13789', N'Permanent', N'STREET NO.-5, SHAEED BHAGAT SINGH NAGAR.', N'KHOTHRAN ROAD, PHAGWARA', N'DISST-KAPURTHALA', N'PHAGWARA', N'PUNJAB', N'India', N'1444401', CAST(9878885914 AS Numeric(10, 0)), CAST(9878885914 AS Numeric(10, 0)), N'01824521651', N'', N'sanjeevdadwal@jctltd.com', N'A', N'9000000447', CAST(0x0000AD6500CBF22F AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2770', N'S-13789', N'Current', N'STREET NO.-5, SHAEED BHAGAT SINGH NAGAR.', N'KHOTHRAN ROAD, PHAGWARA', N'DISST-KAPURTHALA', N'PHAGWARA', N'PUNJAB', N'India', N'1444401', CAST(9878885914 AS Numeric(10, 0)), CAST(9878885914 AS Numeric(10, 0)), N'01824521651', N'', N'sanjeevdadwal@jctltd.com', N'A', N'9000000447', CAST(0x0000AD6500CBF22F AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2771', N'R-03346', N'Permanent', N'VPO ARYA NAGER', N'TEH. HISAR', N'DISTT. HISAR', N'HISAR', N'HARYANA', N'India', N'125004', CAST(9815060680 AS Numeric(10, 0)), CAST(7696974740 AS Numeric(10, 0)), N'', N'', N'ubbarohtash473@gmail.com', N'A', N'9000000448', CAST(0x0000AD6500CD0B82 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2771', N'R-03346', N'Current', N'IHMS-114', N'THAPAR CALONY ', N'JCT LTD. ', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9815060680 AS Numeric(10, 0)), CAST(7696974740 AS Numeric(10, 0)), N'', N'', N'Weaving@jctltd.com', N'A', N'9000000448', CAST(0x0000AD6500CD0B82 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1306', N'D-00762', N'Permanent', N'HOUSE NO 3676', N'STREET NO 11 NEW SHIVAJI NAGAR', N'NEAR SANJEEVNI HOSPITAL', N'LUDHIANA', N'PUNJAB', N'India', N'141008', CAST(7743007052 AS Numeric(10, 0)), CAST(9888348483 AS Numeric(10, 0)), N'01824521524', N'', N'dheerajarora@jctltd.com', N'A', N'9000000577', CAST(0x0000AD6500CDCA0C AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1306', N'D-00762', N'Current', N'HOUSE NO 3676', N'STREET NO 11 NEW SHIVAJI NAGAR', N'NEAR SANJEEVNI HOSPITAL', N'LUDHIANA', N'PUNJAB', N'India', N'141008', CAST(7743007052 AS Numeric(10, 0)), CAST(9888348483 AS Numeric(10, 0)), N'01824521524', N'', N'dheerajarora@jctltd.com', N'A', N'9000000577', CAST(0x0000AD6500CDCA0C AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1269', N'H-01449', N'Permanent', N'STREET NO. 5', N'SHAM NAGAR', N'DIST. KAPURTHALA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9814027700 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'hardeepk@jctltd.com', N'A', N'9000000622', CAST(0x0000AD6500CE3E27 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1269', N'H-01449', N'Current', N'STREET NO. 5', N'SHAM NAGAR', N'DIST. KAPURTHALA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9814027700 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'hardeepk@jctltd.com', N'A', N'9000000622', CAST(0x0000AD6500CE3E2C AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1956', N'Y-04807', N'Permanent', N'LIG, F-3308', N'RAJAJI PURAM', N'LUCKNOW', N'LUCKNOW', N'UTTAR PRADESH', N'India', N'226017', CAST(9988492627 AS Numeric(10, 0)), CAST(7986705314 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000375', CAST(0x0000AD6500D01CAE AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1956', N'Y-04807', N'Current', N'C-8 THAPAR COLONY ', N'JCT MILL LIMITED', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9988492627 AS Numeric(10, 0)), CAST(7986705314 AS Numeric(10, 0)), N'', N'', N'yogeshsingh@JctLtd.com', N'A', N'9000000375', CAST(0x0000AD6500D01CAE AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2512', N'S-13757', N'Permanent', N'H.NO. 3/1380A, HIMMAT NAGAR', N'NAZIR PURA GALI', N'PAPER MILL ROAD', N'SAHARANPUR', N'UTTAR PRADESH', N'India', N'247001', CAST(9357181880 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sonuverma3424@gmail.com', N'A', N'9000000381', CAST(0x0000AD6500E074C0 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2512', N'S-13757', N'Current', N'H.NO. IHMS-68', N'THAPER COLONY', N'JCT MILL', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9357181880 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'sonuverma@JctLtd.com', N'A', N'9000000381', CAST(0x0000AD6500E074C0 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2599', N'K-02045', N'Permanent', N'C-2 THAPAR COLONY ', N'JCTLTD ', N'PHAGWARA', N'KAPURTHALA', N'PUNJAB', N'India', N'144401', CAST(7347042453 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1578', N'', N'kuldeepsalwan@JctLtd.com', N'A', N'9000000401', CAST(0x0000AD6500E339CF AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2599', N'K-02045', N'Current', N'C-2 THAPAR COLONY ', N'JCTLTD ', N'PHAGWARA', N'KAPURTHALA', N'PUNJAB', N'India', N'144401', CAST(7347042453 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1578', N'', N'kuldeepsalwan@JctLtd.com', N'A', N'9000000401', CAST(0x0000AD6500E339CF AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2825', N'T-03812', N'Permanent', N'ZAILDARA MOHALA', N'HOUSE NO. 274.WARD NO.7', N'DORAHA', N'KHANNA', N'PUNJAB', N'India', N'141421', CAST(9855512987 AS Numeric(10, 0)), CAST(9855512987 AS Numeric(10, 0)), N'', N'', N'TEJINDER.RAMPUR@YAHOO.COM', N'A', N'9000000464', CAST(0x0000AD6500E45F61 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2825', N'T-03812', N'Current', N'IHMS 77', N'THAPAR CLONY', N'JCT MILL', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9855512987 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'1661', N'', N'tejindersingh@jctltd.com', N'A', N'9000000464', CAST(0x0000AD6500E45F61 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8112', N'28112', N'Permanent', N'PATHRA WALA KHOO, NAI ABADI ', N'HOSHIARPUR', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(9872031535 AS Numeric(10, 0)), CAST(9876074144 AS Numeric(10, 0)), N'', N'', N'sharma_rajan@JctLtd.com', N'A', N'9000000102', CAST(0x0000AD6500F79F30 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'8112', N'28112', N'Current', N'PATHRA WALA KHOO, NAI ABADI ', N'HOSHIARPUR', N'', N'HOSHIARPUR', N'PUNJAB', N'India', N'146001', CAST(9872031535 AS Numeric(10, 0)), CAST(9876074144 AS Numeric(10, 0)), N'', N'', N'sharma_rajan@JctLtd.com', N'A', N'9000000102', CAST(0x0000AD6500F79F30 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2662', N'J-01858', N'Permanent', N'HOUSE NO.32  BABA DEEP SINGH NAGAR', N'NEAR TARANTARN ROAD', N'UTTAM NAGAR', N'AMRITSAR', N'PUNJAB', N'India', N'143001', CAST(9478630001 AS Numeric(10, 0)), CAST(9478630001 AS Numeric(10, 0)), N'', N'', N'jagjiwans@JctLtd.com', N'A', N'9000000685', CAST(0x0000AD6500F87B85 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2662', N'J-01858', N'Current', N'HOUSE NO.32  BABA DEEP SINGH NAGAR', N'NEAR TARANTARN ROAD', N'UTTAM NAGAR', N'AMRITSAR', N'PUNJAB', N'India', N'143001', CAST(9478630001 AS Numeric(10, 0)), CAST(9478630001 AS Numeric(10, 0)), N'', N'', N'jagjiwans@JctLtd.com', N'A', N'9000000685', CAST(0x0000AD6500F87B85 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1392', N'R-03506', N'Permanent', N'RAJ KUMAR S/O LATE SH.PREM NATH ', N'VILLAGE ATTA,PO GORAYA', N'DISTT.JALANDHAR', N'PHILLAUR', N'PUNJAB', N'India', N'144409', CAST(9417486869 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'rajkumar@jctltd.com', N'A', N'9000000324', CAST(0x0000AD6500F9B139 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1392', N'R-03506', N'Current', N'RAJ KUMAR S/O LATE SH.PREM NATH ', N'VILLAGE ATTA,PO GORAYA', N'DISTT.JALANDHAR', N'PHILLAUR', N'PUNJAB', N'India', N'144409', CAST(9417486869 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'rajkumar@jctltd.com', N'A', N'9000000324', CAST(0x0000AD6500F9B139 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1656', N'A-00278', N'Permanent', N'STREET NO 09', N'ONKAR NAGAR', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9988491453 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'ak9988491453@gmail.com', N'A', N'9000001318', CAST(0x0000AD6500FA724A AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1656', N'A-00278', N'Current', N'STREET NO 09', N'ONKAR NAGAR', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9988491453 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'ak9988491453@gmail.com', N'A', N'9000001318', CAST(0x0000AD6500FA724A AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1575', N'S-13892', N'Permanent', N'VILLAGE-MAHNAULI', N'POST OFFICE-PANCHOBH', N'DIST-DARBHANGA', N'DARBHANGA', N'BIHAR', N'India', N'846003', CAST(7283089828 AS Numeric(10, 0)), CAST(9708813239 AS Numeric(10, 0)), N'', N'', N's4suraj98@gmail.com', N'A', N'9000001300', CAST(0x0000AD6500FBDD1D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1575', N'S-13892', N'Current', N'HOUSE NO-IHS-10', N'THAPAR COLONY, JCT MILLS PHAGWARA', N'KAPURTHALLA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(7283089828 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N's4suraj98@gmail.com', N'A', N'9000001300', CAST(0x0000AD6500FBDD1D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1581', N'W-04403', N'Permanent', N'WILLIAM GEORGE MICHAEL', N'C-38 , THAPAR COLONY ', N'J C T MILLS', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8283886426 AS Numeric(10, 0)), CAST(9815384584 AS Numeric(10, 0)), N'01824262239', N'', N'william@jctltd.com', N'A', N'9000000540', CAST(0x0000AD6500FCFF56 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1581', N'W-04403', N'Current', N'WILLIAM GEORGE MICHAEL', N'C-38 , THAPAR COLONY ', N'J C T MILLS', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8283886426 AS Numeric(10, 0)), CAST(9815384584 AS Numeric(10, 0)), N'01824262239', N'', N'william@jctltd.com', N'A', N'9000000540', CAST(0x0000AD6500FCFF56 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1584', N'S-13827', N'Permanent', N'SANDHAYA KUMARI', N'SHAHID BHAGAT SINGH NAGAR', N'LANE NO: 15', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9855978622 AS Numeric(10, 0)), CAST(9779384925 AS Numeric(10, 0)), N'', N'', N'sandhya@jctltd.com', N'A', N'9000000572', CAST(0x0000AD6500FE3B03 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1584', N'S-13827', N'Current', N'SANDHAYA KUMARI', N'SHAHID BHAGAT SINGH NAGAR', N'LANE NO: 15', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9855978622 AS Numeric(10, 0)), CAST(9779384925 AS Numeric(10, 0)), N'', N'', N'sandhya@jctltd.com', N'A', N'9000000572', CAST(0x0000AD6500FE3B03 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1583', N'M-02469', N'Permanent', N'MANPREET KAUR', N'VPO SARGUNDI', N'61', N'JALANDHAR', N'PUNJAB', N'India', N'144409', CAST(8437671947 AS Numeric(10, 0)), CAST(8968179845 AS Numeric(10, 0)), N'', N'', N'manpreetk@jctltd.com', N'A', N'9000000549', CAST(0x0000AD6500FFEE3B AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1583', N'M-02469', N'Current', N'MANPREET KAUR', N'VPO SARGUNDI', N'61', N'JALANDHAR', N'PUNJAB', N'India', N'144409', CAST(8437671947 AS Numeric(10, 0)), CAST(8968179845 AS Numeric(10, 0)), N'', N'', N'manpreetk@jctltd.com', N'A', N'9000000549', CAST(0x0000AD6500FFEE3B AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1076', N'R-03633', N'Permanent', N'KOIREEPATI ', N'KOTWA MISR', N'PATHARDEVA ', N'DEORIA', N'UTTAR PRADESH', N'India', N'274404', CAST(9988358064 AS Numeric(10, 0)), CAST(9988358064 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000616', CAST(0x0000AD650115E6C4 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1076', N'R-03633', N'Current', N'IHS 23', N'THAPAR COLONY ', N'PHAGWARA ', N'KAPURTHALA', N'PUNJAB', N'India', N'144401', CAST(9988358064 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000616', CAST(0x0000AD650115E6C4 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2660', N'R-03665', N'Permanent', N'HOUSE NO.96, KARTAR ESTATE,NEAR MOHALLA-BAGH SUDHAN,PHASE-2 ', N'PHAGWARA,KAPURTHALA-PUNJAB-144401', N'DO', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9815283738 AS Numeric(10, 0)), CAST(9815849738 AS Numeric(10, 0)), N'', N'', N'rashapal@jctltd.com', N'A', N'9000001314', CAST(0x0000AD6500D3A07A AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2660', N'R-03665', N'Current', N'HOUSE NO.96, KARTAR ESTATE,NEAR MOHALLA-BAGH SUDHAN,PHASE-2 ', N'PHAGWARA,KAPURTHALA-PUNJAB-144401', N'DO', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9815283738 AS Numeric(10, 0)), CAST(9815849738 AS Numeric(10, 0)), N'', N'', N'rashapal@jctltd.com', N'A', N'9000001314', CAST(0x0000AD6500D3A07A AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1427', N'V-04355', N'Permanent', N'KHOTHRAN', N'KHOTHRAN KALAN', N'SHAHEED BHAGAT SINGH NAGAR', N'PHAGWARA', N'PUNJAB', N'India', N'144632', CAST(9803046352 AS Numeric(10, 0)), CAST(7355060469 AS Numeric(10, 0)), N'', N'', N'vinod.kumar976@yahoo.com', N'A', N'9000001154', CAST(0x0000AD6500D5F57F AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1427', N'V-04355', N'Current', N'KHOTHRAN', N'KHOTHRAN KALAN', N'SHAHEED BHAGAT SINGH NAGAR', N'PHAGWARA', N'PUNJAB', N'India', N'144632', CAST(9803046352 AS Numeric(10, 0)), CAST(7355060469 AS Numeric(10, 0)), N'', N'', N'vinod.kumar976@yahoo.com', N'A', N'9000001154', CAST(0x0000AD6500D5F57F AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1003', N'R-03428', N'Permanent', N'427, URBAN ESTATE', N'', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9646020799 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'Spinning@jctltd.com', N'A', N'9000000318', CAST(0x0000AD6500F50EF0 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1003', N'R-03428', N'Current', N'427, URBAN ESTATE', N'', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9646020799 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'Spinning@jctltd.com', N'A', N'9000000318', CAST(0x0000AD6500F50EF0 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1573', N'D-00769', N'Permanent', N'D3/1929 RAM NAGAR COLONY', N'ISLAMABAD', N'AMRITSAR', N'AMRITSAR', N'PUNJAB', N'India', N'143001', CAST(8557932984 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'bharti1993dk34@gmail.bom', N'A', N'9000000686', CAST(0x0000AD6500F75C69 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1573', N'D-00769', N'Current', N'IHS 45 B', N'THAPER COLONY', N'PHAGWARA', N'PHAGWARA', N'PUNJAB', N'India', N'144001', CAST(8557932984 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'deepak@jctltd.com', N'A', N'9000000686', CAST(0x0000AD6500F75C69 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1556', N'S-13834', N'Permanent', N'VILLAGE-PILLUE', N'POST OFFICE-MANIAR,BAHADURA', N'DIST-BALLIA', N'BALLIA', N'UTTAR PRADESH', N'India', N'277207', CAST(8054276476 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'singhsatish051@gmail.com', N'A', N'9000000580', CAST(0x0000AD6500FE60C9 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1556', N'S-13834', N'Current', N'HOUSE NO-IHT-28', N'THAPAR COLONY, JCT MILLS, PHAGWARA', N'KAPURTHALLA', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(8054276476 AS Numeric(10, 0)), CAST(8728851076 AS Numeric(10, 0)), N'', N'', N'qaspg@jctltd.com', N'A', N'9000000580', CAST(0x0000AD6500FE60C9 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2867', N'G-01242', N'Permanent', N'366,SARASWATI COLONY', N'KHERI MARKANDA', N'', N'KURUKSHETRA', N'HARYANA', N'India', N'136131', CAST(9463506633 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'gianchand@jctltd.com', N'A', N'9000000477', CAST(0x0000AD6500FF4A35 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2867', N'G-01242', N'Current', N'C-11,THAPAR COLONY', N'', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9463506633 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'01824301646', N'', N'gianchand@JctLtd.com', N'A', N'9000000477', CAST(0x0000AD6500FF4A35 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1606', N'S-13838', N'Permanent', N'PREET NAGAR HOUSE NO. 44 ', N'NEAR SINGH SABHA GURUDWARA', N'STREET NO.1', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(7508666405 AS Numeric(10, 0)), CAST(7347042457 AS Numeric(10, 0)), N'', N'', N'sandeepsharma@jctltd.com', N'A', N'9000000587', CAST(0x0000AD6501002D6C AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1606', N'S-13838', N'Current', N'PREET NAGAR HOUSE NO. 44 ', N'NEAR SINGH SABHA GURUDWARA', N'STREET NO.1', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(7508666405 AS Numeric(10, 0)), CAST(7347042457 AS Numeric(10, 0)), N'', N'', N'sandeepsharma@jctltd.com', N'A', N'9000000587', CAST(0x0000AD6501002D6C AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2468', N'N-02734', N'Permanent', N'SUPER C-32 THAPAR COLONY JCT MILLS ', N'PHAGWARA', N'', N'KAPURTHALA', N'PUNJAB', N'India', N'144401', CAST(8283023344 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'nsaini@jctltd.com', N'A', N'9000000309', CAST(0x0000AD650101679D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'2468', N'N-02734', N'Current', N'SUPER C-32 THAPAR COLONY JCT MILLS ', N'PHAGWARA', N'', N'KAPURTHALA', N'PUNJAB', N'India', N'144401', CAST(8283023344 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'nsaini@jctltd.com', N'A', N'9000000309', CAST(0x0000AD650101679D AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1275', N'A-00254', N'Permanent', N'VILLAGE- PAHALWANPUR', N'SARSAWA,SAHARANPUR', N'', N'SAHARANPUR', N'UTTAR PRADESH', N'India', N'247232', CAST(9023664087 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'', N'A', N'9000000642', CAST(0x0000AD6501098FD7 AS DateTime))
INSERT [dbo].[Jct_Payroll_Emp_Address_Detail_Portal] ([CardNo], [EmployeeCode], [AddressType], [Address1], [Address2], [Address3], [City], [State], [Country], [Pincode], [PrimaryMobileNo], [SecondaryMobileNo], [PrimaryLandlineNo], [SecondaryLandlineNo], [EmailID], [Status], [EntryBy], [EntryOn]) VALUES (N'1275', N'A-00254', N'Current', N'IHT-39 , JCT COLONY', N'PHAGWARA', N'', N'PHAGWARA', N'PUNJAB', N'India', N'144401', CAST(9023664087 AS Numeric(10, 0)), CAST(0 AS Numeric(10, 0)), N'', N'', N'amitkumar@jctltd.com', N'A', N'9000000642', CAST(0x0000AD6501098FD7 AS DateTime))
/****** Object:  StoredProcedure [dbo].[jct_payroll_emp_address_detail_PortalPost]    Script Date: 07/14/2021 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[jct_payroll_emp_address_detail_PortalPost]        
--3 Records                        
--Exec jct_payroll_emp_address_detail_PortalPost '9000000334'                                                
--Single                        
--Exec jct_payroll_emp_address_detail_PortalPost '9000000537', '1','2','3','4','5','1','2','3','4','5','1','2','3','4','5','1','2','3','4','5'                                   
  
--Exec jct_payroll_emp_address_detail_PortalPost '9000000537', '123123123131','1312312313','1231231313','3123123123123','12312312313','1312313','123123123123','3','4','5','1','2','3','4','5','1','2','3','4','5'                                   
  
    @Employeecode VARCHAR(10) ,    
    @CurrentAddress1 VARCHAR(60) ,    
    @CurrentAddress2 VARCHAR(60) ,    
    @CurrentAddress3 VARCHAR(60) ,    
    @CurrentCity VARCHAR(60) ,    
    @CurrentState VARCHAR(60) ,    
    @CurrentPincode VARCHAR(20) ,    
    @CurrentPrimaryMobileNo VARCHAR(12) = NULL ,    
    @CurrentSecondaryMobileNo VARCHAR(12) = NULL ,    
    @CurrentPrimaryLandline VARCHAR(12) = NULL ,    
    @CurrentEmailID VARCHAR(35) ,    
    @PermanentAddress1 VARCHAR(60) ,    
    @PermanentAddress2 VARCHAR(60) ,    
    @PermanentAddress3 VARCHAR(60) ,    
    @PermanentCity VARCHAR(60) ,    
    @PermanentState VARCHAR(60) ,    
    @PermanentPincode VARCHAR(20) ,    
    @PermanentPrimaryMobileNo VARCHAR(12) = NULL ,    
    @PermanentSecondaryMobileNo VARCHAR(12) = NULL ,    
    @PermanentPrimaryLandline VARCHAR(12) = NULL ,    
    @PermanentEmailID VARCHAR(35)    
AS     
    BEGIN                          
         
         
         
         IF ( @Employeecode = '' ) 
            BEGIN 
                RAISERROR('Time Out Expired',16,1)
                RETURN
            END		

         IF ( @Employeecode IS NULL ) 
            BEGIN 
                RAISERROR('Time Out Expired',16,1)
                RETURN
            END	
         
                          
        IF ( @PermanentPrimaryMobileNo = '' )     
            SET @PermanentPrimaryMobileNo = NULL              
        IF ( @PermanentSecondaryMobileNo = '' )     
            SET @PermanentSecondaryMobileNo = NULL              
              
        IF ( @CurrentPrimaryMobileNo = '' )     
            SET @CurrentPrimaryMobileNo = NULL              
        IF ( @CurrentSecondaryMobileNo = '' )     
            SET @CurrentSecondaryMobileNo = NULL              
              
                
                          
        DECLARE @crdno VARCHAR(10)                      
        SET @crdno = ( SELECT DISTINCT TOP ( 1 )    
                                CardNo    
                       FROM     dbo.JCT_Payroll_Employees_Master    
                       WHERE    STATUS = 'A'    
                                AND NewEmployeeCode = @Employeecode    
                     )           
                               
        
                          
        DECLARE @oldcode VARCHAR(10)                      
        SET @oldcode = ( SELECT DISTINCT TOP ( 1 )    
                                EmployeeCode    
                         FROM   dbo.JCT_Payroll_Employees_Master    
                         WHERE  STATUS = 'A'    
                                AND NewEmployeeCode = @Employeecode    
                       )                                             
                                                                                                                                                                 
                               
---------------------------------Permanent Address Insert(Start) ------------------------------------------                  
        
        
        IF EXISTS ( SELECT DISTINCT    
                            'X'    
                    FROM    dbo.Jct_Payroll_Emp_Address_Detail_Portal    
                    WHERE   STATUS = 'A'    
                            AND EmployeeCode = @oldcode    
                            AND AddressType = 'Permanent' )     
            BEGIN         
                    
                        
                UPDATE  dbo.Jct_Payroll_Emp_Address_Detail_Portal    
                SET     Status = 'D'    
                WHERE   STATUS = 'A'    
                        AND EmployeeCode = @oldcode    
                        AND AddressType = 'Permanent'         
                    
        
               INSERT  INTO dbo.Jct_Payroll_Emp_Address_Detail_Portal    
                        ( CardNo ,    
                          EmployeeCode ,    
                          AddressType ,    
                          Address1 ,    
                          Address2 ,    
                          Address3 ,    
                          City ,    
                          State ,    
                          Country ,    
                          Pincode ,    
                          PrimaryMobileNo ,    
                          SecondaryMobileNo ,    
                          PrimaryLandlineNo ,    
                          SecondaryLandlineNo ,    
                          EmailID ,    
                          Status ,    
                          EntryBy ,    
                          EntryOn                  
                                       
                        )    
                VALUES  ( @crdno ,    
                          @oldcode ,    
                          'Permanent' ,    
                          UPPER(@PermanentAddress1) ,    
                          UPPER(@PermanentAddress2) ,    
                          UPPER(@PermanentAddress3) ,    
                          UPPER(@PermanentCity) ,    
                          UPPER(@PermanentState) ,    
                          'India' ,    
                          @PermanentPincode ,    
                          CONVERT(NUMERIC(18), ISNULL(@PermanentPrimaryMobileNo,    
                                                      0)) ,    
                          CONVERT(NUMERIC(18), ISNULL(@PermanentSecondaryMobileNo,    
                                                      0)) ,    
                          @PermanentPrimaryLandline ,    
                          '' ,    
                          @PermanentEmailID ,    
                          'A' ,    
                          @Employeecode ,    
                          GETDATE()    
                        )                  
                               
            END         
        ELSE     
            BEGIN         
        
                INSERT  INTO dbo.Jct_Payroll_Emp_Address_Detail_Portal    
                        ( CardNo ,    
                          EmployeeCode ,    
                          AddressType ,    
                          Address1 ,    
                          Address2 ,    
                          Address3 ,    
                          City ,    
                          State ,    
                          Country ,    
                          Pincode ,    
                          PrimaryMobileNo ,    
                          SecondaryMobileNo ,    
                          PrimaryLandlineNo ,    
                          SecondaryLandlineNo ,    
                          EmailID ,    
                          Status ,    
                          EntryBy ,    
                          EntryOn                  
                                       
                        )    
                VALUES  ( @crdno ,    
                          @oldcode ,    
                          'Permanent' ,    
                          UPPER(@PermanentAddress1) ,    
                          UPPER(@PermanentAddress2) ,    
                          UPPER(@PermanentAddress3) ,    
                          UPPER(@PermanentCity) ,    
                          UPPER(@PermanentState) ,    
                          'India' ,    
                          @PermanentPincode ,    
                          CONVERT(NUMERIC(18), ISNULL(@PermanentPrimaryMobileNo,    
                                                      0)) ,    
                          CONVERT(NUMERIC(18), ISNULL(@PermanentSecondaryMobileNo,    
                                                      0)) ,    
                          @PermanentPrimaryLandline ,    
                          '' ,    
                          @PermanentEmailID ,    
                          'A' ,    
                          @Employeecode ,    
                     GETDATE()    
                        )              
        
            END                           
---------------------------------Permanent Address Insert(End) -------------------------------------                  
                  
---------------------------------Current Address Insert(Start) ------------------------------------------            
        
        
        IF EXISTS ( SELECT DISTINCT    
                            'X'    
                    FROM    dbo.Jct_Payroll_Emp_Address_Detail_Portal    
                    WHERE   STATUS = 'A'    
                            AND EmployeeCode = @oldcode    
                            AND AddressType = 'Current' )     
            BEGIN         
                    
                        
                UPDATE  dbo.Jct_Payroll_Emp_Address_Detail_Portal    
                SET     Status = 'D'    
                WHERE   STATUS = 'A'    
                        AND EmployeeCode = @oldcode    
                        AND AddressType = 'Current'         
                    
        
              
                INSERT  INTO dbo.Jct_Payroll_Emp_Address_Detail_Portal    
                        ( CardNo ,    
                          EmployeeCode ,    
                          AddressType ,    
                          Address1 ,    
                          Address2 ,    
                          Address3 ,    
                          City ,    
                          State ,    
                          Country ,    
                          Pincode ,    
                          PrimaryMobileNo ,    
                          SecondaryMobileNo ,    
                          PrimaryLandlineNo ,    
                          SecondaryLandlineNo ,    
                          EmailID ,    
                          Status ,    
                          EntryBy ,    
                          EntryOn                  
                                       
                        )    
                VALUES  ( @crdno ,    
                          @oldcode ,    
                          'Current' ,    
                          UPPER(@CurrentAddress1) ,    
                          UPPER(@CurrentAddress2) ,    
                          UPPER(@CurrentAddress3) ,    
                          UPPER(@CurrentCity) ,    
                          UPPER(@CurrentState) ,    
                          'India' ,    
                          @CurrentPincode ,    
                          CONVERT(NUMERIC(18), ISNULL(@CurrentPrimaryMobileNo,    
                                                      0)) ,    
                          CONVERT(NUMERIC(18), ISNULL(@CurrentSecondaryMobileNo,    
                                                      0)) ,    
                          @CurrentPrimaryLandline ,    
                          '' ,    
                          @CurrentEmailID ,    
                          'A' ,    
                          @Employeecode ,    
                          GETDATE()    
                        )                  
                               
            END         
        ELSE     
            BEGIN        
                         
                INSERT  INTO dbo.Jct_Payroll_Emp_Address_Detail_Portal    
                        ( CardNo ,    
                          EmployeeCode ,    
                          AddressType ,    
                          Address1 ,    
                          Address2 ,    
                          Address3 ,    
                          City ,    
                          State ,    
                          Country ,    
                          Pincode ,    
                          PrimaryMobileNo ,    
                          SecondaryMobileNo ,    
                          PrimaryLandlineNo ,    
                          SecondaryLandlineNo ,    
                          EmailID ,    
                          Status ,    
                          EntryBy ,    
                          EntryOn                  
                                      
                        )    
                VALUES  ( @crdno ,    
                          @oldcode ,    
                          'Current' ,    
                          UPPER(@CurrentAddress1) ,    
                          UPPER(@CurrentAddress2) ,    
                          UPPER(@CurrentAddress3) ,    
                          UPPER(@CurrentCity) ,    
                          UPPER(@CurrentState) ,    
                          'India' ,    
                          @CurrentPincode ,    
                          CONVERT(NUMERIC(18), ISNULL(@CurrentPrimaryMobileNo,    
                                                      0)) ,    
                          CONVERT(NUMERIC(18), ISNULL(@CurrentSecondaryMobileNo,    
                                                      0)) ,    
                          @CurrentPrimaryLandline ,    
                          '' ,    
                          @CurrentEmailID ,    
                          'A' ,    
                          @Employeecode ,    
                          GETDATE()    
                        )            
                         
            END               
---------------------------------Current Address Insert(End) -------------------------------------                                                                                                                                
            
            
---------------------------------Family Detail Insert(Start) -------------------------------------                 
            
            
--DROP TABLE myabc            
            
--CREATE TABLE myabc            
--(            
--NAME VARCHAR(50)            
--)            
            
            
            
            
--DECLARE @FyYear TABLE ( fiyear VARCHAR(50) )            
--INSERT  INTO @FyYear            
--        EXEC JCT_OPS_FINANCIAL_YEAR             
             
             
--SELECT  *            
--FROM    @FyYear            
             
             
             
             
            
             
             
               
--CREATE PROC Jct_Payroll_User_OtherDetails            
--    @EmployeeCode VARCHAR(50)            
--AS             
--    BEGIN              
                       
--    END              
              
               
              
              
            
     --INSERT   INTO Jct_Payroll_Group_Insurance_Portal            
     --( NewEmployeeCode ,            
     --  dept ,            
     --  Name ,            
     --  Designation ,            
     --  Age ,            
     --  DOB ,            
     --  Relation ,            
     --  Entry_Date ,            
     --  Entered_By ,            
     --  Status ,            
     --  Mode ,            
     --  FinancialYear ,            
     --  DisableFlag                                
                                       
                                      
     --)            
     --VALUES   ( @ecode ,            
     --  @dept ,            
     --  @Name ,            
     --  @Designation ,            
     --  @Age ,            
     --  CONVERT(VARCHAR, CONVERT(DATETIME, @DOB, 103), 101) ,            
     --  @Relation ,            
     --  GETDATE() ,            
     --  @Entered_By ,            
     --  'A' ,            
     --  @Mode ,            
     --  @FinancialYear ,            
     --  @DisableFlag                                     
                                      
     --)             
            
            
---------------------------------Family Detail Insert(End) -------------------------------------                                                                                                                                
                                                              
    END               
              
              
--SELECT * FROM Jct_Payroll_Emp_Address_Detail                   
--WHERE EmployeeCode = 'r-03584'              
              
--SELECT * FROM Jct_Payroll_Emp_Address_Detail ORDER BY EntryOn  DESC              
              
--SELECT * FROM Jct_Payroll_Emp_Address_Detail           
--WHERE CardNo = ''              
              
--DELETE FROM Jct_Payroll_Emp_Address_Detail               
--WHERE CardNo = ''              
              
              
              
--SELECT * INTO Jct_Payroll_Emp_Address_Detail_Portal FROM Jct_Payroll_Emp_Address_Detail
GO
/****** Object:  StoredProcedure [dbo].[jct_payroll_emp_address_detail_PortalFetch_Insurance_EARLIER]    Script Date: 07/14/2021 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[jct_payroll_emp_address_detail_PortalFetch_Insurance_EARLIER]        
--3 Records          
--Exec jct_payroll_emp_address_detail_PortalFetch_Insurance '9000000334'            
          
--Single          
--Exec jct_payroll_emp_address_detail_PortalFetch_Insurance '9000000537'            
          
--NoRecord          
--Exec jct_payroll_emp_address_detail_PortalFetch_Insurance '9000001104'            
    @Employeecode VARCHAR(10)      
AS       
    BEGIN            
            
        DECLARE @oldcode VARCHAR(10)        
        SET @oldcode = ( SELECT DISTINCT TOP ( 1 )      
                                EmployeeCode      
                         FROM   dbo.JCT_Payroll_Employees_Master      
                         WHERE  STATUS = 'A'      
                                AND NewEmployeeCode = @Employeecode      
                       )        
                               
                         
        SELECT  Relation ,      
                Name ,      
                CONVERT(VARCHAR,dob,101) AS dob      
                --,      
                --Age      
        FROM    Jct_Payroll_Group_Insurance      
        WHERE   FinancialYear = '2021-2022'      
                AND NewEmployeeCode = @Employeecode      
                AND STATUS = 'A'      
                AND Mode = 'Submit'      
        ORDER BY Relation DESC      
                         
                                                
                          
    END
GO
/****** Object:  StoredProcedure [dbo].[jct_payroll_emp_address_detail_PortalFetch_Insurance]    Script Date: 07/14/2021 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[jct_payroll_emp_address_detail_PortalFetch_Insurance]      
--3 Records        
--Exec jct_payroll_emp_address_detail_PortalFetch_Insurance '9000000334'          
        
--Single        
--Exec jct_payroll_emp_address_detail_PortalFetch_Insurance '9000000537'          
        
--NoRecord        
--Exec jct_payroll_emp_address_detail_PortalFetch_Insurance '9000001104'          
    @Employeecode VARCHAR(10)    
AS     
    BEGIN          
          
        DECLARE @oldcode VARCHAR(10)      
        SET @oldcode = ( SELECT DISTINCT TOP ( 1 )    
                                EmployeeCode    
                         FROM   dbo.JCT_Payroll_Employees_Master    
                         WHERE  STATUS = 'A'    
                                AND NewEmployeeCode = @Employeecode    
                       )      
                             
                       
        SELECT  Relation ,    
                Name ,    
                CONVERT(VARCHAR,dob,101) AS dob    
                --,    
                --Age    
        FROM    Jct_Payroll_Group_Insurance    
        WHERE   FinancialYear = '2021-2022'    
                AND NewEmployeeCode = @Employeecode    
                AND STATUS = 'A'    
                AND Mode = 'Submit'    
        ORDER BY Relation DESC    
                       
                                              
                        
    END
GO
/****** Object:  StoredProcedure [dbo].[jct_payroll_emp_address_detail_PortalFetch_Current]    Script Date: 07/14/2021 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[jct_payroll_emp_address_detail_PortalFetch_Current]                
--3 Records                  
--Exec jct_payroll_emp_address_detail_PortalFetch_Current '9000000334'                    
                  
--Single                  
--Exec jct_payroll_emp_address_detail_PortalFetch_Current '9000000334'                    
                  
--NoRecord                  
--Exec jct_payroll_emp_address_detail_PortalFetch_Current '9000001104'                    
    @Employeecode VARCHAR(10)        
AS         
    BEGIN                                        
              
        DECLARE @SelectedUser VARCHAR(60)                
        SET @SelectedUser = ( SELECT DISTINCT TOP ( 1 )        
                                FirstName       
                         FROM   dbo.JCT_Payroll_Employees_Master        
                         WHERE  STATUS = 'A'        
                                AND NewEmployeeCode = @Employeecode        
                       )                  
                    
        DECLARE @oldcode VARCHAR(10)                
        SET @oldcode = ( SELECT DISTINCT TOP ( 1 )        
                                EmployeeCode        
                         FROM   dbo.JCT_Payroll_Employees_Master        
                         WHERE  STATUS = 'A'        
                                AND NewEmployeeCode = @Employeecode        
                       )                
                    
                    
          
        IF NOT EXISTS ( SELECT DISTINCT        
                                'X'        
                        FROM    dbo.Jct_Payroll_Emp_Address_Detail_Portal        
                        WHERE   STATUS = 'A'        
                                AND EmployeeCode = @oldcode        
                                AND AddressType = 'Current' )         
            BEGIN           
                    
                    
                                     
                SELECT  UPPER(Address1) AS CurrentAddress1 ,        
                        UPPER(Address2) AS CurrentAddress2 ,        
                        UPPER(Address3) AS CurrentAddress3 ,        
                        UPPER(City) AS CurrentCity ,        
                        UPPER(State) AS CurrentState ,        
                        UPPER(Country) AS CurrentCountry ,        
                        UPPER(Pincode) AS CurrentPincode ,        
                        PrimaryMobileNo AS CurrentPrimaryMobileNo ,        
                        SecondaryMobileNo AS CurrentSecondaryMobileNo ,        
                        PrimaryLandlineNo AS CurrentPrimaryLandline ,        
                        SecondaryLandlineNo AS CurrentSecondaryLandlineNo ,        
                        EmailID AS CurrentEmailID ,        
                        EmployeeCode ,      
                        'false' as  CurrentSubmitStatus  ,    
                        @SelectedUser AS  SelectedUser    
                INTO    #Current        
                FROM    jct_payroll_emp_address_detail        
                WHERE   EmployeeCode = @oldcode        
                        AND AddressType = 'Current'        
                        AND STATUS = 'A'                                        
                                           
                      
                                    
                                                     
                SELECT  *        
                FROM    #Current                
                              
            END           
        ELSE         
            BEGIN           
                SELECT  UPPER(Address1) AS CurrentAddress1 ,        
                        UPPER(Address2) AS CurrentAddress2 ,        
                        UPPER(Address3) AS CurrentAddress3 ,        
                        UPPER(City) AS CurrentCity ,        
                        UPPER(State) AS CurrentState ,        
                        UPPER(Country) AS CurrentCountry ,        
                        UPPER(Pincode) AS CurrentPincode ,      
          PrimaryMobileNo AS CurrentPrimaryMobileNo ,        
                        SecondaryMobileNo AS CurrentSecondaryMobileNo ,        
PrimaryLandlineNo AS CurrentPrimaryLandline ,        
                        SecondaryLandlineNo AS CurrentSecondaryLandlineNo ,        
                        EmailID AS CurrentEmailID ,        
                        EmployeeCode  ,      
                        'true' as  CurrentSubmitStatus ,    
                        @SelectedUser AS  SelectedUser    
                INTO    #Current1        
                FROM    Jct_Payroll_Emp_Address_Detail_Portal        
                WHERE   EmployeeCode = @oldcode        
                        AND AddressType = 'Current'        
                        AND STATUS = 'A'            
                           
                SELECT  *        
                FROM    #Current1            
                           
            END                 
                                      
                                  
    END
GO
/****** Object:  StoredProcedure [dbo].[jct_payroll_emp_address_detail_PortalFetch_Permanent]    Script Date: 07/14/2021 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[jct_payroll_emp_address_detail_PortalFetch_Permanent]            
--3 Records              
--Exec jct_payroll_emp_address_detail_PortalFetch_Permanent '9000000334'                
              
--Single              
--Exec jct_payroll_emp_address_detail_PortalFetch_Permanent '9000000537'                
              
--NoRecord              
--Exec jct_payroll_emp_address_detail_PortalFetch_Permanent '9000001104'                
    @Employeecode VARCHAR(10)        
AS         
    BEGIN                
                
        DECLARE @oldcode VARCHAR(10)            
        SET @oldcode = ( SELECT DISTINCT TOP ( 1 )        
                                EmployeeCode        
                         FROM   dbo.JCT_Payroll_Employees_Master        
                         WHERE  STATUS = 'A'        
                                AND NewEmployeeCode = @Employeecode        
                       )            
                                                                                                                                                       
                    
        IF NOT EXISTS ( SELECT DISTINCT        
                                'X'        
                        FROM    dbo.Jct_Payroll_Emp_Address_Detail_Portal        
                        WHERE   STATUS = 'A'        
                                AND EmployeeCode = @oldcode        
                                AND AddressType = 'Permanent' )         
            BEGIN         
                  
                            
                            
                SELECT  UPPER(Address1) AS PermanentAddress1 ,        
                        UPPER(Address2) AS PermanentAddress2 ,        
                        UPPER(Address3) AS PermanentAddress3 ,        
                        UPPER(City) AS PermanentCity ,        
                        UPPER(State) AS PermanentState ,        
                        UPPER(Country) AS PermanentCountry ,        
                        Pincode AS PermanentPincode ,        
                        PrimaryMobileNo AS PermanentPrimaryMobileNo ,        
                        SecondaryMobileNo AS PermanentSecondaryMobileNo ,        
                        PrimaryLandlineNo AS PermanentPrimaryLandline ,        
                        SecondaryLandlineNo AS PermanentSecondaryLandlineNo ,        
                        EmailID AS PermanentEmailID ,        
                        EmployeeCode   ,    
                        'false' as  PermanentSubmitStatus       
                INTO    #Permanent        
                FROM    jct_payroll_emp_address_detail        
                WHERE   EmployeeCode = @oldcode        
                        AND AddressType = 'Permanent'        
                        AND STATUS = 'A'                
                                                
                SELECT  *        
                FROM    #Permanent AS a           
            END         
        ELSE         
            BEGIN         
                                                    
              SELECT  UPPER(Address1) AS PermanentAddress1 ,        
                        UPPER(Address2) AS PermanentAddress2 ,        
                        UPPER(Address3) AS PermanentAddress3 ,        
                        UPPER(City) AS PermanentCity ,        
                        UPPER(State) AS PermanentState ,        
                        UPPER(Country) AS PermanentCountry ,    
                        Pincode AS PermanentPincode ,        
                        PrimaryMobileNo AS PermanentPrimaryMobileNo ,        
                        SecondaryMobileNo AS PermanentSecondaryMobileNo ,        
                        PrimaryLandlineNo AS PermanentPrimaryLandline ,        
                        SecondaryLandlineNo AS PermanentSecondaryLandlineNo ,        
                        EmailID AS PermanentEmailID ,        
                        EmployeeCode ,    
                        'true' as  PermanentSubmitStatus         
                INTO    #Permanent1        
           FROM    Jct_Payroll_Emp_Address_Detail_Portal        
                WHERE   EmployeeCode = @oldcode        
                        AND AddressType = 'Permanent'        
                        AND STATUS = 'A'                
                                                
                SELECT  *        
                FROM    #Permanent1 AS a           
                        
                        
            END         
                 
                                       
                                                            
    END
GO
/****** Object:  StoredProcedure [dbo].[jct_payroll_emp_address_detail_PortalFetch]    Script Date: 07/14/2021 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[jct_payroll_emp_address_detail_PortalFetch] 
    @cardno VARCHAR(10) ,  
    @salarycode VARCHAR(10) ,  
    @addrestype VARCHAR(30) ,  
    @addressline1 VARCHAR(30) ,  
    @addressline2 VARCHAR(30) ,  
    @addressline3 VARCHAR(30) ,  
    @entry_by VARCHAR(30) ,  
    @mob_no VARCHAR(10) ,  
    @landln_no VARCHAR(20) ,  
    @secondarylandln_no VARCHAR(12) ,  
    @email_ID VARCHAR(25) ,  
    @city VARCHAR(30) ,  
    @STATE VARCHAR(30) ,  
    @country VARCHAR(30)  
AS   
    IF EXISTS ( SELECT  *  
                FROM    jct_payroll_emp_address_detail  
                WHERE   cardno = @cardno  
                        AND AddressType = @addrestype  
                        AND EmployeeCode = @salarycode  
                        AND STATUS = 'A' )   
        BEGIN              
            UPDATE  jct_payroll_emp_address_detail  
            SET     STATUS = 'U' ,  
                    @entry_by = @entry_by ,  
                    EntryOn = GETDATE()  
            WHERE   cardno = @cardno  
                    AND EmployeeCode = @salarycode  
                    AND AddressType = @addrestype  
                    AND status = 'A'             
            INSERT  INTO jct_payroll_emp_address_detail  
                    ( cardno ,  
                      EmployeeCode ,  
                      AddressType ,  
                      Address1 ,  
                      Address2 ,  
                      Address3 ,  
                      EntryBy ,  
                      PrimaryMobileNo ,  
                      PrimaryLandlineNo ,  
                      SecondaryLandlineNo ,  
                      EmailID ,  
                      city ,  
                      STATE ,  
                      country ,  
                      EntryOn ,  
                      STATUS                
                    )  
            VALUES  ( @cardno ,  
                      @salarycode ,  
                      @addrestype ,  
                      @addressline1 ,  
                      @addressline2 ,  
                      @addressline3 ,  
                      @entry_by ,  
                      @mob_no ,  
                      @landln_no ,  
                      @secondarylandln_no ,  
                      @email_ID ,  
                      @city ,  
                      @STATE ,  
                      @country ,  
                      GETDATE() ,  
                      'A'            
                    )               
        END              
              
    ELSE   
        BEGIN              
            INSERT  INTO jct_payroll_emp_address_detail  
                    ( cardno ,  
                      EmployeeCode ,  
                      AddressType ,  
                      Address1 ,  
                      Address2 ,  
                      Address3 ,  
                      EntryBy ,  
                      PrimaryMobileNo ,  
                      PrimaryLandlineNo ,  
                      SecondaryLandlineNo ,  
                      EmailID ,  
                      city ,  
                      STATE ,  
                      country ,  
                      EntryOn ,  
                      status              
                    )  
            VALUES  ( @cardno ,  
                      @salarycode ,  
                      @addrestype ,  
                      @addressline1 ,  
                      @addressline2 ,  
                      @addressline3 ,  
                      @entry_by ,  
                      @mob_no ,  
                      @landln_no ,  
                      @secondarylandln_no ,  
                      @email_ID ,  
                      @city ,  
                      @STATE ,  
                      @country ,  
                      GETDATE() ,  
                      'A'              
                    )               
        END
GO
/****** Object:  StoredProcedure [dbo].[jct_payroll_PortalFetch_Cities]    Script Date: 07/14/2021 17:01:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[jct_payroll_PortalFetch_Cities]  
--3 Records                  
--Exec jct_payroll_PortalFetch_Cities 'PUNJAB'           
    @StateName VARCHAR(60)  
AS   
    BEGIN                    
              
        SELECT  UPPER(city_id) AS city_id,UPPER(city_name) AS city_name,UPPER(city_state) AS city_state  
        FROM    Jct_Payroll_Portal_Cities  
        WHERE   city_state = @StateName     
        ORDER BY city_name  
                                                                                         
                                                                
    END
GO
/****** Object:  StoredProcedure [dbo].[jct_payroll_PortalFetch_Cities_All]    Script Date: 07/14/2021 17:01:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[jct_payroll_PortalFetch_Cities_All]  
--3 Records                  
--Exec jct_payroll_PortalFetch_Cities_All  
      
AS   
    BEGIN                    
              
        SELECT  city_id,UPPER(city_name) AS city_name,UPPER(city_state) AS city_state  
        FROM    Jct_Payroll_Portal_Cities            
        ORDER BY city_state,city_name  
                                                                                         
                                                                
    END
GO
/****** Object:  StoredProcedure [dbo].[jct_payroll_PortalFetch_States]    Script Date: 07/14/2021 17:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[jct_payroll_PortalFetch_States]
--3 Records                
--Exec jct_payroll_PortalFetch_States                                   
AS 
    BEGIN                  
            
        SELECT  *
        FROM    Jct_Payroll_Portal_State     
        ORDER BY  state                                                                                    
                                                              
    END
GO
