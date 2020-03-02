
export class ApproveAssetQuotationRaisePO {
    AssetQuotationId: string;
    AssetRequestId: string;
    AssetTypeId: string;
    AssetTypeName: string;
    VendorName: string;
    AssetStatusName: string;
    ApprovedBy: string;
    ApprovedOn: string;
    EmployeeName: string;
    ARNumber: string;
  
}

export class PaymentMode {
    constructor(public id: number, public name: string) { }
  }


export class PaymentDetailss{
    Cheque: string;
    CC: string;
    ChequeNo: string;
    ChequeAmount: string;
    ChequeDate:string;
}

export class ViewRaisePOModel{
    PONumber: string;
    AssetTypeName: string;
    Description: string;
    Quantity: string;
    Price: string;
    CGST: string;
    SGST: string;
    TotalPrice: string;
    ChequeNumber:string;
    CreditcardNumber:string;
    TransactionID:string;
}

export class ARNumber{
    ARNumber: string;
}
export class PaymentDetails{
    PaymentMode:string;
    BaseAmount: string;
    Tax: string;
    PaymentId: string;
    ARNumber: string;
    AssetType: string;
    RequestedBy: string;
    CreatedOn: string;
}

export class OtherAssetTypeSpecification{
    AssetTypeOtherpecification: string;
}
