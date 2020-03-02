import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod, HttpModule } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';

import { VendorsModel } from './vendors.model';
import { AppGlobals } from '../../../../app.global';


@Injectable()
export class VendorService {
    
    selectedVendor: VendorsModel;
    vendorModelList: VendorsModel[];

    constructor(public http: Http, public _global: AppGlobals){ 

    }

    postVendor(loc: VendorsModel) {
        var body = JSON.stringify(loc);
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
        return this.http.post(this._global.baseAppUrl + '/InsertAssetVendor', body, requestOptions).map(x => x.json());
    }

    getVendorDetailsList() {
        this.http.get(this._global.baseAppUrl + '/GetVendorDetails')
            .map((data: Response) => {
                return data.json() as VendorsModel[];
            }).toPromise().then(x => { this.vendorModelList = x; })
    }

    postVendordetails(id, loc) {
        var body = JSON.stringify(loc);
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Put, headers: headerOptions });
        return this.http.put(this._global.baseAppUrl + '/UpdateAssetVendorDetails?AssetVendorId=' + id, body, requestOptions).map(x => x.json());
    }

    deleteVendor(id, loginId) {
        var LastModifiedBy = loginId;
        return this.http.delete(this._global.baseAppUrl + '/DeleteVendorDetails?id=' + id +'&LastModifiedBy='+LastModifiedBy).map(res => res.json());
    }
}