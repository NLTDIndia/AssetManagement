export class MaterializePOModel {
    AssetQuotationId: string;
    AssetRequestId: string;
    AssetTypeId: string;
    AssetTypeName: string;
    VendorName: string;
    AssetStatusName: string;
    ApprovedBy: string;
    ApprovedOn: string;
    EmployeeName: string;
    Location:string;
}


export class AssetRequestPaymentsModel{
    AssetRequestId: string;
    PaymentModeName: string;
    ChequeAmount: string;
    CreditCardNo: string;
    CreditCardOwner: string;
    ChequeNo: string;
    ChequeDate: string;
    ChequeBankName: string;
    ChequeBranch: string;
    DC_TransactionIdentifier: string;
    DC_Transferer: string;
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
    AssetTypeOtherSpecification: string;
}

export class AssetTypePaymentBalance{
    Status: string;
    BalanceAmount: string;
}
