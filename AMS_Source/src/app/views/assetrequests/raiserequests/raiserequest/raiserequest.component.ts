import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { RaiseRequestService } from '../shared/raiserequest.service';
import { BsModalService } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ToastrService } from 'ngx-toastr';
import { formArrayNameProvider } from '../../../../../../node_modules/@angular/forms/src/directives/reactive_directives/form_group_name';
@Component({
  selector: 'app-raiserequest',
  templateUrl: './raiserequest.component.html',
  styleUrls: ['./raiserequest.component.scss']
})

export class RaiserequestComponent implements OnInit {
  fieldArray: Array<any>;
  modalRef: BsModalRef;
  message: string;
  _assetRequestId: string;
  public currentUser: any;

  constructor(public raiseRequestService: RaiseRequestService,
    private modalService: BsModalService,
    private toastr: ToastrService
  ) {
    this.raiseRequestService.filteredassetCategoryList = [];
    this.raiseRequestService.filteredassetTypeSpecList = [];    
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

  filterForAssetCategoryId() {
    this.raiseRequestService.filteredassetCategoryList = [];
    if (this.raiseRequestService.selectedRaiseRequest.AssetCategoryId != "0") {
      // this.raiseRequestService.filteredassetCategoryList = this.raiseRequestService.assetCategorySpecList.filter((item) => item.AssetCategoryId == this.raiseRequestService.selectedRaiseRequest.AssetCategoryId);
      this.raiseRequestService.getAssetType(this.raiseRequestService.selectedRaiseRequest.AssetCategoryId)
      .subscribe(data => {
        debugger;
        this.raiseRequestService.filteredassetCategoryList = data;
      });
    }
  }

  filterForAssetTypeId() {
    this.raiseRequestService.filteredassetTypeSpecList = [];
    if (this.raiseRequestService.selectedRaiseRequest.AssetTypeId != "0") {
      this.raiseRequestService.filteredassetTypeSpecList = this.raiseRequestService.assetTypeSpecList.filter((item) => item.AssetTypeId == this.raiseRequestService.selectedRaiseRequest.AssetTypeId);

    }
  }


  ngOnInit() {
    this.resetForm();
    this.raiseRequestService.getRaiseRequestList();
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    this.raiseRequestService.selectedRaiseRequest.CreatedBy = this.currentUser.UserId;    
  }

  resetForm(form?: NgForm) {
    if (form != null)
      form.reset;
    this.raiseRequestService.selectedRaiseRequest = {
      Id: '',
      AssetTypeId: '0',
      AssetRequestId: '',
      Name: '',
      LocationId: '0',
      EmployeeId: '0',
      CreatedBy: '',
      LastModifiedBy: '',
      AssetTypeName: '',
      ValueType: '',
      SpecArray: [],
      Comments: '',
      Quantity: '',
      AssetCategoryId: '0',
      AssetCategoryName: '',
      EmployeeName: ''
    }
    this.raiseRequestService.filteredassetCategoryList = [];
    this.raiseRequestService.filteredassetTypeSpecList = [];

  }

  // Save(form: NgForm) {
  //   let t = 0;
  //   const newArray = this.raiseRequestService.filteredassetTypeSpecList.map(o => {
  //     return { AssetTypeSpectId: o.AssetTypeSpecId, AssetTypeSpecValue: o.Value }
  //   })
  //   this.fieldArray = newArray;
   
  
   
  //   // if (this.fieldArray.values.length == 0) {
  //   //   t == 1;
  //   //   this.toastr.warning('Please fill the required fields');
  //   // }

  //   if (form.value.AssetCategoryId == "0" || form.value.AssetTypeId == "0" || form.value.Quantity == "0" ||
  //     form.value.Quantity == " " ){      
  //     this.toastr.warning('Please fill the required fields');
  //     t == 1;
  //   }

  //   if (t == 0) {
  //     t = 0;
  //     this.raiseRequestService.postRaiseRequest(form.value.AssetTypeId, form.value.LocationId, form.value.Quantity, form.value.Comments, "NEW", this.fieldArray)
  //       .subscribe(data => {
  //         this.resetForm(form);
  //         this.raiseRequestService.getRaiseRequestList();
  //         this.toastr.success('Request has been saved successfully.');
  //       })

  //   }

  // }


  onSubmit(form: NgForm) {
    let t = 0;

    const newArray = this.raiseRequestService.filteredassetTypeSpecList.map(o => {
      return { AssetTypeSpectId: o.AssetTypeSpecId, AssetTypeSpecValue: o.Value }
    })

    this.fieldArray = newArray;

    if (form.value.AssetCategoryId == "0" || form.value.AssetTypeId == "0" || form.value.Quantity == "0" ||
      form.value.Quantity == " " || this.fieldArray == null) {
      this.toastr.warning('Please fill the required fields');

      t = 1;
    }
    if (t == 0) {
      if (form.value.Id == null || form.value.Id == "") {

        this.raiseRequestService.postRaiseRequest(form.value.AssetTypeId, form.value.LocationId, form.value.Quantity, form.value.Comments, "Quotation In Progress", this.fieldArray)
          .subscribe(data => {
            this.resetForm(form);
            this.raiseRequestService.getRaiseRequestList();
            this.toastr.success('Request has been raised successfully.');
          })
      }
      t = 0;
    }
  }
  sendForRequest(id: number) {
    this.raiseRequestService.postSendRaiseRequst(id, this.currentUser.UserId)
      .subscribe(data => {
        this.raiseRequestService.getRaiseRequestList();
      })
  }
  onDelete(id: number) {
    if (confirm('Are you sure to delete this record ?' + id)) {
      this.raiseRequestService.deleteRaiseRequest(id, this.currentUser.UserId)
        .subscribe(x => {
          this.raiseRequestService.getRaiseRequestList();
          this.toastr.error("The selected request has been deleted!");
        })
    }
  }
}



