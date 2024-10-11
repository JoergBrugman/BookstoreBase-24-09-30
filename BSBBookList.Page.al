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

            action("2-Codeunits")
            {
                Caption = '2-Codeunits';
                ApplicationArea = All;
                Image = Process;

                trigger OnAction()
                var
                    BSBBookTypeDefaultImpl: Codeunit "BSB Book Type Default Impl.";
                    BSBBookTypeHardcoverImpl: Codeunit "BSB Book Type Hardcover Impl.";
                    BSBBookTypePaperbackImpl: Codeunit "BSB Book Type Paperback Impl.";
                begin
                    case Rec.Type of
                        "BSB Book Type"::" ":
                            begin
                                BSBBookTypeDefaultImpl.StartDeployBook();
                                BSBBookTypeDefaultImpl.StartDeliverBook();
                            end;
                        "BSB Book Type"::Hardcover:
                            begin
                                BSBBookTypeHardcoverImpl.StartDeployBook();
                                BSBBookTypeHardcoverImpl.StartDeliverBookHard();
                            end;
                        "BSB Book Type"::Paperback:
                            begin
                                BSBBookTypePaperbackImpl.StartDeployBook();
                                BSBBookTypePaperbackImpl.StartDeliverBook();
                            end;
                    end;
                end;
            }
        }
    }
    #region Local Procedures
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
        Message('Aus Lager picken');
    end;

    local procedure StartDeployBookHardcover()
    begin
        Message('Versand UPS PREMIUM');
    end;

    local procedure StartDeliverBookPaperback()
    begin
        Message('Print on Demand');
    end;

    local procedure StartDeployBookPaperback()
    begin
        Message('Versand DPD Standard');
    end;
    #endregion
}