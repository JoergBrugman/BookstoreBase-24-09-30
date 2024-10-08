report 50100 "BSB Customer List"
{
    Caption = 'Customer - List';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'BSBCustomerList.Report.rdlc';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No_Customer; "No.") { IncludeCaption = true; }
            column(Name_Customer; Name) { IncludeCaption = true; }
            column(CountryRegionCode_Customer; "Country/Region Code") { IncludeCaption = true; }
            column(SalespersonCode_Customer; "Salesperson Code") { IncludeCaption = true; }
            column(SalesLCY_Customer; "Sales (LCY)") { IncludeCaption = true; }
            column(BalanceLCY_Customer; "Balance (LCY)") { IncludeCaption = true; }
            column(ProfitLCY_Customer; "Profit (LCY)") { IncludeCaption = true; }
            column(Name_SalespersonPurchaser; SalespersonPurchaser.Name) { IncludeCaption = true; }

            trigger OnAfterGetRecord()
            begin
                // Unterdrücken von Debitoren, die in allen Beträgen 0 haben
                if ("Sales (LCY)" = 0) and ("Profit (LCY)" = 0) and ("Balance (LCY)" = 0) then
                    CurrReport.Skip();

                // Country/Region Code für inländische Debitoren patchen
                if "Country/Region Code" = '' then
                    "Country/Region Code" := CompanyInformation."Country/Region Code";

                if not SalespersonPurchaser.Get("Salesperson Code") then
                    SalespersonPurchaser.Init();
            end;
        }
    }
    labels
    {
        ReportCaptionLbl = 'Customer - List';
    }

    trigger OnPreReport()
    begin
        CompanyInformation.Get();
    end;

    var
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        CompanyInformation: Record "Company Information";
}