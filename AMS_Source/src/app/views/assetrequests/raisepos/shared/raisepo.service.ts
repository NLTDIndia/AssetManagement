import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod } from '@angular/http';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';
import { catchError, map, tap } from 'rxjs/operators';

import { PaymentMode, ApproveAssetQuotationRaisePO, PaymentDetailss, ViewRaisePOModel, PaymentDetails, OtherAssetTypeSpecification } from './raisepo.model';
import { VendorsModel } from '../../../admin/vendors/shared/vendors.model';
import { AppGlobals } from '../../../../app.global';



@Injectable()
export class RaisePoService {
public currentUser : any;
    selectedApprovalQuotationRaisePO: ApproveAssetQuotationRaisePO;
    ApprovalQuotationRaisePOList: ApproveAssetQuotationRaisePO[];

    selectedPaymentDetails: PaymentDetailss;
    PaymentDetailsList: PaymentDetailss[];

    selectedViewRaisePO: ViewRaisePOModel;
    ViewRaiseList: ViewRaisePOModel[];

    selectedViewRaisePOVendors: VendorsModel;
    viewRaisePOVendorsList: VendorsModel[];

    selectedPayment:PaymentDetails;
    paymentsList: PaymentDetails[];

    selectedOtherAssetTypeSpecification: OtherAssetTypeSpecification;
    OtherAssetTypeSpecificationList: OtherAssetTypeSpecification[];

    constructor(private http: Http, private _global: AppGlobals) {
        this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
     }

    getApprovalQuotationRaisePOList() {
        this.http.get(this._global.baseAppUrl +'/GetRaisePO_QuotationApprovals')
            .map((data: Response) => {
                return data.json() as ApproveAssetQuotationRaisePO[];
            }).toPromise().then(x => { this.ApprovalQuotationRaisePOList = x; })
    }

    postAssetRequestPayments(AssetRequestId: string, SpecificationArray: Array<any>) {
        var CreatedBy = this.currentUser.UserId;
        var body = { AssetRequestId, CreatedBy, SpecificationArray};
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
        return this.http.post(this._global.baseAppUrl + '/InsertAssetRequestPayments', body, requestOptions).map(x => x.json());
    }

    getViewRaisePODetails(AssetRequestId) {
        this.http.get(this._global.baseAppUrl + '/GetRaisePODetails?AssetRequestId=' + AssetRequestId)
            .map((data: Response) => {
                return data.json() as ViewRaisePOModel[];
            }).toPromise().then(x => { this.ViewRaiseList = x; })
    }

    getViewRaisePOVendorDetails(AssetRequestId) {
        this.http.get(this._global.baseAppUrl + '/GetVendorDetailsByAssetRequestId?assetRequestId=' + AssetRequestId)
            .map((data: Response) => {
                return data.json() as VendorsModel[];
            }).toPromise().then(x => { this.viewRaisePOVendorsList = x; })
    }
    getPaymentDetails(AssetRequestId) {
        this.http.get(this._global.baseAppUrl + '/GetPaymentDetails?AssetRequestId=' + AssetRequestId)
            .map((data: Response) => {
                return data.json() as PaymentDetails[];
            }).toPromise().then(x => { this.paymentsList = x; })
    }
    InsertPaymentDetails(AssetRequestId: string,currentUser: string, SpecificationArray: Array<any>) {
        var CreatedBy = currentUser;
        var body = { AssetRequestId, CreatedBy, SpecificationArray };
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
        return this.http.post(this._global.baseAppUrl + '/InsertPaymentDetails', body, requestOptions).map(x => x.json());
    }

    DeletePaymentsById(id, loginId) {
        var LastModifiedBy = loginId;
        return this.http.delete(this._global.baseAppUrl + '/DeletePaymentsById?id=' + id + '&lastModifiedBy='+LastModifiedBy).map(res => res.json());
    }
    postAssetTypeOtherSpecification(AssetRequestId: string, OtherSpecification: string) {
        var body = { AssetRequestId, OtherSpecification };
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
        return this.http.post(this._global.baseAppUrl + '/InsertOtherSpecification?AssetRequestId=' + AssetRequestId + '&OtherSpecification=' + OtherSpecification, requestOptions).map(x => x.json());
    }
    

}