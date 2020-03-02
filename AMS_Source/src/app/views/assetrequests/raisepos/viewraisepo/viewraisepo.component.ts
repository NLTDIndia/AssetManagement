import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';

import { ActivatedRoute, Router } from '@angular/router';
import { Route } from '@angular/compiler/src/core';
import { RaisePoService } from '../shared/raisepo.service';
import { PaymentMode, ApproveAssetQuotationRaisePO, PaymentDetailss, ViewRaisePOModel } from '../shared/raisepo.model';


@Component({
  selector: 'app-viewraisepo',
  templateUrl: './viewraisepo.component.html',
  styleUrls: ['./viewraisepo.component.scss']
})
export class ViewraisepoComponent implements OnInit {

  _navigateAssetRequestId: string;
  _arNumber: string;
  constructor(public raisePoService: RaisePoService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router) { }

  ngOnInit() {
    let AssetRequestId = this._activatedRoute.snapshot.queryParams["AssetRequestId"];
    this._arNumber = this._activatedRoute.snapshot.queryParams["ARNumber"];
    this._navigateAssetRequestId = AssetRequestId;
    this.raisePoService.getViewRaisePODetails(AssetRequestId);
    this.raisePoService.getViewRaisePOVendorDetails(this._navigateAssetRequestId);
    
  }

  onBackButtonClick() {
    this._router.navigate(['/assetrequests/paymentdetails/paymentdetails'], { queryParams: { AssetRequestId: this._navigateAssetRequestId, ARNumber: this._arNumber } });
  }
}
