import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';

import { ActivatedRoute, Router } from '@angular/router';
import { Route } from '@angular/compiler/src/core';
import { MaterializePOService } from '../shared/materializepo.service';
import { RaisePoService } from '../../raisepos/shared/raisepo.service'; // Here Called RaisePO Service
import { PaymentMode, ApproveAssetQuotationRaisePO, PaymentDetailss, ViewRaisePOModel } from '../../raisepos/shared/raisepo.model';


@Component({
  selector: 'app-viewmaterializepo',
  templateUrl: './viewmaterializepo.component.html',
  styleUrls: ['./viewmaterializepo.component.scss']
})
export class ViewmaterializepoComponent implements OnInit {

  _navigateAssetRequestId: string;
  _arNumber: string;
  _poNumber: string;
  _assetTypeName: string;
  constructor(public materializePOService: MaterializePOService, 
    public raisePoService: RaisePoService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router) { }

  ngOnInit() {
    let AssetRequestId = this._activatedRoute.snapshot.queryParams["AssetRequestId"];
    this._arNumber = this._activatedRoute.snapshot.queryParams["ARNumber"];
    this._poNumber = this._activatedRoute.snapshot.queryParams["PONumber"];
    this._assetTypeName = this._activatedRoute.snapshot.queryParams["AssetTypeName"];
    this._navigateAssetRequestId = AssetRequestId;
    this.raisePoService.getViewRaisePODetails(AssetRequestId);
    this.raisePoService.getViewRaisePOVendorDetails(this._navigateAssetRequestId);
    this.materializePOService.getGetBalancePayments(AssetRequestId);
  }

  onBackButtonClick() {
    this._router.navigate(['/assetrequests/mpopaymentdetails/mpopaymentdetails'], { queryParams: { AssetRequestId: this._navigateAssetRequestId, ARNumber: this._arNumber, PONumber: this._poNumber, AssetTypeName: this._assetTypeName } });
  }

}
