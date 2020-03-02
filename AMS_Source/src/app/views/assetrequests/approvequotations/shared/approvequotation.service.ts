import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod, HttpModule } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';
import { catchError, map, tap } from 'rxjs/operators';

import { ApproveAssetQuotation, ApproveQuotation, ApproveQuotationApprovalComments } from './approvequotation.model';

import { AppGlobals } from '../../../../app.global';


@Injectable()
export class ApproveQuotationService {

    selectedAssetQuotation: ApproveQuotation;
    AssetQuotationList: ApproveQuotation[];

    selectedAssetApproveQuotation: ApproveAssetQuotation;
    ApproveAssetQuotationList: ApproveAssetQuotation[];

    ApproveFullAssetQuotationList: ApproveAssetQuotation[];

    selectedApproveQuotationApprovalComments: ApproveQuotationApprovalComments;
    ApproveQuotationApprovalCommentsList: ApproveQuotationApprovalComments[];

    constructor(private http: Http, private _global: AppGlobals) { }

    GetAwaitingQuotationApprovalList() {
        this.http.get(this._global.baseAppUrl + '/GetAwaitingQuotationApprovalList')
            .map((data: Response) => {
                return data.json() as ApproveQuotation[];
            }).toPromise().then(x => { this.AssetQuotationList = x; })
    }

    getAssetQuotationList(Id) {
        this.http.get(this._global.baseAppUrl +'/GetAssetQuotation?AssetRequestId=' + Id)
            .map((data: Response) => {
                return data.json() as ApproveAssetQuotation[];
            }).toPromise().then(x => { this.ApproveAssetQuotationList = x; })
    }

    getAssetQuotationApprovalComments(Id) {
        this.http.get(this._global.baseAppUrl +'/GetAssetQuotationApprovalComments?AssetRequestId=' + Id)
            .map((data: Response) => {
                return data.json() as ApproveQuotationApprovalComments[];
            }).toPromise().then(x => { this.ApproveQuotationApprovalCommentsList = x; })
    }
   
    postAssetQuoteApprove(AssetQuotationId: string, Comments: string, event , IsAwaitingNextApproval: string, loginId: string) {
        let fileList: FileList = event.files;
        let frmData: FormData = new FormData();
        for (var i = 0; i < fileList.length; i++) {
            let file: File = fileList[i];
            frmData.append("uploadFile" + [i], file, file.name);
        }

        frmData.append('EntityTypeId', AssetQuotationId);
        frmData.append('Entity', "ApproveQuotation");
        frmData.append('AssetQuotationId', AssetQuotationId);
        frmData.append('Comments', Comments);
        frmData.append('IsAwaitingNextApproval', IsAwaitingNextApproval);
        frmData.append('LoginId', loginId);

        var body = { frmData };
        let headerOptions = new Headers();
        let requestOptions = new RequestOptions({ headers: headerOptions });
        let apiUrl = this._global.baseAppUrl + "/PostAssetQuoteApproval?";
        return this.http.post(apiUrl, frmData, requestOptions).map(x => x.json());
    }


}