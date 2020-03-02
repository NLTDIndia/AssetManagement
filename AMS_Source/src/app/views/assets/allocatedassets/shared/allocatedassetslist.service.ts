import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod, HttpModule } from '@angular/http';
//import { Observable } from 'rxjs/observable ';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';

import { Observable } from 'rxjs/Rx';
import 'rxjs/add/operator/map';

import { Asset, AssetSpecifications, AssetAllocation, GetHistoryModel } from './allocatedassetslist.model';
import { AppGlobals } from '../../../../app.global';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AllocatedassetsComponent } from '../allocatedassets.component';



@Injectable()
export class AllocatedAssetsService {
    public currentUser: any;
    selectedAsset: Asset;
    assetList: Asset[];
    selectedAssetSpec: AssetSpecifications;
    assetSpecList: AssetSpecifications[];
    selectedAssetAllocations: AssetAllocation;
    assetAllocationList: AssetAllocation[];
    selectedgetHistory: GetHistoryModel;
    getHistoryList: GetHistoryModel[];
    constructor(private http: Http, private _global: AppGlobals,
    ) {
        this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    }


    getAssetSpecificationsList(AssetId) {

        this.http.get(this._global.baseAppUrl + '/GetAssetSpecification?AssetId=' + AssetId)
            .map((data: Response) => {
                return data.json() as AssetSpecifications[];
            }).toPromise().then(x => { this.assetSpecList = x; })
    }
    // updateAssetAllocationDetails(AssetAllocationId, allocation, loginId){
    //     var LastModifiedBy=loginId;
    //     var body = JSON.stringify(allocation);
    //     var headerOptions = new Headers({ 'Content-Type': 'application/json' });
    //     var requestOptions = new RequestOptions({ method: RequestMethod.Put, headers: headerOptions });
    //     return this.http.put(this._global.baseAppUrl + '/UpdateAssetAllocationDetails?AssetAllocationId=' + AssetAllocationId +'&LastModifiedBy='+LastModifiedBy, body, requestOptions).map(x => x.json());
    // }
    // deleteAssetAllocationDetailsById(id, loginId){
    //     var LastModifiedBy=loginId;
    //     return this.http.delete(this._global.baseAppUrl +'/DeleteAssetAllocationDetailsById?id='+ id +'&LastModifiedBy='+LastModifiedBy).map(res=>res.json());
    // }     

    UpdateAssetAllocationDetails(id, LastModifiedBy, Comments) {
        return this.http.delete(this._global.baseAppUrl + '/UpdateAssetAllocationDetails?AssetAllocationId=' + id + '&LastModifiedBy=' + LastModifiedBy + '&Comments=' + Comments).map(res => res.json());
    }
    GetAssetAllocationByAssetId(AssetId) {
        this.http.get(this._global.baseAppUrl + '/GetAssetAllocationByAssetId?AssetId=' + AssetId)
            .map((data: Response) => {
                return data.json() as GetHistoryModel[];
            }).toPromise().then(x => { this.getHistoryList = x; })
    }
    GetAllocatedAssets() {
        this.http.get(this._global.baseAppUrl + '/GetAllocatedAssets')
            .map((data: Response) => {
                return data.json() as Asset[];
            }).toPromise().then(x => { this.assetList = x; })
    }


}