export class AssetCategoryModel {
    Id: string;
    Name: string;
   };

export class EmployeeDetailsModel {
    eUserId: string;
    EmployeeId: string;
    FirstName: string;
    LastName: string;
};

export class AssetTypeModel {
    AssetTypeId:string;
    Name :string;
    AssetCategoryId :string;
    AssetCategoryName :string;
    isActive :boolean;
};

export class AssetLocationModel {
    Id: string;
    Name: string;
    Address: string;
    CreatedBy: string;
    LastModifiedBy: string;
};

export class UnallocatedAssetsModel {
    AssetCategoryName :string;
    AssetTypeName :string;
    AssetAllocationId :string;
    AssetId :string;
    AssetRequestId :string;
    AssetTagNumber :string;
    ServiceTagNumber :string;
    LocationId:string;
    EmployeeId:string;
    LocationName:string;
    EmployeeName:string;
    CreatedBy: string;
    LastModifiedBy: string;
    Comments: string;
   
};
export class AssetSpecifications{
    
    AssetName:string;
    AssetId:string;
    AssetSpecificationValue:string;
    CreatedOn :string;    
    AssetTagNumber: string;
    AssetTypeSpecificationName: string;
};
export class GetHistoryModel{
    AssetCategoryName :string;
    AssetTypeName :string;
    AssetAllocationId :string;
    AssetId :string;
    AssetRequestId :string;
    AssetTagNumber :string;
    EmployeeName:string;
    AssetAllocatedOn : string;
    AssetCancelledOn:string;
  }