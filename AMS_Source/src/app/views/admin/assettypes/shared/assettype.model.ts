export class AssetType{
    AssetTypeId: string;
    Name: string;
    AssetCategoryId: string;
    AssetCategoryName: string;
    IsActive: boolean;
    SpecificationArray: Array<any>;
    CreatedBy: string;
    LastModifiedBy: string;
    AddonsTypeId: string;
}

export class AssetAddonsType{
    Id: string;
    AddonsName: string;
}