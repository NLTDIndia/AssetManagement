import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod, HttpModule } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';
import { catchError, map, tap } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';


import { AssetType } from '../../../admin/assettypes/shared/assettype.model';
import { AssetCategory } from '../../../admin/asset-categories/shared/asset.model';
import { RaiseRequest, IAssetTypeSpec, EmployeeDetails, IAssetCategory } from './raiserequest.model';
import { Location } from '../../../admin/locations/shared/location.model';

import { AppGlobals } from '../../../../app.global';

@Injectable()
export class RaiseRequestService {

    selectedRaiseRequest: RaiseRequest;
    raiseRequestList: RaiseRequest[];

    SelectedRaiseRequestdList: RaiseRequest;
    raiseRequestdList: RaiseRequest[];

    selectedAssetTypeSpec: IAssetTypeSpec;
    assetTypeSpecList: IAssetTypeSpec[];
    filteredassetTypeSpecList: IAssetTypeSpec[];
    tassetTypeSpecList: IAssetTypeSpec[];
    
    selectedAssetType: AssetType;
    assetTypeList: AssetType[];

    selectedLocation: Location;
    locationList: Location[];

    SelectedEmployee: EmployeeDetails;
    employeeList: EmployeeDetails[];

    selectedAssetCategory: AssetCategory;
    assetCategoryList: AssetCategory[];

    selectedAssetCategorySpec:IAssetCategory;
    assetCategorySpecList : IAssetCategory[];
    filteredassetCategoryList: IAssetCategory[];
    tassetCategoryList: IAssetCategory[];
    public currentUser: any;
    
    constructor(private http: Http, private _global: AppGlobals) {

        http.get(this._global.baseAppUrl + '/GetCategoryDetails').map((data: Response) => {
            return data.json() as AssetCategory[];
        }).toPromise().then(x => { this.assetCategoryList = x; })

        http.get(this._global.baseAppUrl + '/GetAssetType').map((data: Response) => {
            return data.json() as IAssetCategory[];
        }).toPromise().then(x => { this.assetCategorySpecList = x; })

        this.http.get(this._global.baseAppUrl + '/GetAssetTypeSpec')
            .map((data: Response) => {
                return data.json() as IAssetTypeSpec[];
            }).toPromise().then(x => { this.assetTypeSpecList = x; })

        this.http.get(this._global.baseAppUrl + '/GetLocationDetails')
            .map((data: Response) => {
                return data.json() as Location[];
            }).toPromise().then(x => { this.locationList = x; })

        this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    }

    postRaiseRequest(AssetTypeId: string, AssetLocationId: string, Quantity: string, Comments: string, Options: string, AssetRequestSpec: Array<any>) {
        
        var createdBy = this.currentUser.UserId;
        var body = { AssetTypeId, AssetLocationId, Quantity, Comments, Options, AssetRequestSpec, createdBy };
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
        return this.http.post(this._global.baseAppUrl + '/InsertRaiseRequestDetails', body, requestOptions).map(x => x.json());
    }

    postEx(){
        this.http.post("",{}).subscribe()
    }

    getRaiseRequestList() {
        this.http.get(this._global.baseAppUrl + '/GetRaiseRequestDetails')
            .map((data: Response) => {
                return data.json() as RaiseRequest[];
            }).toPromise().then(x => { this.raiseRequestdList = x; })
    }

    deleteRaiseRequest(id, loginId) {
        var LastModifiedBy = loginId;
        return this.http.delete(this._global.baseAppUrl + '/DeleteRaiseRequestById?id=' + id + '&LastModifiedBy='+LastModifiedBy).map(res => res.json());
    }

    postSendRaiseRequst(id, loginId) {
        var LastModifiedBy = loginId;
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
        return this.http.post(this._global.baseAppUrl + '/SendRaiseRequest?id=' + id + '&LastModifiedBy='+LastModifiedBy, requestOptions).map(x => x.json());
    }

    getAssetType(AssetCategoryId){
        return this.http.get(this._global.baseAppUrl + '/GetAssetType?AssetCategoryId='+AssetCategoryId)
        .map(x => x.json() as IAssetCategory[]);
    }

}