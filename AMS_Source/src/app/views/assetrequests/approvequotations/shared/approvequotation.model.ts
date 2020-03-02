export class ApproveQuotation {
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
    ARNumber:string;
}


export class ApproveAssetQuotation{
    AssetQuotationId: string;
    AssetRequestId: string;
    AssetTypeId: string;
    AssetTypeName: string;
    VendorName: string;
    AssetStatusName: string;
    Price: string;
    Comments: string;
    Documents: string;
    AssetStatusId: string;
    Quantity: string;
    CGST: string;
    SGST: string;
    ARNumber:string;
}

export class ApproveQuotationApprovalComments{
    QuotationApproveComments: string;
    ApprovedBy: string;
    ApprovedOn: string;
    AssetQuotationId: string;
}