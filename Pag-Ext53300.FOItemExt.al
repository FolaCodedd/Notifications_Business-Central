pageextension 53300 "FO Item List Ext" extends "Item List"
{
    trigger OnOpenPage()
    var
        ItemRec: Record Item;
        ZeroInvItems: Integer;
        ZeroInventoryNotification: Notification;
        ZeroInventoryNotificationLbl: Label 'There are %1 Items with 0 stock left in the inventory.';
    begin
        ZeroInvItems := 0;
        ItemRec.SetLoadFields(Inventory);
        ItemRec.CalcFields(Inventory);
        ItemRec.SetFilter(Inventory, '%1', 0);
        if ItemRec.find('-') then begin
            ZeroInvItems := ItemRec.count;
            ZeroInventoryNotification.Message(StrSubstNo(ZeroInventoryNotificationLbl, ZeroInvItems));
            ZeroInventoryNotification.Scope := NotificationScope::LocalScope;
            ZeroInventoryNotification.AddAction('Print Report', Codeunit::"FO Generate Zero Stock Report", 'RunReport');
            ZeroInventoryNotification.Send();
        end;
    end;

}
