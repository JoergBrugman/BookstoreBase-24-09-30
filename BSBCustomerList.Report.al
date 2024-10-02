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
        }
    }
    labels
    {
        ReportCaptionLbl = 'Customer - List';
    }
}