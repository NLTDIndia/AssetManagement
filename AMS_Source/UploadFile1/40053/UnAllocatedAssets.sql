Alter view UnallocatedAssets as
select aa.AssetAllocationId,a.AssetId,a.AssetTagNumber,a.ServiceTagNumber ,ats.Name as AssetType, ac.Name as AssetCategory, e. FirstName, al.Name as [Location], al.Id locationId,e.UserId empId from assets a
inner join AssetAllocation aa on a.AssetId=aa.AssetId
inner join AssetRequest ar on a.AssetRequestId = ar.Id
inner join AssetType ats on ar.AssetTypeId = ats.Id
inner join AssetCategory ac on ats.AssetCategoryId = ac.Id
inner join Employee e on aa.EmployeeId =e.UserId
inner join AssetLocation al on aa.LocationId =al.Id
where aa.AssetCanceledOn is null
group by aa.AssetAllocationId, a.AssetId, a.AssetTagNumber, a.ServiceTagNumber, ats.Name, ac.Name , e. FirstName, al.Name , al.Id,e.UserId