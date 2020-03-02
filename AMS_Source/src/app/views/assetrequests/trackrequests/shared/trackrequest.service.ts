import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod, HttpModule } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';
import { TrackRequestModel } from '../shared/trackrequest.model';
import { AppGlobals } from '../../../../app.global';
import { ToastrService } from 'ngx-toastr';
@Injectable()
export class TrackRequestService {

    selectedTrackRequest: TrackRequestModel;
    TrackRequestList: TrackRequestModel[];
    public currentUser: any;

    constructor(private http: Http,
        private _global: AppGlobals,
        private toastr: ToastrService) {
        this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    }
    GetAssetHistory(searchType, requestNumber) {
        this.http.get(this._global.baseAppUrl + '/GetAssetHistory?searchType=' + searchType + '&requestNumber=' + requestNumber)
            .map((data: Response) => {
                return data.json() as TrackRequestModel[];
            }).toPromise().then(x => {
            this.TrackRequestList = x;
            })
    }
}