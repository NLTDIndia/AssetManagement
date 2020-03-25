import { Component, OnInit, TemplateRef } from '@angular/core';
import { NgForm } from '@angular/forms';

import { MaterializePOService } from '../shared/materializepo.service';
import { BsModalService } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-mpopaymentdetails',
  templateUrl: './mpopaymentdetails.component.html',
  styleUrls: ['./mpopaymentdetails.component.scss']
})
export class MpopaymentdetailsComponent implements OnInit {
  data: Date;
  _PaymentMode: string;
  myDateValue: Date;
  show_Cheque: boolean = false;
  show_Credit_Card: boolean = false;
  show_DC: boolean = false;
  show_DivShow: boolean = false;
  _navigateAssetRequestId: string;
  message: string;
  fieldPaymentArray: Array<any> = [];
  tempfieldPaymentArray: Array<any> = [];
  newPaymentAttribute: any = {};
  modalRef: BsModalRef;
  _arNumber: string;
  _Cheque: string;
  _Credit_Card: string;
  _DC: string;
  _assetRequestId: string;
  PaymentId: any;
  AssetType: any;
  _poNumber: string;
  _assetTypeName: string;
  public currentUser: any;


  constructor(public materializePOService: MaterializePOService,
    public modalService: BsModalService,
    public _activatedRoute: ActivatedRoute,
    private toastr: ToastrService,
    public _router: Router) {
  }
  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    this._assetRequestId = this._activatedRoute.snapshot.queryParams["AssetRequestId"];
    
    this.myDateValue = new Date();
    let AssetRequestId = this._activatedRoute.snapshot.queryParams["AssetRequestId"];
    this.materializePOService.getPaymentDetails(AssetRequestId);
    this.materializePOService.getPaymentDetailsCurrentDate(AssetRequestId);
    this.materializePOService.getOtherAssetTypeSpecification(AssetRequestId);
    
    this._arNumber = this._activatedRoute.snapshot.queryParams["ARNumber"];
    this.AssetType = this._activatedRoute.snapshot.queryParams["AssetType"];
    this._poNumber = this._activatedRoute.snapshot.queryParams["PONumber"];
    this._assetTypeName = this._activatedRoute.snapshot.queryParams["AssetTypeName"];
    this._navigateAssetRequestId = AssetRequestId;

  }

  onValueChange(value: Date): void {
    //this.data = value;
  }

  toggleDivshow() {
    this.show_DivShow = !this.show_DivShow;
    this._Cheque = '0';
    this._Credit_Card = '0';
    this._DC = '0';
  }

  toggleCheque() {
    this.show_Cheque = !this.show_Cheque;
    if (this.show_Cheque) {
      this.show_Cheque = true;
      this.show_Credit_Card = false;
      this.show_DC = false;
      this._Cheque = '1';
      this._PaymentMode = 'Cheque';
    }
    else {
      this.show_Cheque = false;
      this.show_Cheque = false;
      this.show_DC = false;
    }
  }
  toggleCC() {
    this.show_Credit_Card = !this.show_Credit_Card;
    if (this.show_Credit_Card) {
      this.show_Cheque = false;
      this.show_Credit_Card = true;
      this.show_DC = false;
      this._Credit_Card = '1';
      this._PaymentMode = 'Credit Card';
    }
    else {
      this.show_Cheque = false;
      this.show_Credit_Card = false;
      this.show_DC = false;
    }
  }
  toggleDT() {
    this.show_DC = !this.show_DC;
    if (this.show_DC) {
      this.show_Cheque = false;
      this.show_Credit_Card = false;
      this.show_DC = true;
      this._DC = '1';
      this._PaymentMode = 'DC';
    }
    else {
      this.show_Cheque = false;
      this.show_Credit_Card = false;
      this.show_DC = false;
    }
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
  
  openModal(template: TemplateRef<any>) {
    this.modalRef = this.modalService.show(template, Object.assign({}, { class: 'gray' }));
  }
  onBackButtonClick() {
    this._router.navigate(['/assetrequests/materializepos/materializepos']);
  }
  
  openModalViewYesorNo(templateYesorNo: TemplateRef<any>, PaymentId) {
    this.modalRef = this.modalService.show(templateYesorNo, { class: 'gray modal-md' });
    this.PaymentId = PaymentId;
  }
  confirm(): void {
    this.message = 'Confirmed!';
    this.modalRef.hide();
    this.materializePOService.DeletePaymentsById(this.PaymentId, this.currentUser.UserId)
      .subscribe(x => {
        this.materializePOService.getPaymentDetails(this._assetRequestId);
        this.materializePOService.getPaymentDetailsCurrentDate(this._assetRequestId);
      });
    this.PaymentId = "";
  }

  decline(): void {
    this.message = 'Declined!';
    this.modalRef.hide();
  }


  resetForm() {
    this.fieldPaymentArray = [];
    this.tempfieldPaymentArray = [];
  }

  
  onPaymentSubmit(form: NgForm) {
    let temp = 0;
    this.tempfieldPaymentArray.push({
      PaymentMode: this._PaymentMode,
      ChequeNo: form.value.ChequeNo_,
      ChequeAmount: form.value.ChequeAmount_,
      ChequeBankName: form.value.ChequeBankName_,
      ChequeBranch: form.value.ChequeBranch_,
      Payee: form.value.Payee_,
      ChequeDate: form.value.ChequeDate_,
      CCName: form.value.CCName_,
      CCNo: form.value.CCNo_,
      CCAmount: form.value.CCAmount_,
      DC_TransactionIdentifier: form.value.DC_TransactionIdentifier_,
      DC_Transferer: form.value.DC_Transferer_,
      DCAmount: form.value.DCAmount_,
      BaseAmount: form.value.BaseAmount_,
      Tax: form.value.Tax_,
      DT: form.value.DT_,
      Cheque: form.value.Cheque_,
      CreditCard: form.value.CreditCard_
    });

    if (this._Cheque == '0' && this._Credit_Card == '0' && this._DC == '0') {
      this.toastr.warning('Please select payment mode.');
      temp = 1;
    }
    else {
      temp = 0;
    }
    console.log(this.tempfieldPaymentArray);
    if (temp == 0) {
      if (this._PaymentMode == 'Cheque') {
        if (!this.tempfieldPaymentArray.map((item) => item.ChequeNo)[0]
          || !this.tempfieldPaymentArray.map((item) => item.ChequeAmount)[0]
          || !this.tempfieldPaymentArray.map((item) => item.ChequeBankName)[0]
          || !this.tempfieldPaymentArray.map((item) => item.ChequeBranch)[0]
          || !this.tempfieldPaymentArray.map((item) => item.ChequeDate)[0]
          || !this.tempfieldPaymentArray.map((item) => item.Payee)[0]
          || !this.tempfieldPaymentArray.map((item) => item.BaseAmount)[0]
          || !this.tempfieldPaymentArray.map((item) => item.Tax)[0]) {
          this.toastr.warning('Please fill required fields');
          temp = 1;
        }
        else {
          temp = 0;
        }
      }
    }
    if (temp == 0) {
      if (this._PaymentMode == 'Credit Card') {
        if (
          !this.tempfieldPaymentArray.map((item) => item.CCName)[0]
          || !this.tempfieldPaymentArray.map((item) => item.CCNo)[0]
          || !this.tempfieldPaymentArray.map((item) => item.CCAmount)[0]
          || !this.tempfieldPaymentArray.map((item) => item.BaseAmount)[0]
          || !this.tempfieldPaymentArray.map((item) => item.Tax)[0]
         ) {
          this.toastr.warning('Please fill required fields');
          temp = 1;
        }
        else {
          temp = 0;
        }
      }
    }
    if (temp == 0) {
      if (this._PaymentMode == 'DC') {
        if (!this.tempfieldPaymentArray.map((item) => item.DC_TransactionIdentifier)[0] ||
          !this.tempfieldPaymentArray.map((item) => item.DC_Transferer)[0] ||
          !this.tempfieldPaymentArray.map((item) => item.DCAmount)[0] ||
          !this.tempfieldPaymentArray.map((item) => item.BaseAmount)[0] ||
          !this.tempfieldPaymentArray.map((item) => item.Tax)[0] ) {
          this.toastr.warning('Please fill required fields');
          temp = 1;
        }
        else {
          temp = 0;
        }
      }
    }

    if (temp == 0) {
      this.tempfieldPaymentArray.map(item => {
        return {
          PaymentMode: item.PaymentMode,
          BaseAmount: item.BaseAmount,
          Tax: item.Tax,
          ChequeNo: item.ChequeNo,
          ChequeAmount: item.ChequeAmount,
          ChequeBankName: item.ChequeBankName,
          ChequeBranch: item.ChequeBranch,
          Payee: item.Payee,
          ChequeDate: item.ChequeDate,
          CCName: item.CCName,
          CCNo: item.CCNo,
          CCAmount: item.CCAmount,
          DC_TransactionIdentifier: item.DC_TransactionIdentifier,
          DC_Transferer: item.DC_Transferer,
          DCAmount: item.DCAmount,
        }
      }).forEach(item => this.fieldPaymentArray.push(item));

      this.show_Cheque = false;
      this.show_Credit_Card = false;
      this.show_DC = false;
      temp = 0;
      form.reset();
      this.show_DivShow = false;

      const AssetRequestPayments = {
        AssetRequestId: this._navigateAssetRequestId,
        SpecificationArray: this.fieldPaymentArray
      }
      this.materializePOService.InsertPaymentDetails(AssetRequestPayments.AssetRequestId,this.currentUser.UserId,
        AssetRequestPayments.SpecificationArray)
        .subscribe(data => {
          this.resetForm();
          this.toastr.success('Payment has been saved successfully.');
          this.materializePOService.getPaymentDetails(AssetRequestPayments.AssetRequestId);
          this.materializePOService.getPaymentDetailsCurrentDate(AssetRequestPayments.AssetRequestId);
        }, (error) => {
          console.log(error);
        })
    }

    this.tempfieldPaymentArray = [];
  }

  
  btnClickRaisePO() {
    const AssetRequestPayments = {
      AssetRequestId: this._navigateAssetRequestId,
      SpecificationArray: this.fieldPaymentArray
    }
    console.log(AssetRequestPayments);
    console.log(AssetRequestPayments.SpecificationArray);
    // this.raisePoService.postAssetRequestPayments(AssetRequestPayments.AssetRequestId,
    //   AssetRequestPayments.SpecificationArray)
    //   .subscribe(data => {
    //     this.resetForm();
    //     //form.reset();
    //     this.toastr.success('Raise PO has been saved successfully.');
    //   }, (error) => {
    //     console.log(error);
    //   })
  }

  ConvertToAsset(){
    this.materializePOService.PostConvertToAsset(this._assetRequestId);

  }
  
  btnClickView = function () {
    this._router.navigate(['/assetrequests/viewmaterializepo/viewmaterializepo'], { queryParams: { AssetRequestId: this._navigateAssetRequestId, ARNumber: this._arNumber, PONumber: this._poNumber, AssetTypeName: this._assetTypeName } });
  };

  

  p: number = 1;
}
