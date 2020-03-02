import { Component, OnInit, TemplateRef } from '@angular/core';
import { AssetType } from '../shared/assettype.model';
import { AssetTypeService } from '../shared/assettype.service';
import { ToastrService } from 'ngx-toastr';
import { BsModalService } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ActivatedRoute, Router, Params } from '@angular/router';
@Component({
  selector: 'app-assettype-list',
  templateUrl: './assettype-list.component.html',
  styleUrls: ['./assettype-list.component.scss']
})
export class AssettypeListComponent implements OnInit {
  message: string;
  modalRef: BsModalRef;
  _assetTypeId: string;
  public currentUser: any;
  constructor(public assetTypeService: AssetTypeService,
    public modalService: BsModalService,
    private toastr: ToastrService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router) {   
  }

  ngOnInit() {
    this.assetTypeService.getAssetTypeList();
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));    
  }
 
  openModalViewYesorNo(templateYesorNo: TemplateRef<any>, AssetTypeId) {
    this.modalRef = this.modalService.show(templateYesorNo, { class: 'gray modal-md' });
    this._assetTypeId = AssetTypeId;

  }
  confirm(): void {
    this.message = 'Confirmed!';
    this.modalRef.hide();
    this.assetTypeService.deleteAssetType(this._assetTypeId, this.currentUser.UserId)
      .subscribe(x => {
        this.assetTypeService.getAssetTypeList();
      })
    this._assetTypeId = "";
    this.toastr.success('Asset Type has been deleted successfully.');
  }

  decline(): void {
    this.message = 'Declined!';
    this.modalRef.hide();
  }

  p: number = 1;
}