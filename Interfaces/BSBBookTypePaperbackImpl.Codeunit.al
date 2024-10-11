codeunit 50103 "BSB Book Type Paperback Impl." implements "BSB Book Type Process"
{
    procedure StartDeliverBook()
    begin
        Message('Print on Demand');
    end;

    procedure StartDeployBook()
    begin
        Message('Versand DPD Standard');
    end;
}