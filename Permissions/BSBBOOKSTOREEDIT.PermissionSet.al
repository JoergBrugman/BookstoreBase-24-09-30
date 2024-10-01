permissionset 50100 "BSB BOOKSTORE, EDIT"
{
    Caption = 'Edit and Create Books etc.';

    Assignable = true;
    Permissions = tabledata "BSB Book" = RIMD,
        table "BSB Book" = X;
}