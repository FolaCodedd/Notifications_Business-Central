codeunit 53300 "FO Generate Zero Stock Report"
{
    var

        ZeroStockItemRec: Record Item;

        ZeroStockItemsReport: Report "FO Zero Inventory Items";

    procedure RunReport(ZeroInventoryNotification: Notification)
    begin
        Clear(ZeroStockItemsReport);

        ZeroStockItemRec.Reset();
        ZeroStockItemRec.CalcFields(Inventory);
        ZeroStockItemRec.SetFilter(Inventory, '%1', 0);
        if ZeroStockItemRec.find('-') then begin
            ZeroStockItemsReport.SetTableView(ZeroStockItemRec);
            ZeroStockItemsReport.UseRequestPage(false);
            ZeroStockItemsReport.Run();
        end;
    end;
}
