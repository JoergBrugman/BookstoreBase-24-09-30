page 50102 "BSB Book Factbox"
{
    Caption = 'Book Details';  // Sorgt für den Fentertitel
    PageType = CardPart;
    SourceTable = "BSB Book";
    Editable = false;

    layout
    {
        area(Content)
        {

            field("No."; Rec."No.")
            {
                Caption = 'Book No.'; //Ändert die Standard-Fieldcaption-Beschriftung
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Code field.', Comment = '%';

                trigger OnDrillDown()
                begin
                    ShowDetail();
                end;
            }
            field(Description; Rec.Description)
            {
                Caption = 'Book Description';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Description field.', Comment = '%';
            }
            field("Date of Publishing"; Rec."Date of Publishing")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Date of Publishing field.', Comment = '%';
            }
            field("No. of Pages"; Rec."No. of Pages")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the No. of Pages field.', Comment = '%';
            }
            field(Author; Rec.Author)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Author field.', Comment = '%';
            }
        }
    }

    local procedure ShowDetail()
    begin
        Rec.ShowCard();
    end;
}