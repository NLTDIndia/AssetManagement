import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod, HttpModule } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';
import { catchError, map, tap } from 'rxjs/operators';
import { AppGlobals } from '../../../../app.global';

import { MaterializePOModel, AssetRequestPaymentsModel, PaymentDetails,OtherAssetTypeSpecification, AssetTypePaymentBalance } from './materializepo.model';


@Injectable()
export class MaterializePOService {
    public currentUser : any;
    selectedMaterializePO: MaterializePOModel;
    MaterializePOList: MaterializePOModel[];

    selectedAssetRequestPayments: AssetRequestPaymentsModel;
    AssetRequestPaymentsList: AssetRequestPaymentsModel[];

    selectedPayment:PaymentDetails;
    paymentsList: PaymentDetails[];

    selectedCurrentPayment:PaymentDetails;
    paymentsCurrentList: PaymentDetails[];

    selectedOtherAssetTypeSpecification: OtherAssetTypeSpecification;
    OtherAssetTypeSpecificationList: OtherAssetTypeSpecification[];

    selectedAssetTypePaymentBalance: AssetTypePaymentBalance;
    AssetTypePaymentBalanceList: AssetTypePaymentBalance[];

    constructor(private http: Http, private _global: AppGlobals) { 
        this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    }

    getMaterializeRaisedPoList() {
        this.http.get(this._global.baseAppUrl + '/GetMaterializePO_RaisedPO')
            .map((data: Response) => {
                return data.json() as MaterializePOModel[];
            }).toPromise().then(x => { this.MaterializePOList = x; })
            
    }

    postAssetRequestPayments(AssetRequestId: string, CreditCardNo: string, CreditCardOwner: string, ChequeNo: string, Amount: string, ChequeDate: string, ChequeBankName: string, ChequeBranch: string, DC_TransactionIdentifier: string, DC_Transferer: string, SpecificationArray: Array<any>) {
        var body = { AssetRequestId, CreditCardNo, CreditCardOwner, ChequeNo, Amount, ChequeDate, ChequeBankName, ChequeBranch, DC_TransactionIdentifier, DC_Transferer, SpecificationArray };
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });
        return this.http.post(this._global.baseAppUrl + '/InsertAssetRequestPayments', body, requestOptions).map(x => x.json());
    }

    getAssetRequestPaymentList(Id) {
        this.http.get(this._global.baseAppUrl + '/GetAssetRequestPaymentById?AssetRequestId=' + Id)
            .map((data: Response) => {
                return data.json() as AssetRequestPaymentsModel[];
            }).toPromise().then(x => { this.AssetRequestPaymentsList = x; })
    }
    getPaymentDetails(AssetRequestId) {
        this.http.get(this._global.baseAppUrl + '/GetPaymentDetails?AssetRequestId=' + AssetRequestId)
            .map((data: Response) => {
                return data.json() as PaymentDetails[];
            }).toPromise().then(x => { this.paymentsList = x; })
    }
    getPaymentDetailsCurrentDate(AssetRequestId) {
        this.http.get(this._global.baseAppUrl + '/GetPaymentDetailsCurrentDate?AssetRequestId=' + AssetRequestId)
            .map((data: Response) => {
                return data.json() as PaymentDetails[];
            }).toPromise().then(x => { this.paymentsCurrentList = x; })
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

    getOtherAssetTypeSpecification(AssetRequestId: string){
        this.http.get(this._global.baseAppUrl + '/GetAssetTypeOtherSpecification?AssetRequestId=' + AssetRequestId)
        .map((data: Response) => {
            return data.json() as OtherAssetTypeSpecification[];
        }).toPromise().then(x => { this.OtherAssetTypeSpecificationList = x;}
        
        )
    }

    getGetBalancePayments(AssetRequestId: string){
        console.log(AssetRequestId);
        this.http.get(this._global.baseAppUrl + '/GetBalancePayments?AssetRequestId=' + AssetRequestId)
        .map((data: Response) => {
            return data.json() as AssetTypePaymentBalance[];
        }).toPromise().then(x => { this.AssetTypePaymentBalanceList = x; console.log(this.AssetTypePaymentBalanceList)} 
        
        )
    }
    PostConvertToAsset(AssetRequestId) {
       
        var headerOptions = new Headers({ 'Content-Type': 'application/json' });
        var requestOptions = new RequestOptions({ method: RequestMethod.Post, headers: headerOptions });       
        return this.http.post(this._global.baseAppUrl + '/PostMaterializePo?AssetRequestId=' + AssetRequestId, requestOptions).map(res => res.json());
    }
}
