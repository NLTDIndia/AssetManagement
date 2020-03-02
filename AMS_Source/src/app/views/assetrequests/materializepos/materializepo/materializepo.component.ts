import { Component, OnInit } from '@angular/core';

import { MaterializePOService } from '../shared/materializepo.service';

import { ActivatedRoute, Router } from '@angular/router';
import { Route } from '@angular/compiler/src/core';

@Component({
  selector: 'app-materializepo',
  templateUrl: './materializepo.component.html',
  styleUrls: ['./materializepo.component.scss']
})
export class MaterializepoComponent implements OnInit {
  public currentUser: any;
  constructor(public materializePOService: MaterializePOService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router) {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
  }

  ngOnInit() {
    this.materializePOService.getMaterializeRaisedPoList();
  }



  btnPaymentsClick = function (assetRequestId, arNumber, poNumber, assetTypeName) {
    this._router.navigate(['/assetrequests/mpopaymentdetails/mpopaymentdetails'], { queryParams: { AssetRequestId: assetRequestId, ARNumber: arNumber,PONumber: poNumber,AssetTypeName: assetTypeName } });
  };
  

  // btnViewClick = function (assetRequestId) {
  //   this._router.navigate(['/assetrequests/viewmaterializepo/viewmaterializepo'], { queryParams: { AssetRequestId: assetRequestId } });
  // }
  p: number = 1;
}
