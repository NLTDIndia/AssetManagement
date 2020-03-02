import { Component, OnInit } from '@angular/core';
import { RaisePoService } from '../shared/raisepo.service';

import { ActivatedRoute, Router } from '@angular/router';
import { Route } from '@angular/compiler/src/core';

@Component({
  selector: 'app-raisepo',
  templateUrl: './raisepo.component.html',
  styleUrls: ['./raisepo.component.scss']
})
export class RaisepoComponent implements OnInit {
public currentUser:any;
  constructor(public _raisePoService: RaisePoService,  
    public _activatedRoute: ActivatedRoute,
    public _router: Router ) {    
  }

  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    this._raisePoService.getApprovalQuotationRaisePOList();
  }

  btnClick = function (id, arNumber) {
    this._router.navigate(['/assetrequests/paymentdetails/paymentdetails'], { queryParams: { AssetRequestId: id, ARNumber: arNumber } });
  };

  // btnClickView = function (id) {
  //   this._router.navigate(['/assetrequests/viewraisepo/viewraisepo'], { queryParams: { AssetRequestId: id } });
  // };

  p: number = 1;
}
