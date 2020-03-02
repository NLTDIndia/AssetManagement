import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod, HttpModule } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';

import { Location } from './location.model';
import { AppGlobals } from '../../../../app.global';

@Injectable()
export class LocationService {

    selectedLocation: Location;
    locationList: Location[];
    constructor(private http: Http, private _global: AppGlobals) { }

    postLocation(loc: Location) {
        var body = JSON.stringify(loc);
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
        return this.http.post(this._global.baseAppUrl + '/InsertLocationDetails', body, requestOptions).map(x => x.json());
    }

    getLocationList() {
        this.http.get(this._global.baseAppUrl + '/GetLocationDetails')
            .map((data: Response) => {
                return data.json() as Location[];
            }).toPromise().then(x => { this.locationList = x; })
    }

    postLocationdetails(id, loc, loginId) {
        var LastModifiedBy = loginId;
        var body = JSON.stringify(loc);
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Put, headers: headerOptions });
        return this.http.put(this._global.baseAppUrl + '/UpdateLocationDetails?AssetLocationId=' + id +'&LastModifiedBy=' +LastModifiedBy, body, requestOptions).map(x => x.json());
    }

    deleteLocation(id, loginId ) {
        var LastModifiedBy = loginId;
        return this.http.delete(this._global.baseAppUrl + '/DeleteLocationDetailsById?id=' + id +'&LastModifiedBy=' +LastModifiedBy).map(res => res.json());
    }
}