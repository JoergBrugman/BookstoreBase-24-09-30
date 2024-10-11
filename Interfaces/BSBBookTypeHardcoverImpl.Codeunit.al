codeunit 50102 "BSB Book Type Hardcover Impl." implements "BSB Book Type Process"
{
    procedure StartDeployBook()
    begin
        Message('Aus Lager picken');
    end;

    procedure StartDeliverBook()
    begin
        Message('Versand UPS PREMIUM');
    end;

}