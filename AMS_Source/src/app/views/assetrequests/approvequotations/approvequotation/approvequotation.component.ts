import { Component, OnInit } from '@angular/core';
import { ApproveAssetQuotation, ApproveQuotation } from '../shared/approvequotation.model';

import { ApproveQuotationService } from '../shared/approvequotation.service';
import { ActivatedRoute, Router } from '@angular/router';
import { Route } from '@angular/compiler/src/core';


@Component({
  selector: 'app-approvequotation',
  templateUrl: './approvequotation.component.html',
  styleUrls: ['./approvequotation.component.scss']
})
export class ApprovequotationComponent implements OnInit {
  public currentUser: any;
  constructor(public approveQuotationService: ApproveQuotationService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router) {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
  }

  ngOnInit() {
    let empCode: string = this._activatedRoute.snapshot.params['AssetRequestId'];
    this.approveQuotationService.GetAwaitingQuotationApprovalList();
  }

  btnClick = function (id) {
    console.log(id)
    //this.router.navigateByUrl('/assestrequests/quotations/quotations');
    this._router.navigate(['/assetrequests/approvequotation-list/approvequotation-list'], { queryParams: { AssetQuotationId: id } });
  };

  p: number = 1;
}
