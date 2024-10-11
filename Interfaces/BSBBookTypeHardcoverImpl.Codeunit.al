codeunit 50102 "BSB Book Type Hardcover Impl."
{
    procedure StartDeliverBookHard()
    begin
        Message('Aus Lager picken');
    end;

    procedure StartDeployBook()
    begin
        Message('Versand UPS PREMIUM');
    end;

}