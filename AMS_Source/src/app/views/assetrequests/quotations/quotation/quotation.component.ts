import { Component, OnInit, TemplateRef, Input, ViewChild } from '@angular/core';
import { Quotation, Vendor } from '../shared/quotation.model';
import { QuotationService } from '../shared/quotation.service';

import { BsModalService } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-quotation',
  templateUrl: './quotation.component.html',
  styleUrls: ['./quotation.component.scss']
})
export class QuotationComponent implements OnInit {


  public show: boolean = false;
  public buttonName: any = 'Show';
  modalRef: BsModalRef;
  _assetRequestId: string;
  newAttribute: any = {};
  fieldArray: Array<any> = [];
  QuotationCount: string;
  public currentUser: any;

  constructor(public quotationService: QuotationService,
    public modalService: BsModalService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router,
    private toastr: ToastrService
  ) {    
  }

  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    this.quotationService.getRaiseRequestList();
    this._assetRequestId = this._activatedRoute.snapshot.queryParams["AssetRequestId"];
    this.quotationService.getVendorList();
    this.newAttribute = {
      Name: '0',
    };


  }
  public restrictNumeric(e) {
    let input;
    if (e.metaKey || e.ctrlKey) {
      return true;
    }
    if (e.which === 32) {
      return false;
    }
    if (e.which === 0) {
      return true;
    }
    if (e.which < 33) {
      return true;
    }
    input = String.fromCharCode(e.which);
    return !!/[\d\s]/.test(input);
  }

  openModal(template: TemplateRef<any>, AssetRequestId) {
    this.modalRef = this.modalService.show(template, Object.assign({}, { class: 'gray modal-lg' }));
    this._assetRequestId = AssetRequestId;
    this.newAttribute = {
      AssetVendorId: '0'

    }
  }


  resetForm() {
    this.fieldArray = [];
  }

  onDelete(id: number) {
    console.log(id);
    if (confirm('Are you sure to delete this record ?') == true)
      this.quotationService.deleteAssetQuotation(id)
        .subscribe(x => {
          this.quotationService.getRaiseRequestList();
          this.resetForm();

        })
  }
  btnClickAdd(AssetRequestId, AssetRequestNumber) {
    this._router.navigate(['/assetrequests/quotation-list/quotation-list'], { queryParams: { AssetRequestId: AssetRequestId, AssetRequestNumber: AssetRequestNumber } });
  };

  openModalView = function (AssetRequestId) { 
    this.openModalView.enabled = true;
    console.log(AssetRequestId)
    this.quotationService.getAssetQuotationList(AssetRequestId);
    this.quotationService.GetDocumentsByAssetRequestId(AssetRequestId);
    this._router.navigate(['/assetrequests/quotations-list/quotations-list'], { queryParams: { AssetRequestId: AssetRequestId } });
  };

  SendForApproval(AssetRequestId) {
    this.quotationService.postSendForApproval(AssetRequestId,this.currentUser.UserId)
      .subscribe(data => {
        this.resetForm();
        this.quotationService.getRaiseRequestList();
        this._router.navigate(['/assetrequests/quotations/quotations']);
      }, (error) => {
        console.log(error);
      })
    this.toastr.success("The selected asset request has been sent for approval.")
  };
  p: number = 1;
}
