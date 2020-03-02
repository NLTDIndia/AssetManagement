export class Quotation {
    AssetRequestId: string;
    AssetTypeId: string;
    AssetTypeName
    IsActive: string;
    LocationId: string;
    LocationName: string;
    AssetStatusId: string;
    AssetStatusName: string;
    CreatedBy: string;
    CreatedOn: string;
    EmployeeName: string;
    ARNumber: string;
    Quantity: string;
    strCreatedOn: string;
    QuotationCount:string;
}


export class AssetQuotation {
    AssetQuotationId: string;
    AssetRequestId: string;
    AssetTypeId: string;
    AssetTypeName: string;
    VendorName: string;
    AssetStatusName: string;
    Price: string;
    Comments: string;
    Documents: Array<any>;
    AssetStatusId: string;
    QuotationCount:string;
    IsActive: string;
    CGST: string;
    SGST: string;
    FileName: Array<any>;
    FilePath:Array<any>;
    ARNumber:string;  
    CreatedBy: string;
    CreatedOn: string; 
    EmployeeName: string;
}

export class Vendor {
    Id: string;
    Name: string;

}