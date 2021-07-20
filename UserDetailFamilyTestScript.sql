ALTER PROCEDURE jct_payroll_emp_address_detail_PortalFetch_Insurance      
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
      
      
      
        IF NOT EXISTS ( SELECT DISTINCT      
                                'X'      
                        FROM    dbo.Jct_Payroll_Group_Insurance_Portal      
                        WHERE   STATUS = 'A'      
                                AND NewEmployeeCode = @Employeecode )      
            BEGIN      
      
                     --SELECT 'A'      
      
                SELECT  Relation ,      
                        Name ,      
                        CONVERT(VARCHAR, dob, 103) AS dob ,  
                        DisableFlag      
                --,      
                --Age      
                FROM    Jct_Payroll_Group_Insurance      
                WHERE   FinancialYear = '2021-2022'      
                        AND NewEmployeeCode = @Employeecode      
                        AND STATUS = 'A'      
                        AND Mode = 'Submit'      
                ORDER BY Relation DESC      
      
            END      
        ELSE      
            BEGIN      
      
                SELECT  Relation ,      
                        Name ,      
                        CONVERT(VARCHAR, dob, 103) AS dob ,  
                        DisableFlag      
                --,      
                --Age      
                FROM    Jct_Payroll_Group_Insurance_Portal      
                WHERE   FinancialYear = '2021-2022'      
                        AND NewEmployeeCode = @Employeecode      
                        AND STATUS = 'A'      
                        AND Mode = 'Submit'      
                ORDER BY Relation DESC      
      
      
            END      
      
    END      
      
go

    
    
    
    
    
ALTER PROCEDURE jct_payroll_emp_address_detail_PortalPost_Test    
--3 Records    
--Exec jct_payroll_emp_address_detail_PortalPost_Test '9000000334'    
--Single    
--Exec jct_payroll_emp_address_detail_PortalPost_Test '9000000537','1','2','3','4','5','1','2','3','4','5','1','2','3','4','5','1','2','3','4','5'    
    
--Exec jct_payroll_emp_address_detail_PortalPost_Test '9000000537', '123123123131','1312312313','1231231313','3123123123123','12312312313','1312313','123123123123','3','4','5','1','2','3','4','5','1','2','3','4','5'    
    
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
    
    
---------------------------------Permanent Address Insert(Start)    
------------------------------------------    
    
    
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
                          CONVERT(NUMERIC(18),    
ISNULL(@PermanentPrimaryMobileNo,    
                                                      0)) ,    
                          CONVERT(NUMERIC(18),    
ISNULL(@PermanentSecondaryMobileNo,    
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
                          CONVERT(NUMERIC(18),    
ISNULL(@PermanentPrimaryMobileNo,    
                                                      0)) ,    
                          CONVERT(NUMERIC(18),    
ISNULL(@PermanentSecondaryMobileNo,    
                                                      0)) ,    
                          @PermanentPrimaryLandline ,    
                          '' ,    
                          @PermanentEmailID ,    
                          'A' ,    
                          @Employeecode ,    
                     GETDATE()    
                        )    
    
            END    
---------------------------------Permanent Address Insert(End)    
-------------------------------------    
    
---------------------------------Current Address Insert(Start)    
------------------------------------------    
    
    
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
                          CONVERT(NUMERIC(18),    
ISNULL(@CurrentPrimaryMobileNo,    
                                                      0)) ,    
                          CONVERT(NUMERIC(18),    
ISNULL(@CurrentSecondaryMobileNo,    
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
                          CONVERT(NUMERIC(18),    
ISNULL(@CurrentPrimaryMobileNo,    
                                                      0)) ,    
                          CONVERT(NUMERIC(18),    
ISNULL(@CurrentSecondaryMobileNo,    
                                                      0)) ,    
                          @CurrentPrimaryLandline ,    
                          '' ,    
                          @CurrentEmailID ,    
                  'A' ,    
                          @Employeecode ,    
                          GETDATE()    
                        )    
    
            END    
---------------------------------Current Address Insert(End)    
-------------------------------------    
    
    
    
---------------------------------Family Detail Insert(Start)    
-------------------------------------    
    
    
INSERT INTO dbo.Jct_Payroll_Group_Insurance_Portal    
        ( ecode ,    
          dept ,    
          Name ,    
          Designation ,    
          Cat ,    
          Age ,    
          D ,    
          M ,    
          Y ,    
          DOB ,    
          Relation ,    
         F13 ,    
          F14 ,    
          F15 ,    
          F16 ,    
          F17 ,    
          STATUS ,    
          Updated_date ,    
          updated_by ,    
          Mode ,    
          Entry_date ,    
        Entered_By ,    
          FinancialYear ,    
          DisableFlag ,    
          ResetDt ,    
          Plant ,    
          Location ,    
          NewEmployeeCode    
        )    
SELECT ecode ,    
          dept ,    
          Name ,    
          Designation ,    
          Cat ,    
          Age ,    
          D ,    
          M ,    
          Y ,    
          DOB ,    
          Relation ,    
          F13 ,    
          F14 ,    
          F15 ,    
          F16 ,    
          F17 ,    
          STATUS ,    
          Updated_date ,    
          updated_by ,    
          Mode ,    
          Entry_date ,    
          Entered_By ,    
          FinancialYear ,    
          DisableFlag ,    
          ResetDt ,    
          Plant ,    
          Location ,    
          NewEmployeeCode FROM    
Jct_Payroll_Group_Insurance_Portal_DumpRecords    
          WHERE NewEmployeeCode =  @Employeecode    
          AND STATUS = 'A'    
          AND Mode = 'Submit'    
              
DELETE FROM Jct_Payroll_Group_Insurance_Portal_DumpRecords    
          WHERE NewEmployeeCode =  @Employeecode    
          AND STATUS = 'A'    
          AND Mode = 'Submit'              
    
--SELECT * FROM Jct_Payroll_Group_Insurance_Portal_DumpRecords    
    
    
    
---------------------------------Family Detail Insert(End)    
-------------------------------------    
    
    
    
---------------------------------Family Detail Insert(Start)    
-------------------------------------    
    
    
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
    
    
---------------------------------Family Detail Insert(End)    
-------------------------------------    
    
    END    
    
    
--SELECT * FROM Jct_Payroll_Emp_Address_Detail    
--WHERE EmployeeCode = 'r-03584'    
    
--SELECT * FROM Jct_Payroll_Emp_Address_Detail ORDER BY EntryOn  DESC    
    
--SELECT * FROM Jct_Payroll_Emp_Address_Detail    
--WHERE CardNo = ''    
    
--DELETE FROM Jct_Payroll_Emp_Address_Detail    
--WHERE CardNo = ''    
    
    
   
--SELECT * INTO Jct_Payroll_Emp_Address_Detail_Portal FROM Jct_Payroll_Emp_Address_Detail    
    
go 


        
        
        
        
CREATE PROCEDURE jct_payroll_Family_Detail_PortalTempPost_Test        
--Single        
--Exec jct_payroll_Family_Detail_PortalTempPost_Test '9000000334','25/05/2021','Mohd Aslam','Self'        
--Exec jct_payroll_Family_Detail_PortalTempPost_Test '9000000334','25/05/2021','Abc','Self','Y'        
--Exec jct_payroll_Family_Detail_PortalTempPost_Test '9000000334','25/01/1990','Abc','Self','Y'        
--Exec jct_payroll_Family_Detail_PortalTempPost_Test '9000000537','15/06/1990','Abc','Self','Y'        
    @NewEmployeecode VARCHAR(10) ,  
    @Dob VARCHAR(50) ,  
    @NAME VARCHAR(50) ,  
    @Relation VARCHAR(50) ,  
    @DisableFlag VARCHAR(50) = NULL  
AS   
    BEGIN        
        
                                   
-------------------------------------------GetFIYear(Start)-----------------------------------------------------------------           
     
        
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
        
        
        
-------------------------------------------GetFIYear(End)-----------------------------------------------------------------           
              
        DECLARE @ConvertedDate DATETIME  
        SET @ConvertedDate = CONVERT(DATETIME, CONVERT(DATETIME, @Dob, 103), 101)  
        
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
                        DATEDIFF(yy, @ConvertedDate, GETDATE())  
                        - CASE WHEN ( ( MONTH(@ConvertedDate) > MONTH(GETDATE()) )  
                                      OR ( MONTH(@ConvertedDate) = MONTH(GETDATE())  
                                           AND DAY(CONVERT(DATETIME, @ConvertedDate, 101)) > DAY(GETDATE())  
                                         )  
                                    ) THEN 1  
                               ELSE 0  
                          END ,  
                        CONVERT(DATETIME, @Dob, 103) ,  
                        @Relation AS Relation ,  
                        'A' ,  
                        'Submit' ,  
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
        
        
        
---------------------------------Family Detail Insert(End)        
-------------------------------------        
        
--SELECT * FROM Jct_Payroll_Group_Insurance_Portal_DumpRecords        
        
    END        
        
        
--SELECT * FROM Jct_Payroll_Emp_Address_Detail        
--WHERE EmployeeCode = 'r-03584'        
        
--SELECT * FROM Jct_Payroll_Emp_Address_Detail ORDER BY EntryOn  DESC        
        
--SELECT * FROM Jct_Payroll_Emp_Address_Detail        
--WHERE CardNo = ''        
        
--DELETE FROM Jct_Payroll_Emp_Address_Detail        
--WHERE CardNo = ''        
        
--SELECT * FROM Jct_Payroll_Group_Insurance_Portal_DumpRecords        
--TRUNCATE TABLE Jct_Payroll_Group_Insurance_Portal_DumpRecords        
--SELECT * FROM Jct_Payroll_Group_Insurance_Portal           
        
--SELECT * INTO Jct_Payroll_Emp_Address_Detail_Portal FROM Jct_Payroll_Emp_Address_Detail           
      
      
      