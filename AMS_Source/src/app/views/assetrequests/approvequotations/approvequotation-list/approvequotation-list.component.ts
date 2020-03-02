import { Component, OnInit, TemplateRef } from '@angular/core';

import { ApproveQuotationService } from '../shared/approvequotation.service';

import { ActivatedRoute, Router, Params } from '@angular/router';
import { Route } from '@angular/compiler/src/core';

import { BsModalService } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-approvequotation-list',
  templateUrl: './approvequotation-list.component.html',
  styleUrls: ['./approvequotation-list.component.scss']
})
export class ApprovequotationListComponent implements OnInit {
  public currentUser: any;
  modalRef: BsModalRef;
  _assetQuotationId: string;
  isFirstOpen = true;
  

  constructor(public approveQuotationService: ApproveQuotationService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router,
    public toastr: ToastrService,
    public modalService: BsModalService) {
  }

  ngOnInit() {
    let AssetQuotationId = this._activatedRoute.snapshot.queryParams["AssetQuotationId"];
    this.approveQuotationService.getAssetQuotationList(AssetQuotationId);
    this.approveQuotationService.getAssetQuotationApprovalComments(AssetQuotationId);
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
  }

  onBackButtonClick() {
    this._router.navigate(['/assetrequests/approvequotations/approvequotations'])
  }

  btnApprovalClick(id, comments, fileEvent) {
    this.approveQuotationService.postAssetQuoteApprove(id, comments,fileEvent, "false", this.currentUser.UserId)
      .subscribe(data => {
        this.toastr.success('Quotation is Approved.');
        this._router.navigate(['/assetrequests/approvequotations/approvequotations'])
      })
  }

  btnSendAnotherApprovalClick(id, comments, fileEvent) {
    this.approveQuotationService.postAssetQuoteApprove(id, comments, fileEvent, "true", this.currentUser.UserId)
      .subscribe(data => {
        this.toastr.success('Send for approval has been done successfully.');
        this._router.navigate(['/assetrequests/approvequotations/approvequotations'])
      })
  }

  // ClickOpenModel(comments) {
  //   this.approveQuotationService.postAssetQuoteApprove(this._assetQuotationId, comments, "true")
  //     .subscribe(data => {
  //       this.modalRef.hide();
  //       this._router.navigate(['/assetrequests/approvequotations/approvequotations'])
  //     })
  // }

}
