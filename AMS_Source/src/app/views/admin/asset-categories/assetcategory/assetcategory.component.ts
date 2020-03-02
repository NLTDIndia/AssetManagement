import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { NullAstVisitor } from '@angular/compiler';
import { ToastrService } from 'ngx-toastr';
import { AssetCategoryService } from '../shared/asset.service';

@Component({
  selector: 'app-assetcategory',
  templateUrl: './assetcategory.component.html',
  styleUrls: ['./assetcategory.component.scss']
})
export class AssetcategoryComponent implements OnInit {
  public currentUser: any;
  constructor(public assetCategoryService: AssetCategoryService,
    private toastr: ToastrService) {    
   }

  ngOnInit() {  
    this.resetForm();
    this.currentUser = JSON.parse(localStorage.getItem('currentUser')) ;
    this.assetCategoryService.selectedAssetCategory.CreatedBy = this.currentUser.UserId;
  
  }
  resetForm(form?: NgForm) {
    if (form != null)
      form.reset;
    this.assetCategoryService.selectedAssetCategory = {
      Id: null,
      Name: '',
      CreatedBy: '',
      LastModifiedBy: '',
      IsActive: false
    }
  }

  onSubmit(form: NgForm) {
    if (form.value.Id == null) {
      this.assetCategoryService.postAssetCategory(form.value)
        .subscribe(data => {
          this.resetForm(form);
          this.assetCategoryService.getAssetCategoryList();
          this.toastr.success('Asset Category has been saved successfully.');
        }, (error) => {
          console.log(error);
        })
    }
    else {
      this.assetCategoryService.putAssetCategory(form.value.Id, form.value,this.currentUser.UserId)
        .subscribe(data => {
          this.resetForm(form);
          this.assetCategoryService.getAssetCategoryList();        ;
        }, (error) => {
          console.log(error);
        })
    }
  }

 
}


