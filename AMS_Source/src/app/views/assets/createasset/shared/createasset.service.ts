import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod, HttpModule } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';
import { catchError, map, tap } from 'rxjs/operators';


import { AssetType } from '../../../admin/assettypes/shared/assettype.model';
import { AssetCategory } from '../../../admin/asset-categories/shared/asset.model';
import { CreateAsset, IAssetTypeSpec, EmployeeDetails, IAssetCategory } from './createasset.model';
import { Location } from '../../../admin/locations/shared/location.model';

import { AppGlobals } from '../../../../app.global';

@Injectable()
export class CreateAssetService {

    selectedCreateAsset: CreateAsset;

    selectedAssetTypeSpec: IAssetTypeSpec;
    assetTypeSpecList: IAssetTypeSpec[];
    filteredassetTypeSpecList: IAssetTypeSpec[];
    tassetTypeSpecList: IAssetTypeSpec[];
    
    selectedAssetType: AssetType;
    assetTypeList: AssetType[];

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

        http.get(this._global.baseAppUrl + '/GetAssetTypeSpec')
            .map((data: Response) => {
                return data.json() as IAssetTypeSpec[];
            }).toPromise().then(x => { this.assetTypeSpecList = x; })

        this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    }

    postCreateAsset(AssetIdentifier: string, Price: string, PurchaseOrderOn: string, ActivationDate: string, ExpiryDate: string, ServiceTagNumber: string, AssetTypeId: string, AssetSpec: Array<any>) {
        
        var createdBy = this.currentUser.UserId;
        var body = { AssetIdentifier, Price, PurchaseOrderOn, ActivationDate, ExpiryDate, ServiceTagNumber, AssetTypeId, AssetSpec, createdBy };
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
        return this.http.post(this._global.baseAppUrl + '/InsertAssetDetails', body, requestOptions).map(x => x.json());
    }

    getAssetType(AssetCategoryId){
        return this.http.get(this._global.baseAppUrl + '/GetAssetType?AssetCategoryId='+AssetCategoryId)
        .map(x => x.json() as IAssetCategory[]);
    }

}