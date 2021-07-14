﻿Imports System.Data
Imports System.Data.SqlClient

Partial Class EmpGateway_ReviewAppraisal
    Inherits System.Web.UI.Page
    Dim ofn As New Functions

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If (Session("empcode").ToString <> "") Then
            'empcode = Session("empcode")
        Else
            Response.Redirect("~/login.aspx")
        End If
        If Not IsPostBack Then
            Try
                ' GetInfo(Session("EmpCode"))
                GetInfo(Request.QueryString("Ecode").ToString(), Request.QueryString("YR").ToString())

            Catch ex As Exception
                Response.Write("<script>alert('Imroper Data!! '" + ex.Message + "')</script>")
            End Try
        End If
    End Sub
    Private Sub GetInfo(empcode As String, Yr As String)
        ' If Session("EmpCode").ToLower() <> "9000000537" And Session("EmpCode").ToLower() <> "9000000334" And Session("EmpCode").ToLower() <> "9000000473" And Session("EmpCode").ToLower() <> "9000000453" And Session("EmpCode").ToLower() <> "9000000443" Then
        If Session("EmpCode").ToLower() <> "9000000453" And Session("EmpCode").ToLower() <> "9000000334" Then
            Response.Redirect("Default.aspx")
        End If

        Dim sqlstr As String = "Jct_Empg_Inc_Info_Fetch_ABC '" & empcode & "'"

        If Request.QueryString("Yr").ToString() = "2019" Then
            sqlstr = "checktot '" & empcode & "'"
        Else
            sqlstr = "Jct_Empg_Inc_Info_Fetch_ABC '" & empcode & "','" & Yr & "'"
        End If

        'If Session("EmpCode").ToLower() = "r-03360" Or Session("EmpCode").ToLower() = "a-00098" Then
        '    sqlstr = "Jct_Empg_Inc_Info_Fetch_2018 '" & empcode & "'"
        'Else
        '    sqlstr = "Jct_Empg_Inc_Info_Fetch_ABC '" & empcode & "'"
        'End If
        Dim dr As SqlDataReader

        dr = ofn.FetchReader(sqlstr)
        If dr.HasRows() Then
            dr.Read()

            '' '' '' ''lblEmpName.Text = dr("name")
            '' '' '' ''lblSalCode.Text = dr("ecode")
            '' '' '' ''lblDesig.Text = dr("desg_code")

            '' '' '' ''lblBasic_E_M.Text = dr("E_Basic")
            '' '' '' ''lblBasic_E_A.Text = dr("E_Basic_A")
            '' '' '' ''lblBasic_R_M.Text = dr("NBasic")
            '' '' '' ''lblBasic_R_A.Text = dr("NBasic_A")


            '' '' '' ''lbl_HRA_E_M.Text = dr("E_HRA")
            '' '' '' ''lbl_HRA_E_A.Text = dr("E_HRA_A")
            '' '' '' ''lbl_HRA_R_M.Text = dr("NHRA")
            '' '' '' ''lbl_HRA_R_A.Text = dr("NHRA_A")

            '' '' '' ''lbl_CA_E_M.Text = dr("E_Colony")
            '' '' '' ''lbl_CA_E_A.Text = dr("E_Colony_A")
            '' '' '' ''lbl_CA_R_M.Text = dr("NColony")
            '' '' '' ''lbl_CA_R_A.Text = dr("NColony_A")


            '' '' '' ''lbl_PA_E_M.Text = dr("E_Personal")
            '' '' '' ''lbl_PA_E_A.Text = dr("E_Personal_A")
            '' '' '' ''lbl_PA_R_M.Text = dr("NPersonal")
            '' '' '' ''lbl_PA_R_A.Text = dr("NPersonal_A")


            '' '' '' ''lbl_SA_E_M.Text = dr("E_Special")
            '' '' '' ''lbl_SA_E_A.Text = dr("E_Special_A")
            '' '' '' ''lbl_SA_R_M.Text = dr("NSpecial")
            '' '' '' ''lbl_SA_R_A.Text = dr("NSpecial_A")



            '' '' '' ''lbl_TA_E_M.Text = dr("E_Transport")
            '' '' '' ''lbl_TA_E_A.Text = dr("E_Transport_A")
            '' '' '' ''lbl_TA_R_M.Text = dr("NTransport")
            '' '' '' ''lbl_TA_R_A.Text = dr("NTransport_A")


            '' '' '' ''lbl_ASA_E_M.Text = dr("E_ASA")
            '' '' '' ''lbl_ASA_E_A.Text = dr("E_ASA_A")
            '' '' '' ''lbl_ASA_R_M.Text = dr("NASA")
            '' '' '' ''lbl_ASA_R_A.Text = dr("NASA_A")



            '' '' '' ''lbl_UA_E_M.Text = dr("E_Uniform")
            '' '' '' ''lbl_UA_E_A.Text = dr("E_Uniform_A")
            '' '' '' ''lbl_UA_R_M.Text = dr("NUniform")
            '' '' '' ''lbl_UA_R_A.Text = dr("NUniform_A")


            '' '' '' ''lbl_Bonus_E_M.Text = dr("E_Bonus")
            '' '' '' ''lbl_Bonus_E_A.Text = dr("E_Bonus_A")
            '' '' '' ''lbl_Bonus_R_M.Text = dr("NBonus")
            '' '' '' ''lbl_Bonus_R_A.Text = dr("NBonus_A")


            '' '' '' ''lbl_CPF_E_M.Text = dr("E_PF")
            '' '' '' ''lbl_CPF_E_A.Text = dr("E_PF_A")
            '' '' '' ''lbl_CPF_R_M.Text = dr("NPF")
            '' '' '' ''lbl_CPF_R_A.Text = dr("NPF_A")


            '' '' '' ''lbl_Gratuity_E_M.Text = dr("E_Gratuity")
            '' '' '' ''lbl_Gratuity_E_A.Text = dr("E_Gratuity_A")
            '' '' '' ''lbl_Gratuity_R_M.Text = dr("NGratuity")
            '' '' '' ''lbl_Gratuity_R_A.Text = dr("NGratuity_A")


            '' '' '' ''lbl_ESI_E_M.Text = dr("E_ESI")
            '' '' '' ''lbl_ESI_E_A.Text = dr("E_ESI_A")
            '' '' '' ''lbl_ESI_R_M.Text = dr("NESI")
            '' '' '' ''lbl_ESI_R_A.Text = dr("NESI_A")


            '' '' '' ''lbl_SUP_E_M.Text = dr("E_Superannuation")
            '' '' '' ''lbl_SUP_E_A.Text = dr("E_Superannuation_A")
            '' '' '' ''lbl_SUP_R_M.Text = dr("NSuperannuation")
            '' '' '' ''lbl_SUP_R_A.Text = dr("NSuperannuation_A")



            '' '' '' ''lbl_LTA_E_M.Text = dr("E_LTA")
            '' '' '' ''lbl_LTA_E_A.Text = dr("E_LTA_A")
            '' '' '' ''lbl_LTA_R_M.Text = dr("NLTA")
            '' '' '' ''lbl_LTA_R_A.Text = dr("NLTA_A")



            '' '' '' ''lbl_MedR_E_M.Text = dr("E_Medical")
            '' '' '' ''lbl_MedR_E_A.Text = dr("E_Medical_A")
            '' '' '' ''lbl_MedR_R_M.Text = dr("NMedical")
            '' '' '' ''lbl_MedR_R_A.Text = dr("NMedical_A")


            '' '' '' ''lbl_ConvRemb_E_M.Text = dr("E_ConvReimb")
            '' '' '' ''lbl_ConvRemb_E_A.Text = dr("E_ConvReimb_A")
            '' '' '' ''lbl_ConvRemb_R_M.Text = dr("NConvReimb")
            '' '' '' ''lbl_ConvRemb_R_A.Text = dr("NConvReimb_A")


            '' '' '' ''lbl_DrvSal_E_M.Text = dr("E_Driver")
            '' '' '' ''lbl_DrvSal_E_A.Text = dr("E_Driver_A")
            '' '' '' ''lbl_DrvSal_R_M.Text = dr("NDriver")
            '' '' '' ''lbl_DrvSal_R_A.Text = dr("NDriver_A")

            '' '' '' ''lbl_EntRemb_E_M.Text = dr("E_Entertainment")
            '' '' '' ''lbl_EntRemb_E_A.Text = dr("E_Entertainment_A")
            '' '' '' ''lbl_EntRemb_R_M.Text = dr("NEntertainment")
            '' '' '' ''lbl_EntRemb_R_A.Text = dr("NEntertainment_A")

            '' '' '' ''lbl_coCarVal_E_M.Text = dr("E_CoCarValue")
            '' '' '' ''lbl_coCarVal_E_A.Text = dr("E_CoCarValue_A")
            '' '' '' ''lbl_coCarVal_R_M.Text = dr("NCoCarValue")
            '' '' '' ''lbl_coCarVal_R_A.Text = dr("NCoCarValue_A")

            '' '' '' ''lbl_TOTABC_E_M.Text = dr("ETotalABC_M")
            '' '' '' ''lbl_TOTABC_E_A.Text = dr("ETotalABC_A")
            '' '' '' ''lbl_TOTABC_R_M.Text = dr("NTotalABC_M")
            '' '' '' ''lbl_TOTABC_R_A.Text = dr("NTotalABC_A")

            '' '' '' ''lbl_GMEI_E_M.Text = dr("E_GME")
            '' '' '' ''lbl_GMEI_E_A.Text = dr("E_GME_A")
            '' '' '' ''lbl_GMEI_R_M.Text = dr("NGME")
            '' '' '' ''lbl_GMEI_R_A.Text = dr("NGME_A")


            '' '' '' ''lbl_GPAI_E_M.Text = dr("E_GPA")
            '' '' '' ''lbl_GPAI_E_A.Text = dr("E_GPA_A")
            '' '' '' ''lbl_GPAI_R_M.Text = dr("NGPA")
            '' '' '' ''lbl_GPAI_R_A.Text = dr("NGPA_A")

            '' '' '' ''lbl_GrpTP_E_M.Text = dr("E_GroupTermPolicy")
            '' '' '' ''lbl_GrpTP_E_A.Text = dr("E_GroupTermPolicy_A")
            '' '' '' ''lbl_GrpTP_R_M.Text = dr("NGroupTermPol")
            '' '' '' ''lbl_GrpTP_R_A.Text = dr("NGroupTermPol_A")

            '' '' '' ''lbl_EDLI_E_M.Text = dr("E_EDLI")
            '' '' '' ''lbl_EDLI_E_A.Text = dr("E_EDLI_A")
            '' '' '' ''lbl_EDLI_R_M.Text = dr("NEDLI")
            '' '' '' ''lbl_EDLI_R_A.Text = dr("NEDLI_A")

            '' '' '' ''lbl_LeaveVal_E_M.Text = dr("E_LeaveValue")
            '' '' '' ''lbl_LeaveVal_E_A.Text = dr("E_LeaveValue_A")
            '' '' '' ''lbl_LeaveVal_R_M.Text = dr("NLeaveValue")
            '' '' '' ''lbl_LeaveVal_R_A.Text = dr("NLeaveValue_A")


            '' '' '' ''lbl_CTC_E_M.Text = dr("E_CTC_PM")
            '' '' '' ''lbl_CTC_E_A.Text = dr("E_CTC_PA")
            '' '' '' ''lbl_CTC_R_M.Text = dr("NCTC_PM")
            '' '' '' ''lbl_CTC_R_A.Text = dr("NCTC")

            '' '' '' ''lblSuper.Text = dr("sperAnnuNote")





            '' '' '' ''lbl_TA_E_Fur_All_M.Text = dr("E_FurAll_M")
            '' '' '' ''lbl_TA_E_Fur_All_A.Text = dr("E_FurAll_A")
            '' '' '' ''lbl_TA_R_Fur_All_M.Text = dr("Rd_FurAll_M")
            '' '' '' ''lbl_TA_R_Fur_All_A.Text = dr("Rd_FurAll_A")


            '' '' '' ''lbl_FurMaint_E_M.Text = dr("E_FurMaint_M")
            '' '' '' ''lbl_FurMaint_E_A.Text = dr("E_FurMaint_A")
            '' '' '' ''lbl_FurMaint_R_M.Text = dr("Rd_FurMaint_M")
            '' '' '' ''lbl_FurMaint_R_A.Text = dr("Rd_FurMaint_A")

            '' '' '' ''lbl_Tel_E_M.Text = dr("E_Tel_M")
            '' '' '' ''lbl_Tel_E_A.Text = dr("E_Tel_A")
            '' '' '' ''lbl_Tel_R_M.Text = dr("RD_Tel_M")
            '' '' '' ''lbl_Tel_R_A.Text = dr("RD_Tel_A")

            '' '' '' ''lbl_VechRoad_E_M.Text = dr("E_VehIns_M")
            '' '' '' ''lbl_VechRoad_E_A.Text = dr("E_VehIns_A")
            '' '' '' ''lbl_VechRoad_R_M.Text = dr("RD_VehIns_M")
            '' '' '' ''lbl_VechRoad_R_A.Text = dr("RD_VehIns_A")






            lblEmpName.Text = dr("name")
            lblSalCode.Text = dr("ecode")
            lblDesig.Text = dr("desg_code")

            lblBasic_E_M.Text = dr("E_Basic")
            lblBasic_E_A.Text = dr("E_Basic_A")
            lblBasic_R_M.Text = dr("NBasic")
            lblBasic_R_A.Text = dr("NBasic_A")


            lbl_HRA_E_M.Text = dr("E_HRA")
            lbl_HRA_E_A.Text = dr("E_HRA_A")
            lbl_HRA_R_M.Text = dr("NHRA")
            lbl_HRA_R_A.Text = dr("NHRA_A")

            lbl_CA_E_M.Text = dr("E_Colony")
            lbl_CA_E_A.Text = dr("E_Colony_A")
            lbl_CA_R_M.Text = dr("NColony")
            lbl_CA_R_A.Text = dr("NColony_A")


            lbl_PA_E_M.Text = dr("E_Personal")
            lbl_PA_E_A.Text = dr("E_Personal_A")
            lbl_PA_R_M.Text = dr("NPersonal")
            lbl_PA_R_A.Text = dr("NPersonal_A")


            lbl_SA_E_M.Text = dr("E_Special")
            lbl_SA_E_A.Text = dr("E_Special_A")
            lbl_SA_R_M.Text = dr("NSpecial")
            lbl_SA_R_A.Text = dr("NSpecial_A")



            lbl_TA_E_M.Text = dr("E_Transport")
            lbl_TA_E_A.Text = dr("E_Transport_A")
            lbl_TA_R_M.Text = dr("NTransport")
            lbl_TA_R_A.Text = dr("NTransport_A")


            lbl_ASA_E_M.Text = dr("E_ASA")
            lbl_ASA_E_A.Text = dr("E_ASA_A")
            lbl_ASA_R_M.Text = dr("NASA")
            lbl_ASA_R_A.Text = dr("NASA_A")



            lbl_UA_E_M.Text = dr("E_Uniform")
            lbl_UA_E_A.Text = dr("E_Uniform_A")
            lbl_UA_R_M.Text = dr("NUniform")
            lbl_UA_R_A.Text = dr("NUniform_A")


            lbl_Bonus_E_M.Text = dr("E_Bonus")
            lbl_Bonus_E_A.Text = dr("E_Bonus_A")
            lbl_Bonus_R_M.Text = dr("NBonus")
            lbl_Bonus_R_A.Text = dr("NBonus_A")


            lbl_CPF_E_M.Text = dr("E_PF")
            lbl_CPF_E_A.Text = dr("E_PF_A")
            lbl_CPF_R_M.Text = dr("NPF")
            lbl_CPF_R_A.Text = dr("NPF_A")


            lbl_Gratuity_E_M.Text = dr("E_Gratuity")
            lbl_Gratuity_E_A.Text = dr("E_Gratuity_A")
            lbl_Gratuity_R_M.Text = dr("NGratuity")
            lbl_Gratuity_R_A.Text = dr("NGratuity_A")


            lbl_ESI_E_M.Text = dr("E_ESI")
            lbl_ESI_E_A.Text = dr("E_ESI_A")
            lbl_ESI_R_M.Text = dr("NESI")
            lbl_ESI_R_A.Text = dr("NESI_A")


            lbl_SUP_E_M.Text = dr("E_Superannuation")
            lbl_SUP_E_A.Text = dr("E_Superannuation_A")
            lbl_SUP_R_M.Text = dr("NSuperannuation")
            lbl_SUP_R_A.Text = dr("NSuperannuation_A")



            lbl_LTA_E_M.Text = dr("E_LTA")
            lbl_LTA_E_A.Text = dr("E_LTA_A")
            lbl_LTA_R_M.Text = dr("NLTA")
            lbl_LTA_R_A.Text = dr("NLTA_A")



            lbl_MedR_E_M.Text = dr("E_Medical")
            lbl_MedR_E_A.Text = dr("E_Medical_A")
            lbl_MedR_R_M.Text = dr("NMedical")
            lbl_MedR_R_A.Text = dr("NMedical_A")


            lbl_ConvRemb_E_M.Text = dr("E_ConvReimb")
            lbl_ConvRemb_E_A.Text = dr("E_ConvReimb_A")
            lbl_ConvRemb_R_M.Text = dr("NConvReimb")
            lbl_ConvRemb_R_A.Text = dr("NConvReimb_A")


            lbl_DrvSal_E_M.Text = dr("E_Driver")
            lbl_DrvSal_E_A.Text = dr("E_Driver_A")
            lbl_DrvSal_R_M.Text = dr("NDriver")
            lbl_DrvSal_R_A.Text = dr("NDriver_A")

            lbl_EntRemb_E_M.Text = dr("E_Entertainment")
            lbl_EntRemb_E_A.Text = dr("E_Entertainment_A")
            lbl_EntRemb_R_M.Text = dr("NEntertainment")
            lbl_EntRemb_R_A.Text = dr("NEntertainment_A")

            lbl_coCarVal_E_M.Text = dr("E_CoCarValue")
            lbl_coCarVal_E_A.Text = dr("E_CoCarValue_A")
            lbl_coCarVal_R_M.Text = dr("NCoCarValue")
            lbl_coCarVal_R_A.Text = dr("NCoCarValue_A")

            lbl_TotalABCD_E_M.Text = dr("E_Total")
            lbl_TotalABCD_E_A.Text = dr("E_Total_A")
            lbl_TotalABCD_R_M.Text = dr("NTotal")
            lbl_TotalABCD_R_A.Text = dr("NTotal_A")

            lbl_GMEI_E_M.Text = dr("E_GME")
            lbl_GMEI_E_A.Text = dr("E_GME_A")
            lbl_GMEI_R_M.Text = dr("NGME")
            lbl_GMEI_R_A.Text = dr("NGME_A")


            lbl_GPAI_E_M.Text = dr("E_GPA")
            lbl_GPAI_E_A.Text = dr("E_GPA_A")
            lbl_GPAI_R_M.Text = dr("NGPA")
            lbl_GPAI_R_A.Text = dr("NGPA_A")

            lbl_GrpTP_E_M.Text = dr("E_GroupTermPolicy")
            lbl_GrpTP_E_A.Text = dr("E_GroupTermPolicy_A")
            lbl_GrpTP_R_M.Text = dr("NGroupTermPol")
            lbl_GrpTP_R_A.Text = dr("NGroupTermPol_A")

            lbl_EDLI_E_M.Text = dr("E_EDLI")
            lbl_EDLI_E_A.Text = dr("E_EDLI_A")
            lbl_EDLI_R_M.Text = dr("NEDLI")
            lbl_EDLI_R_A.Text = dr("NEDLI_A")

            lbl_LeaveVal_E_M.Text = dr("E_LeaveValue")
            lbl_LeaveVal_E_A.Text = dr("E_LeaveValue_A")
            lbl_LeaveVal_R_M.Text = dr("NLeaveValue")
            lbl_LeaveVal_R_A.Text = dr("NLeaveValue_A")


            lbl_CTC_E_M.Text = dr("E_CTC_PM")
            lbl_CTC_E_A.Text = dr("E_CTC_PA")
            lbl_CTC_R_M.Text = dr("NCTC_PM")
            lbl_CTC_R_A.Text = dr("NCTC")


            lblSuper.Text = dr("sperAnnuNote")




            lbl_TA_E_Fur_All_M.Text = dr("E_FurAll_M")
            lbl_TA_E_Fur_All_A.Text = dr("E_FurAll_A")
            lbl_TA_R_Fur_All_M.Text = dr("Rd_FurAll_M")
            lbl_TA_R_Fur_All_A.Text = dr("Rd_FurAll_A")


            lbl_FurMaint_E_M.Text = dr("E_FurMaint_M")
            lbl_FurMaint_E_A.Text = dr("E_FurMaint_A")
            lbl_FurMaint_R_M.Text = dr("Rd_FurMaint_M")
            lbl_FurMaint_R_A.Text = dr("Rd_FurMaint_A")

            lbl_Tel_E_M.Text = dr("E_Tel_M")
            lbl_Tel_E_A.Text = dr("E_Tel_A")
            lbl_Tel_R_M.Text = dr("RD_Tel_M")
            lbl_Tel_R_A.Text = dr("RD_Tel_A")

            lbl_VechRoad_E_M.Text = dr("E_VehIns_M")
            lbl_VechRoad_E_A.Text = dr("E_VehIns_A")
            lbl_VechRoad_R_M.Text = dr("RD_VehIns_M")
            lbl_VechRoad_R_A.Text = dr("RD_VehIns_A")

            lbl_VARPay_E_M.Text = dr("E_VarPay_M")
            lbl_VarPay_E_A.Text = dr("E_VarPay_A")
            lbl_VarPay_R_M.Text = dr("R_VarPay_M")
            lbl_VarPay_R_A.Text = dr("R_VarPay_A")


        End If
    End Sub

    'Protected Sub cmdFetch_Click(sender As Object, e As System.EventArgs) Handles cmdFetch.Click

    '    Try
    '        GetInfo(Request.QueryString("Ecode").ToString())
    '    Catch ex As Exception
    '        Response.Write("<script>alert('Imroper Data!! '" + ex.Message + "')</script>")
    '    End Try
    'End Sub

    'Protected Sub cmdClear_Click(sender As Object, e As System.EventArgs) Handles cmdClear.Click
    '    lblEmpName.Text = ""
    '    lblSalCode.Text = ""
    '    lblDesig.Text = ""

    '    lblBasic_E_M.Text = ""
    '    lblBasic_E_A.Text = ""
    '    lblBasic_R_M.Text = ""
    '    lblBasic_R_A.Text = ""


    '    lbl_HRA_E_M.Text = ""
    '    lbl_HRA_E_A.Text = ""
    '    lbl_HRA_R_M.Text = ""
    '    lbl_HRA_R_A.Text = ""

    '    lbl_CA_E_M.Text = ""
    '    lbl_CA_E_A.Text = ""
    '    lbl_CA_R_M.Text = ""
    '    lbl_CA_R_A.Text = ""


    '    lbl_PA_E_M.Text = ""
    '    lbl_PA_E_A.Text = ""
    '    lbl_PA_R_M.Text = ""
    '    lbl_PA_R_A.Text = ""


    '    lbl_SA_E_M.Text = ""
    '    lbl_SA_E_A.Text = ""
    '    lbl_SA_R_M.Text = ""
    '    lbl_SA_R_A.Text = ""



    '    lbl_TA_E_M.Text = ""
    '    lbl_TA_E_A.Text = ""
    '    lbl_TA_R_M.Text = ""
    '    lbl_TA_R_A.Text = ""


    '    lbl_ASA_E_M.Text = ""
    '    lbl_ASA_E_A.Text = ""
    '    lbl_ASA_R_M.Text = ""
    '    lbl_ASA_R_A.Text = ""



    '    lbl_UA_E_M.Text = ""
    '    lbl_UA_E_A.Text = ""
    '    lbl_UA_R_M.Text = ""
    '    lbl_UA_R_A.Text = ""


    '    lbl_Bonus_E_M.Text = ""
    '    lbl_Bonus_E_A.Text = ""
    '    lbl_Bonus_R_M.Text = ""
    '    lbl_Bonus_R_A.Text = ""


    '    lbl_CPF_E_M.Text = ""
    '    lbl_CPF_E_A.Text = ""
    '    lbl_CPF_R_M.Text = ""
    '    lbl_CPF_R_A.Text = ""


    '    lbl_Gratuity_E_M.Text = ""
    '    lbl_Gratuity_E_A.Text = ""
    '    lbl_Gratuity_R_M.Text = ""
    '    lbl_Gratuity_R_A.Text = ""


    '    lbl_ESI_E_M.Text = ""
    '    lbl_ESI_E_A.Text = ""
    '    lbl_ESI_R_M.Text = ""
    '    lbl_ESI_R_A.Text = ""


    '    lbl_SUP_E_M.Text = ""
    '    lbl_SUP_E_A.Text = ""
    '    lbl_SUP_R_M.Text = ""
    '    lbl_SUP_R_A.Text = ""



    '    lbl_LTA_E_M.Text = ""
    '    lbl_LTA_E_A.Text = ""
    '    lbl_LTA_R_M.Text = ""
    '    lbl_LTA_R_A.Text = ""



    '    lbl_MedR_E_M.Text = ""
    '    lbl_MedR_E_A.Text = ""
    '    lbl_MedR_R_M.Text = ""
    '    lbl_MedR_R_A.Text = ""


    '    lbl_ConvRemb_E_M.Text = ""
    '    lbl_ConvRemb_E_A.Text = ""
    '    lbl_ConvRemb_R_M.Text = ""
    '    lbl_ConvRemb_R_A.Text = ""


    '    lbl_DrvSal_E_M.Text = ""
    '    lbl_DrvSal_E_A.Text = ""
    '    lbl_DrvSal_R_M.Text = ""
    '    lbl_DrvSal_R_A.Text = ""

    '    lbl_EntRemb_E_M.Text = ""
    '    lbl_EntRemb_E_A.Text = ""
    '    lbl_EntRemb_R_M.Text = ""
    '    lbl_EntRemb_R_A.Text = ""

    '    lbl_coCarVal_E_M.Text = ""
    '    lbl_coCarVal_E_A.Text = ""
    '    lbl_coCarVal_R_M.Text = ""
    '    lbl_coCarVal_R_A.Text = ""

    '    'lbl_TOTABC_E_M.Text = ""
    '    'lbl_TOTABC_E_A.Text = ""
    '    'lbl_TOTABC_R_M.Text = ""
    '    'lbl_TOTABC_R_A.Text = ""

    '    lbl_GMEI_E_M.Text = ""
    '    lbl_GMEI_E_A.Text = ""
    '    lbl_GMEI_R_M.Text = ""
    '    lbl_GMEI_R_A.Text = ""


    '    lbl_GPAI_E_M.Text = ""
    '    lbl_GPAI_E_A.Text = ""
    '    lbl_GPAI_R_M.Text = ""
    '    lbl_GPAI_R_A.Text = ""

    '    lbl_GrpTP_E_M.Text = ""
    '    lbl_GrpTP_E_A.Text = ""
    '    lbl_GrpTP_R_M.Text = ""
    '    lbl_GrpTP_R_A.Text = ""

    '    lbl_EDLI_E_M.Text = ""
    '    lbl_EDLI_E_A.Text = ""
    '    lbl_EDLI_R_M.Text = ""
    '    lbl_EDLI_R_A.Text = ""

    '    lbl_LeaveVal_E_M.Text = ""
    '    lbl_LeaveVal_E_A.Text = ""
    '    lbl_LeaveVal_R_M.Text = ""
    '    lbl_LeaveVal_R_A.Text = ""


    '    lbl_CTC_E_M.Text = ""
    '    lbl_CTC_E_A.Text = ""
    '    lbl_CTC_R_M.Text = ""
    '    lbl_CTC_R_A.Text = ""

    '    lblSuper.Text = ""

    'End Sub

    Protected Sub form1_Load(sender As Object, e As System.EventArgs) Handles form1.Load
        If (Session("empcode").ToString <> "") Then
        Else
            Response.Redirect("~\login.aspx")
        End If
    End Sub
End Class


