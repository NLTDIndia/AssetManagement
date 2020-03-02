import { Component, OnInit, TemplateRef } from '@angular/core';
import { AssetCategory } from '../shared/asset.model';
import { AssetCategoryService } from '../shared/asset.service';
import { BsModalService } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ToastrService } from 'ngx-toastr';
import { ActivatedRoute, Router, Params } from '@angular/router';
@Component({
  selector: 'app-assetcategory-list',
  templateUrl: './assetcategory-list.component.html',
  styleUrls: ['./assetcategory-list.component.scss']
})
export class AssetcategoryListComponent implements OnInit {
  public currentUser:any; 
  message: string;
  modalRef: BsModalRef;
  _categoryId: string;  
  constructor(public assetCategoryService: AssetCategoryService,
    public modalService: BsModalService,
    private toastr: ToastrService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router,) {   
  }

  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser')) ; 
    this.assetCategoryService.getAssetCategoryList();      
  }

  showForEdit(ac: AssetCategory) {
    this._router.navigate(['/admin/assetcategory/assetcategory']);
    this.assetCategoryService.selectedAssetCategory = Object.assign({}, ac);
  }

  openModalViewYesorNo(templateYesorNo: TemplateRef<any>, CategoryId) {
    this.modalRef = this.modalService.show(templateYesorNo, { class: 'gray modal-md' });
    this._categoryId = CategoryId;
  }
  confirm(): void {
    this.message = 'Confirmed!';
    this.modalRef.hide();
    this.assetCategoryService.deleteAssetCategory(this._categoryId, this.currentUser.UserId)
      .subscribe(x => {
        this.assetCategoryService.getAssetCategoryList();
      })
    this._categoryId = "";    
    this.toastr.success('Asset Category has been deleted successfully.');
  }

  decline(): void {
    this.message = 'Declined!';
    this.modalRef.hide();
  }

  p: number = 1;
}




