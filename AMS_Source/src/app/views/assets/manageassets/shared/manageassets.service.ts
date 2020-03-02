import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod, HttpModule } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';
import { AssetsModel } from './manageassets.model';
import { AppGlobals } from '../../../../app.global';
import { ToastrService } from 'ngx-toastr';
import { map } from 'rxjs/operators';


@Injectable()
export class ManageAssetsService {

    selectedAssetsModel: AssetsModel;
    AssetsModelList: AssetsModel[];
    public currentUser: any;

    constructor(private http: Http,
        private _global: AppGlobals,
        private toastr: ToastrService) {
        this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    }
    GetAssetsDetails(searchType, requestNumber) {
        this.http.get(this._global.baseAppUrl + '/GetAssetsDetails?searchType=' + searchType + '&requestNumber=' + requestNumber)
            .map((data) => {
                return data.json() as AssetsModel[];
            }).toPromise().then(x => {
                this.AssetsModelList = x;              
            })

    }
    UpdateAssetDetails(id, activationDate, expiryDate, lastModifiedBy) {       
        var asset = {
            id,
            lastModifiedBy,
            activationDate,
            expiryDate
        };
        var body = JSON.stringify(asset);

        return this.http.put(this._global.baseAppUrl + '/UpdateAssetDetails', asset)
            .pipe(map(data => {
                return data;
            }));
    }
    
}