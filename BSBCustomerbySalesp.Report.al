report 50101 "BSB Customer by Salesp."
{
    Caption = 'Customer by Salesperson';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'BSBCustomerbySalesp.Report.rdlc';

    dataset
    {
        dataitem(SingleRowData; Integer)
        {
            DataItemTableView = sorting(Number) where(Number = const(1));
            column(COMPANYNAME; CompanyProperty.DisplayName()) { }

        }
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Salesperson Code", "Customer Posting Group";

            column(No_Customer; "No.") { IncludeCaption = true; }
            column(Name_Customer; Name) { IncludeCaption = true; }
            column(CountryRegionCode_Customer; "Country/Region Code") { IncludeCaption = true; }
            column(SalespersonCode_Customer; "Salesperson Code") { IncludeCaption = true; }
            column(SalesLCY_Customer; "Sales (LCY)") { IncludeCaption = true; }
            column(BalanceLCY_Customer; "Balance (LCY)") { IncludeCaption = true; }
            column(ProfitLCY_Customer; "Profit (LCY)") { IncludeCaption = true; }

            trigger OnAfterGetRecord()
            begin
                // Unterdrücken von Debitoren, die in allen Beträgen 0 haben
                if ("Sales (LCY)" = 0) and ("Profit (LCY)" = 0) and ("Balance (LCY)" = 0) then
                    CurrReport.Skip();
                // Country/Region Code für inländische Debitoren patchen
                if "Country/Region Code" = '' then
                    "Country/Region Code" := CompanyInformation."Country/Region Code";
            end;
        }
    }
    labels
    {
        ReportCaptionLbl = 'Customer by Salesperson';
    }

    trigger OnPreReport()
    begin
        CompanyInformation.Get();
    end;

    var
        CompanyInformation: Record "Company Information";
}