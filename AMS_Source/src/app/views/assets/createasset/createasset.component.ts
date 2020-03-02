import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { CreateAssetService } from './shared/createasset.service';
import { BsModalService } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { formArrayNameProvider } from '../../../../../node_modules/@angular/forms/src/directives/reactive_directives/form_group_name';
@Component({
  selector: 'app-createasset',
  templateUrl: './createasset.component.html',
  styleUrls: ['./createasset.component.scss']
})
export class CreateassetComponent implements OnInit {

  fieldArray: Array<any>;
  modalRef: BsModalRef;
  message: string;
  _assetRequestId: string;
  public currentUser: any;

  constructor(public createAssetService: CreateAssetService,
    private modalService: BsModalService,
    private toastr: ToastrService
  ) {
    this.createAssetService.filteredassetCategoryList = [];
    this.createAssetService.filteredassetTypeSpecList = [];    
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
    this.createAssetService.filteredassetCategoryList = [];
    if (this.createAssetService.selectedCreateAsset.AssetCategoryId != "0") {
      this.createAssetService.getAssetType(this.createAssetService.selectedCreateAsset.AssetCategoryId)
      .subscribe(data => {
        debugger;
        this.createAssetService.filteredassetCategoryList = data;
      });
    }
  }

  filterForAssetTypeId() {
    this.createAssetService.filteredassetTypeSpecList = [];
    if (this.createAssetService.selectedCreateAsset.AssetTypeId != "0") {
      this.createAssetService.filteredassetTypeSpecList = this.createAssetService.assetTypeSpecList.filter((item) => item.AssetTypeId == this.createAssetService.selectedCreateAsset.AssetTypeId);

    }
  }


  ngOnInit() {
    this.resetForm();
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    this.createAssetService.selectedCreateAsset.CreatedBy = this.currentUser.UserId;    
  }

  resetForm(form?: NgForm) {
    if (form != null)
      form.reset;
    this.createAssetService.selectedCreateAsset = {
      AssetIdentifier: '',
      Price: '0',
      PurchaseOrderOn: '',
      ActivationDate: '',
      ExpiryDate: '',
      ServiceTagNumber: '',
      CreatedBy: '',
      AssetTypeId: '0',
      AssetCategoryId : '0',
      AssetCategoryName : '',
      SpecArray: []
    }
    this.createAssetService.filteredassetCategoryList = [];
    this.createAssetService.filteredassetTypeSpecList = [];

  }

  onSubmit(form: NgForm) {
    let t = 0;

    const newArray = this.createAssetService.filteredassetTypeSpecList.map(o => {
      return { AssetTypeSpectId: o.AssetTypeSpecId, AssetTypeSpecValue: o.Value }
    })

    this.fieldArray = newArray;

    if (form.value.AssetCategoryId == "0" || form.value.AssetTypeId == "0" ||
    form.value.PurchaseOrderOn == "" || form.value.ActivationDate == "" ||
      form.value.Price == "0" || this.fieldArray == null) {
      this.toastr.warning('Please fill the required fields');

      t = 1;
    }
    if (t == 0) {
      
        this.createAssetService.postCreateAsset(form.value.AssetIdentifier, form.value.Price, form.value.PurchaseOrderOn, form.value.ActivationDate, form.value.ExpiryDate, form.value.ServiceTagNumber, form.value.AssetTypeId, this.fieldArray)
          .subscribe(data => {
            this.resetForm(form);
            this.toastr.success('Asset has been created successfully.');
          })
      
      t = 0;
    }
  }
  
}