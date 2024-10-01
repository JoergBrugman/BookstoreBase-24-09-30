page 50100 "BSB Book Card"
{
    Caption = 'Book Card';
    PageType = Card;
    SourceTable = "BSB Book";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                    Importance = Promoted;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Serach Description field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                }
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Author field.', Comment = '%';
                    Importance = Promoted;
                }
                field(Type; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field(ISBN; Rec.ISBN)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ISBN field.', Comment = '%';
                    Importance = Additional;
                }
                field(Created; Rec.Created)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created field.', Comment = '%';
                    Importance = Additional;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Date Modified field.', Comment = '%';
                    Importance = Additional;
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Author Provision %"; Rec."Author Provision %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Author Provision % field.', Comment = '%';
                }
            }
            group(Publishing)
            {
                Caption = 'Publishing';
                field("Edition No."; Rec."Edition No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Edition No. field.', Comment = '%';
                    Importance = Promoted;
                }
                field("No. of Pages"; Rec."No. of Pages")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. of Pages field.', Comment = '%';
                }
                field("Date of Publishing"; Rec."Date of Publishing")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Publishing field.', Comment = '%';
                    Importance = Promoted;
                }
            }

        }
        area(FactBoxes)
        {
            systempart(Links; Links) { ApplicationArea = All; }
            systempart(Notes; Notes) { ApplicationArea = All; }
        }
    }
}