import { Component, OnInit, TemplateRef, Input } from '@angular/core';
import { Asset, AssetAllocation, GetHistoryModel } from '../shared/allocatedassetslist.model';
import { AllocatedAssetsService } from '../shared/allocatedassetslist.service';

import { BsModalService, } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ToastrService } from 'ngx-toastr';
@Component({
  selector: 'app-allocatedassets-list',
  templateUrl: './allocatedassets-list.component.html',
  styleUrls: ['./allocatedassets-list.component.scss']
})
export class AllocatedassetsListComponent implements OnInit {

  modalRef: BsModalRef;
  message: string; // added
  AllocationId: string;
  public currentUser: any;
  _comments:string;

  constructor(public allocatedAssetsService: AllocatedAssetsService,
    private modalService: BsModalService,
    private toastr: ToastrService
  ) {
  }



  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));    
    //this.allocatedAssetsService.selectedAsset.CreatedBy = this.currentUser.UserId;
     
    this.allocatedAssetsService.GetAllocatedAssets();

  }

  openModal(template: TemplateRef<any>, AssetId) {
    this.modalRef = this.modalService.show(template, Object.assign({}, { class: 'gray modal-lg' }));
    this.allocatedAssetsService.getAssetSpecificationsList(AssetId);
  }
  openModalView(templateView: TemplateRef<any>, AssetId) {
    this.modalRef = this.modalService.show(templateView, Object.assign({}, { class: 'gray modal-lg' }));
    this.allocatedAssetsService.GetAssetAllocationByAssetId(AssetId);
  }

  openModalViewYesorNo(templateYesorNo: TemplateRef<any>, id, Comments) {    
    this.modalRef = this.modalService.show(templateYesorNo, { class: 'gray modal-md' });
    this.AllocationId = id;
    this._comments = Comments;    
  }
  confirm(): void {    
    this.message = 'Confirmed!';
    this.modalRef.hide();
    
      this._comments = ((document.getElementById("dtComments") as HTMLInputElement)).value;
      let temp = 0;
      if ( this._comments != "") {
        temp = 0;
      }
      else {
        this.toastr.warning('Please fill the required fields.');       
        temp = 1;
      }
      if(temp==0){
      this.allocatedAssetsService.UpdateAssetAllocationDetails(this.AllocationId, this.currentUser.UserId, this._comments)
        .subscribe(x => {
          this.allocatedAssetsService.GetAllocatedAssets();       
          if(this._comments==null){
            this.toastr.warning('Please fill the required field.');
              } 
        });
      this.AllocationId = "";      
    }    
  }
  decline(): void {
    this.message = 'Declined!';
    this.modalRef.hide();
  }


  // onDelete(AssetAllocationId) {
  //   if (confirm("Are you sure to delete? " + AssetAllocationId)) {
  //     console.log("Implement delete functionality here");
  //     this.allocatedAssetsService.UpdateAssetAllocationDetails(AssetAllocationId, this.currentUser.UserId)
  //       .subscribe(x => {
  //         this.allocatedAssetsService.GetAllocatedAssets();
  //       })
  //   }
  //}


  p: number = 1;
}



