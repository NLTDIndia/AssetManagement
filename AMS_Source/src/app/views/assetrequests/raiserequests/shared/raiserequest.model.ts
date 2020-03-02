export class RaiseRequest{
    Id: string;
    AssetRequestId: string;
    AssetTypeId: string;
    Name: string;
    LocationId: string;
    EmployeeId: string;
    CreatedBy: string;
    LastModifiedBy: string;
    AssetTypeName: string;
    ValueType: string;
    SpecArray: Array<any>;
    Comments: string;
    Quantity: string;
    AssetCategoryId : string;
    AssetCategoryName : string;
    EmployeeName: string;
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