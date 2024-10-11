page 50101 "BSB Book List"
{
    Caption = 'Books';
    PageType = List;
    SourceTable = "BSB Book";
    Editable = false;
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "BSB Book Card";

    layout
    {
        area(Content)
        {
            repeater(Books)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(ISBN; Rec.ISBN)
                {
                    ToolTip = 'Specifies the value of the ISBN field.', Comment = '%';
                }
                field(Author; Rec.Author)
                {
                    ToolTip = 'Specifies the value of the Author field.', Comment = '%';
                }
                field("No. of Pages"; Rec."No. of Pages")
                {
                    ToolTip = 'Specifies the value of the No. of Pages field.', Comment = '%';
                    Visible = false;
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Links; Links) { ApplicationArea = All; }
            systempart(Notes; Notes) { ApplicationArea = All; }
        }
    }
    actions
    {
        area(Processing)
        {
            action("1-Klassisch")
            {
                Caption = '1-Klassisch';
                ApplicationArea = All;
                Image = Process;

                trigger OnAction()
                begin
                    case Rec.Type of
                        "BSB Book Type"::" ":
                            begin
                                StartDeliverBookDefault();
                                StartDeployBookDefault();
                            end;
                        "BSB Book Type"::Hardcover:
                            begin
                                StartDeliverBookHardcover();
                                StartDeployBookHardcover();
                            end;
                        "BSB Book Type"::Paperback:
                            begin
                                StartDeliverBookPaperback();
                                StartDeployBookPaperback();
                            end;
                    end;
                end;
            }
        }
    }

    local procedure StartDeliverBookDefault()
    begin
        Message('Procedure StartDeliverBookDefault not implemented.');
    end;

    local procedure StartDeployBookDefault()
    begin
        Message('Procedure StartDeployBookDefault not implemented.');
    end;

    local procedure StartDeliverBookHardcover()
    begin
        Error('Aus Lager picken');
    end;

    local procedure StartDeployBookHardcover()
    begin
        Error('Versand UPS PREMIUM');
    end;

    local procedure StartDeliverBookPaperback()
    begin
        Error('Print on Demand');
    end;

    local procedure StartDeployBookPaperback()
    begin
        Error('Versand DPD Standard');
    end;
}