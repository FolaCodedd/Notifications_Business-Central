report 53300 "FO Zero Inventory Items"
{
    Caption = 'Zero Inventory Items';
    DefaultLayout = RDLC;
    RDLCLayout = 'Report Layouts\Zero Inventory Items.rdl';
    
    dataset
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(UnitCost; "Unit Cost")
            {
            }
            column(VendorNo; "Vendor No.")
            {
            }
            column(Picture; CompInfo.Picture)
            {

            }
            column(CompName; CompInfo.Name)
            {

            }
            column(Counter; Counter)
            {

            }
            trigger OnAfterGetRecord()
            begin
                Counter += 1;
            end;

            trigger OnPreDataItem()
            begin
                CompInfo.get;
                CompInfo.CalcFields(Picture);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    var
        CompInfo: record "Company Information";
        Counter: Integer;
}
