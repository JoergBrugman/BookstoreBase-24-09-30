codeunit 50102 "BSB Book Type Hardcover Impl." implements "BSB Book Type Process"
{
    procedure StartDeliverBook()
    begin
        Message('Aus Lager picken');
    end;

    procedure StartDeployBook()
    begin
        Message('Versand UPS PREMIUM');
    end;

}