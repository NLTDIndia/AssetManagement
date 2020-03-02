export class Asset {
    AssetCategoryName: string;
    AssetTypeName: string;
    AssetAllocationId: string;
    AssetId: string;
    AssetRequestId: string;
    AssetTagNumber: string;
    ServiceTagNumber: string;
    LocationId: string;
    EmployeeId: string;
    LocationName: string;
    EmployeeName: string;
    CreatedBy: string;
    LastModifiedBy: string;
    Comments: string;
};
export class AssetSpecifications {

    AssetName: string;
    AssetId: string;
    AssetSpecificationValue: string;
    CreatedOn: string;
    AssetTagNumber: string;
    AssetTypeSpecificationName: string;
};
export class AssetAllocation {
    AssetAllocatedOn: string;
    AssetCanceledOn: string;
};
export class GetHistoryModel {
    AssetCategoryName: string;
    AssetTypeName: string;
    AssetAllocationId: string;
    AssetId: string;
    AssetRequestId: string;
    AssetTagNumber: string;
    EmployeeName: string;
    AssetAllocatedOn: string;
    AssetCancelledOn: string;
}