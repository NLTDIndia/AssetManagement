import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod, HttpModule } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';

import { AssetCategory } from './asset.model';
import { AppGlobals } from '../../../../app.global';

@Injectable()
export class AssetCategoryService {
    public currentUser: any;
    selectedAssetCategory: AssetCategory;
    assetCategoryList: AssetCategory[];
    constructor(private http: Http, private _global: AppGlobals) {  }

    postAssetCategory(ac: AssetCategory) {
        var body = JSON.stringify(ac);
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
        return this.http.post(this._global.baseAppUrl + '/InsertAssetCategoryDetails', body, requestOptions).map(x => x.json());
    }

    getAssetCategoryList() {
        this.http.get(this._global.baseAppUrl + '/GetCategoryDetails')
            .map((data: Response) => {
                return data.json() as AssetCategory[];
            }).toPromise().then(x => { this.assetCategoryList = x; })
    }

    putAssetCategory(id, emp,loginId) {
        var LastModifiedBy = loginId;
        var body = JSON.stringify(emp);
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Put, headers: headerOptions });
        return this.http.put(this._global.baseAppUrl + '/UpdateAssetCategoryDetails?AssetCategoryId=' + id + '&LastModifiedBy=' + LastModifiedBy, body, requestOptions).map(x => x.json());
    }

    deleteAssetCategory(id, loginId) {
        var LastModifiedBy = loginId;
        return this.http.delete(this._global.baseAppUrl + '/DeleteAssetCategoryDetailsById?id=' + id + '&LastModifiedBy=' + LastModifiedBy).map(res => res.json());
    }
}