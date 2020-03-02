import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod, HttpModule } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';
import { catchError, map, tap } from 'rxjs/operators';

import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Quotation, AssetQuotation, Vendor } from './quotation.model';
import { AppGlobals } from '../../../../app.global';
import { QuotationComponent } from '../quotation/quotation.component';

@Injectable()
export class QuotationService {

    selectedQuotation: Quotation;
    QuotationList: Quotation[];

    selectedAssetQuotation: AssetQuotation;
    AssetQuotationList: AssetQuotation[];
    filteredAssetQuotationList: AssetQuotation[];
    //tAssetQuotationList: AssetQuotation[];

    selectedVendor: Vendor;
    VendorList: Vendor[];
    currentUser : any;

    constructor(private http: Http, private _global: AppGlobals,
        private modalService: NgbModal) {
        this.currentUser =  JSON.parse(localStorage.getItem('currentUser'));
    }

    getRaiseRequestList() {
        this.http.get(this._global.baseAppUrl + '/GetRaiseRequest')
            .map((data: Response) => {
                return data.json() as Quotation[];
            }).toPromise().then(x => { this.QuotationList = x; })
    }
     postSendForApproval(AssetRequestId, loginId) {
        var LastModifiedBy= loginId;
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Put, headers: headerOptions });
        var CreatedBy=this.currentUser.UserId;
        return this.http.put(this._global.baseAppUrl + '/SendForApproval?AssetRequestId=' + AssetRequestId +'&LastModifiedBy='+LastModifiedBy, CreatedBy ,requestOptions).map(x => x.json());
    }

    postAssetQuotation(event, QutationDetail: any) {
        let fileList: FileList = event.files;
        let frmData: FormData = new FormData();
        for (var i = 0; i < fileList.length; i++) {
            let file: File = fileList[i];

            frmData.append("uploadFile" + [i], file, file.name);
        }

        frmData.append('EntityTypeId', QutationDetail.AssetRequestId);
        frmData.append('Entity', QutationDetail.Entity);
        frmData.append('VendorId', QutationDetail.AssetVendorId);
        frmData.append('Price', QutationDetail.price);
        frmData.append('Quantity', QutationDetail.qty);
        frmData.append('CGST', QutationDetail.cgst);
        frmData.append('SGST', QutationDetail.sgst);
        frmData.append('Comments', QutationDetail.comments);
        frmData.append('CreatedBy', this.currentUser.UserId);

        var body = { frmData };
        let headerOptions = new Headers()
        let requestOptions = new RequestOptions({ headers: headerOptions });
        let apiUrl = this._global.baseAppUrl + "/PostAssetQuotation?";
        return this.http.post(apiUrl, frmData, requestOptions).map(x => x.json());
    }

    getAssetQuotationList(Id) {
        this.http.get(this._global.baseAppUrl + '/GetAssetQuotation?AssetRequestId=' + Id)
            .map((data: Response) => {
                return data.json() as AssetQuotation[];
            }).toPromise().then(x => { this.AssetQuotationList = x; })
    }
    GetDocumentsByAssetRequestId(Id) {
        this.http.get(this._global.baseAppUrl + '/GetDocumentsByAssetRequestId?AssetRequestId=' + Id)
            .map((data: Response) => {
                return data.json() as AssetQuotation[];
            }).toPromise().then(x => { this.AssetQuotationList = x; })
    }

    getVendorList() {
        this.http.get(this._global.baseAppUrl + '/GetVendorDetails')
            .map((data: Response) => {
                return data.json() as Vendor[];
            }).toPromise().then(x => { this.VendorList = x; })
    }


    deleteAssetQuotation(id) {       
        console.log("Service- Id: -" + id);
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Put, headers: headerOptions });
        return this.http.put(this._global.baseAppUrl + '/DeleteAssetQuotationById?id=' + id , requestOptions).map(x => x.json());
    }


    DeleteVendorDetailsById(id,loginId) {
        var LastModifiedBy= loginId;
        return this.http.delete(this._global.baseAppUrl + '/DeleteVendorDetailsById?id=' + id +'&LastModifiedBy='+LastModifiedBy).map(res => res.json());
    }
}
