import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod, HttpModule } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';

import { AssetType, AssetAddonsType } from './assettype.model';

import { AssetCategory } from '../../asset-categories/shared/asset.model';

import { AppGlobals } from '../../../../app.global';


@Injectable()
export class AssetTypeService {

    selectedAssetCategory: AssetCategory;
    assetCategoryList: AssetCategory[];
    selectedAssetType: AssetType;
    assetTypeList: AssetType[];
assetAddonsTypeList: AssetAddonsType[];

    constructor(private http: Http, private _global: AppGlobals) { 
        this.http.get(this._global.baseAppUrl + '/GetCategoryDetails').map((data: Response) => {
            return data.json() as AssetCategory[];
        }).toPromise().then(x => { this.assetCategoryList = x; })

        this.http.get(this._global.baseAppUrl + '/GetAssetAddonsType')
            .map((data: Response) => {
                return data.json() as AssetAddonsType[];
            }).toPromise().then(x => { this.assetAddonsTypeList = x; })
    }

    postAssetType(Name: string, AssetCategoryId: string,CreatedBy: string, AddonsTypeId: string, SpecificationArray: Array<any>) {
        var body = { Name, AssetCategoryId,CreatedBy, AddonsTypeId, SpecificationArray };
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
        return this.http.post(this._global.baseAppUrl + '/InsertAssetTypeDetails', body, requestOptions).map(x => x.json());
    }

    getAssetTypeList() {
        this.http.get(this._global.baseAppUrl + '/GetAssetTypeDetails')
            .map((data: Response) => {
                return data.json() as AssetType[];
            }).toPromise().then(x => { this.assetTypeList = x; })
    }


    putAssetType(id, aType, loginId) {
        var LastModifiedBy=loginId;
        var body = JSON.stringify(aType);
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Put, headers: headerOptions });
        return this.http.put(this._global.baseAppUrl + '/UpdateAssetTypeDetails?AssetTypeId=' + id +'&LastModifiedBy='+LastModifiedBy, body, requestOptions).map(x => x.json());
    }

    deleteAssetType(id, loginId) {
        var LastModifiedBy=loginId;
        return this.http.delete(this._global.baseAppUrl + '/DeleteAssetTypeDetailsById?id=' + id +'&LastModifiedBy='+LastModifiedBy).map(res => res.json());
    }

}
