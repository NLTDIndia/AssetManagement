import { Component, OnInit, TemplateRef } from '@angular/core';
import { NgForm } from '@angular/forms';
import { AssetAllocationService } from '../shared/assetallocationlist.service';
import { EmployeeDetailsModel, AssetTypeModel, AssetCategoryModel, AssetLocationModel, UnallocatedAssetsModel, GetHistoryModel, AssetSpecifications }
  from '../shared/assetallocationlist.model';
import { BsModalService } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ToastrService } from 'ngx-toastr';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-assetallocations',
  templateUrl: './assetallocations.component.html',
  styleUrls: ['./assetallocations.component.scss']
})
export class AssetallocationsComponent implements OnInit {
  modalRef: BsModalRef;
  fieldArray: Array<any> = [];
  newAttribute: any = {};
  _assetId: string;
  FileUpload_Name: string;
  _locationId: string;
  _employeeId: string;
  _formData: string;
  myFiles: FileList;
  _comments: string;

  public currentUser: any;

  constructor(public assetAllocationService: AssetAllocationService,
    private modalService: BsModalService,
    private toastr: ToastrService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router) {

  }

  openModal(template: TemplateRef<any>, AssetId) {
    this.modalRef = this.modalService.show(template, Object.assign({}, { class: 'gray modal-lg' }));
    this.assetAllocationService.getAssetList();
    this._assetId = AssetId;
  }

  openModalView(templateView: TemplateRef<any>, AssetId) {
    this.modalRef = this.modalService.show(templateView, Object.assign({}, { class: 'gray modal-lg' }));
    this.assetAllocationService.GetAssetAllocationByAssetId(AssetId);
    //this._assetId = AssetId;
  }
  openModalSpec(templateSpec: TemplateRef<any>, AssetId) {
    this.modalRef = this.modalService.show(templateSpec, Object.assign({}, { class: 'gray modal-lg' }));
    this.assetAllocationService.getAssetSpecificationsList(AssetId);
  }


  ngOnInit() {   
    this.newAttribute = { EmployeeId: '0', LocationId: '0', Comments: '' };
    this.assetAllocationService.GetEmployeeDetails();
    this.assetAllocationService.GetLocationDetails();
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    this.assetAllocationService.getAssetList();
    
  }
 
  ClickOk() {
    this.fieldArray.push({
      EmployeeId: this.newAttribute.EmployeeId,
      LocationId: this.newAttribute.LocationId,
      Comments: this.newAttribute.Comments,
    });
    let temp = 0;
    if (this.newAttribute.EmployeeId != "") {
      temp = 0;
    }
    else {
      this.toastr.warning('Please fill the required fields.');
      this.fieldArray = [];
      temp = 1;
    }
    if (temp == 0) {
      if (this.newAttribute.LocationId != "") {
        temp = 0;
      }
      else {
        this.toastr.warning('Please fill the required fields.');
        this.fieldArray = [];
        temp = 1;
      }
    }
    if (temp == 0) {
      if (this.newAttribute.Comments != "") {
        temp = 0;
      }
      else {
        this.toastr.warning('Please fill the required fields.');
        this.fieldArray = [];
        temp = 1;
      }
    }

    if (temp == 0) {
      this.newAttribute = {};
      const AssetAllocationSpecification = {
        AssetAllocationArray: this.fieldArray
      };

      this.assetAllocationService.UpdateAssetAllocations(this._assetId, AssetAllocationSpecification.AssetAllocationArray)
        .subscribe(data => {
          this.assetAllocationService.getAssetList();
          this.resetForm();

        }, (error) => {
          console.log(error);
        })
      this.assetAllocationService.getAssetList();
      this.fieldArray = [];        
    }
  }

  resetForm() {
    this.fieldArray = [];
    this.modalRef.hide();
  }

  p: number = 1;
}
