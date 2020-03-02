import { Component, OnInit, Input } from '@angular/core';
import { NgForm } from '@angular/forms';
// import { NullAstVisitor } from '@angular/compiler';

import { AssetTypeService } from '../shared/assettype.service';
import { AssetCategoryService } from '../../asset-categories/shared/asset.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-assettype',
  templateUrl: './assettype.component.html',
  styleUrls: ['./assettype.component.scss']
})
export class AssettypeComponent implements OnInit {
  public currentUser: any;
  constructor(public assetTypeService: AssetTypeService, private toastr: ToastrService) {

  }


  fieldArray: Array<any> = [];
  newAttribute: any = {};

  addFieldValue() {
    if (this.newAttribute.name && this.newAttribute.valuetype !== "0") {
      this.fieldArray.push({ Name: this.newAttribute.name, ValueType: this.newAttribute.valuetype })
      //this.newAttribute = {};
      this.newAttribute = {
        valuetype: '0'
      }
    }
  }

  deleteFieldValue(index) {
    this.fieldArray.splice(index, 1);
  }

  ngOnInit() {
    this.resetForm();
    this.newAttribute = {
      valuetype: '0'
    }
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    this.assetTypeService.selectedAssetType.CreatedBy = this.currentUser.UserId;
  }

  resetForm(form?: NgForm) {
    if (form != null)
      form.reset;
    this.assetTypeService.selectedAssetType = {
      AssetTypeId: null,
      Name: '',
      AssetCategoryId: '0',
      AssetCategoryName: '',
      IsActive: false,
      SpecificationArray: [],
      CreatedBy: '',
      LastModifiedBy: '',
      AddonsTypeId:'0'
    }
    this.fieldArray = [];
  }

  onSubmit(form: NgForm) {

    const AssetTypeSecification = {
      Name: this.assetTypeService.selectedAssetType.Name,
      AssetCategoryId: this.assetTypeService.selectedAssetType.AssetCategoryId,
      SpecificationArray: this.fieldArray,
      AddonsTypeId: this.assetTypeService.selectedAssetType.AddonsTypeId
    };

    if (form.value.AssetTypeId == null) {
      this.assetTypeService.postAssetType(AssetTypeSecification.Name, AssetTypeSecification.AssetCategoryId, form.value.CreatedBy, AssetTypeSecification.AddonsTypeId, AssetTypeSecification.SpecificationArray)
        .subscribe(data => {
          this.resetForm(form);
          this.assetTypeService.getAssetTypeList();
          this.toastr.success('Asset Type has beed Saved Succcessfully');
        }, (error) => {
          console.log(error);
        })
    }

  }

}

