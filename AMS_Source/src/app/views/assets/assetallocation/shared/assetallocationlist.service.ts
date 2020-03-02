import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod, HttpModule } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';

import { EmployeeDetailsModel, AssetTypeModel, AssetCategoryModel, AssetLocationModel,
     UnallocatedAssetsModel, GetHistoryModel, AssetSpecifications}
    from './assetallocationlist.model';
import { AppGlobals } from '../../../../app.global';




@Injectable()
export class AssetAllocationService {
    selectedEmployee: EmployeeDetailsModel;
    employeelist: EmployeeDetailsModel[];
    selectedAssetType: AssetTypeModel;
    assetTypeList: AssetTypeModel[];
    selectedAssetCategory: AssetCategoryModel;
    assetCategoryList: AssetCategoryModel[];
    selectedLocation: AssetLocationModel;
    assetLocationList: AssetLocationModel[];
    selectedUnallocatedAsset: UnallocatedAssetsModel;
    unallocatedAssetList: UnallocatedAssetsModel[];
    selectedgetHistory: GetHistoryModel;
    getHistoryList: GetHistoryModel[];
    selectedAssetSpec:AssetSpecifications;
    assetSpecList:AssetSpecifications[];
   public currentUser:any;
    constructor(private http: Http, private _global: AppGlobals) {
        this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    }
    GetLocationDetails() {
        this.http.get(this._global.baseAppUrl + '/GetLocationDetails')
            .map((data: Response) => {
                return data.json() as AssetLocationModel[];
            }).toPromise().then(x => { this.assetLocationList = x; })
    }
    GetEmployeeDetails() {
        this.http.get(this._global.baseAppUrl + '/GetEmployeeDetails')
            .map((data: Response) => {
                return data.json() as EmployeeDetailsModel[];
            }).toPromise().then(x => { this.employeelist = x; })
    }
    GetAssetType() {
        this.http.get(this._global.baseAppUrl + '/GetAssetType')
            .map((data: Response) => {
                return data.json() as AssetTypeModel[];
            }).toPromise().then(x => { this.assetTypeList = x; })
    }
    getAssetSpecificationsList(AssetId){
       
        this.http.get(this._global.baseAppUrl +'/GetAssetSpecification?AssetId='+ AssetId)
            .map((data : Response) => {
            return data.json() as AssetSpecifications[];}).toPromise().then(x=>{this.assetSpecList = x;})
    }
    postLocationdetails(id, loc) {
        var body = JSON.stringify(loc);
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Put, headers: headerOptions });
        return this.http.put(this._global.baseAppUrl + '/UpdateLocationDetails?AssetLocationId=' + id, body, requestOptions).map(x => x.json());
    }

   
    UpdateAssetAllocations(AssetId: string, AssetAllocationArray: Array<any>) {
       var CreatedBy=this.currentUser.UserId;
        var body = {AssetId, AssetAllocationArray,CreatedBy };
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
        return this.http.post(this._global.baseAppUrl+'/InsertAssetAllocations?AssetId='+AssetId, body, requestOptions).map(x => x.json());
    }
      
    GetAssetAllocationByAssetId(AssetId) {
        this.http.get(this._global.baseAppUrl + '/GetAssetAllocationByAssetId?AssetId=' +AssetId)
            .map((data: Response) => {
                return data.json() as GetHistoryModel[];
            }).toPromise().then(x => { this.getHistoryList = x; })
    }
    getAssetList(){
        this.http.get(this._global.baseAppUrl +'/GetAssets')
            .map((data : Response) => {
            return data.json() as UnallocatedAssetsModel[];
        }).toPromise().then(x=>{this.unallocatedAssetList = x;})
    }


}