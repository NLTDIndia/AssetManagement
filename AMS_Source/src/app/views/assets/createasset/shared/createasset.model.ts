export class CreateAsset{
    AssetIdentifier: string;
    Price: string;
    PurchaseOrderOn: string;
    ActivationDate: string;
    ExpiryDate: string;
    ServiceTagNumber: string;
    CreatedBy: string;
    AssetTypeId: string;
    AssetCategoryId : string;
    AssetCategoryName : string;
    SpecArray: Array<any>;
}

export interface IAssetTypeSpec{
    AssetTypeSpecId:string,
    AssetTypeId: string;
    AssetTypeName: string;
    ValueType: string;
    Value: string;
    AssetCategoryId : string;
    AssetCategoryName : string;
}

export interface IAssetCategory{  
    AssetTypeId: string;
    AssetTypeName: string;   
    AssetCategoryId : string;
    AssetCategoryName : string;
}


export interface EmployeeDetails{
    eUserId: string;
    EmployeeId: string;
    FirstName: string;
    LastName: string;
}