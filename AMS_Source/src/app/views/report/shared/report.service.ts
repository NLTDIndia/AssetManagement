import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod, HttpModule } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';
import { AppGlobals } from '../../../app.global';
import { ToastrService } from 'ngx-toastr';
import { map } from 'rxjs/operators';
import {PendingAssetsModel, UnallocatedAssetsModel} from './report.model'
@Injectable()
export class ReportService {

    public currentUser: any;
    pendingAssetList: PendingAssetsModel[];
    unallocatedAssetList: UnallocatedAssetsModel[];
    constructor(private http: Http,
        private _global: AppGlobals,
        private toastr: ToastrService) {
        this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    }

    GetPendingAssets(){
        this.http.get(this._global.baseAppUrl + '/Report/PendingAssets')
        .map((data: Response) => {
            return data.json() as PendingAssetsModel[];
        }).toPromise().then(x => { this.pendingAssetList = x; })
    }

    GetUnallocatedAssets(){
        this.http.get(this._global.baseAppUrl + '/Report/UnallocatedAssets')
        .map((data: Response) => {
            return data.json() as UnallocatedAssetsModel[];
        }).toPromise().then(x => { this.unallocatedAssetList = x; })
    }
}