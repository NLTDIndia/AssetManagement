import { Component, OnInit, TemplateRef } from '@angular/core';

import { Quotation, Vendor, AssetQuotation } from '../shared/quotation.model';
import { QuotationService } from '../shared/quotation.service';

import { ActivatedRoute, Router, Params } from '@angular/router';
import { Route } from '@angular/compiler/src/core';

import { BsModalService } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-quotations-list',
  templateUrl: './quotations-list.component.html',
  styleUrls: ['./quotations-list.component.scss']
})
export class QuotationsListComponent implements OnInit {
  Documents: Array<Object>;
  modalRef: BsModalRef;
  _assetQuotationId: string;

  public show: boolean = false;
  public buttonName: any = 'Show';

  fieldArray: Array<any> = [];
  newAttribute: any = {};
  FileUpload_Name: string;
  _assetRequestId: string;
  _formData;
  myFiles: FileList;
  AssetQuotationId: string;
  message: string;
  QuotationCount: number;
  public currentUser: any;

  constructor(public quotationService: QuotationService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router,
    public modalService: BsModalService,
    private toastr: ToastrService) {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
  }

  ngOnInit() {   
    this.currentUser =  JSON.parse(localStorage.getItem('currentUser'));
    this._assetRequestId = this._activatedRoute.snapshot.queryParams["AssetRequestId"];
    this.quotationService.getAssetQuotationList(this._assetRequestId)
    
    // .subscribe(Documents =>
    //   this.Documents=Documents);

    // err => {
    //   console.log(err);
    //   return false;
    // };

  }

  onBackButtonClick() {
    this._router.navigate(['/assetrequests/quotations/quotations']);
  }
  showForEdit(ats: AssetQuotation) {
    this._router.navigate(['/assetrequests/quotation-list/quotation-list']);
    this.quotationService.selectedAssetQuotation = Object.assign({}, ats);

  }
  SendForApproval() {
    let AssetRequestId = this._assetRequestId;
    this.quotationService.postSendForApproval(AssetRequestId,this.currentUser.UserId)
      .subscribe(data => {
        this.quotationService.getAssetQuotationList(AssetRequestId);
        this._router.navigate(['/assetrequests/quotations/quotations']);
      }, (error) => {
        console.log(error);
      })
    this.toastr.success("The selected asset request has been sent for approval.")
  };
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
  openModalViewYesorNo(templateYesorNo: TemplateRef<any>, AssetQuotationId) {
    this.modalRef = this.modalService.show(templateYesorNo, { class: 'gray modal-md' });
    this.AssetQuotationId = AssetQuotationId;
  }
  confirm(): void {
    this.message = 'Confirmed!';
    this.modalRef.hide();
    this.quotationService.DeleteVendorDetailsById(this.AssetQuotationId, this.currentUser.UserId)
      .subscribe(x => {
        this.quotationService.getRaiseRequestList();
      });
    // if (this.QuotationCount>0)
    this._router.navigate(['/assetrequests/quotations/quotations']);
    // else{   
    // this._router.navigate(['/assetrequests/quotations-list/quotations-list']);
    // }
    this.AssetQuotationId = "";

  }

  decline(): void {
    this.message = 'Declined!';
    this.modalRef.hide();
  }



}
