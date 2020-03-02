import { Component, OnInit, TemplateRef } from '@angular/core';
import { QuotationService } from '../shared/quotation.service';
import { ActivatedRoute, Router } from '@angular/router';
import { BsModalService } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-quotation-list',
  templateUrl: './quotation-list.component.html',
  styleUrls: ['./quotation-list.component.scss']
})
export class QuotationListComponent implements OnInit {

  modalRef: BsModalRef;
  _assetQuotationId: string;

  public show: boolean = false;
  public buttonName: any = 'Show';

  fieldArray: Array<any> = [];
  newAttribute: any = {};
  FileUpload_Name: string;
  _assetRequestId: string;
  _assetRequestNumber: string;
  _formData;
  myFiles: FileList;
  selectedVendor: string; 
  constructor(public quotationService: QuotationService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router,
    private toastr: ToastrService,
    public modalService: BsModalService) {
   
  }

  ngOnInit() {
  
    this._assetRequestId = this._activatedRoute.snapshot.queryParams["AssetRequestId"];
    this._assetRequestNumber = this._activatedRoute.snapshot.queryParams["AssetRequestNumber"];
   
    this.quotationService.getVendorList();
  
    this.newAttribute = {
      Name: '0',
    };
   
  }

  setSelectedVendor(vendor) {
    this.selectedVendor = vendor.target.options[vendor.target.selectedIndex].text;
  }

  setTwoDecimal(event) {
    event.target.value = parseFloat(event.key).toFixed(2);
  }

  onSubmit(formEvent, fileEvent) {   
    if (!this.newAttribute.AssetVendorId || this.newAttribute.AssetVendorId === '0' ||
      !this.newAttribute.price || this.newAttribute.price === '0' ||
      !this.newAttribute.qty || this.newAttribute.qty === '0') {
      this.toastr.warning('Please fill the required fields');
    }   
    else {
      this.newAttribute.AssetRequestId = this._assetRequestId;
      this.newAttribute.Entity = "AssetQuotation";
      this.quotationService.postAssetQuotation(fileEvent, this.newAttribute)
        .subscribe(data => {
          if (data === 'success') {
            this.resetForm(fileEvent);
            this.toastr.success('Quotation has been added successfully.');
          }
          else {
            var sel = document.getElementById("#newAttributeName");
            var s =
              this.toastr.error('Quotation is already added for Vendor "' + this.selectedVendor + '".');
          }
        }, (error) => {
          console.log(error);
        })
    }
  }
  resetForm(fileEvent) {
    this.newAttribute = {};
    fileEvent.value = "";
  }

  onBackButtonClick() {
    this._router.navigate(['/assetrequests/quotations/quotations']);
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

}
