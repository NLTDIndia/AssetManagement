import { Component, OnInit } from '@angular/core';
import { BsModalService } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ManageAssetsService } from '../shared/manageassets.service';
import { AssetsModel } from '../shared/manageassets.model';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
@Component({
  selector: 'app-manageasset-list',
  templateUrl: './manageasset-list.component.html',
  styleUrls: ['./manageasset-list.component.scss']
})
export class ManageassetListComponent implements OnInit {
  public currentUser: any;
  _assetId: any;
  assetModel: any;
  modalRef: BsModalRef;
  _activationDate: any;
  _expiryDate: any;
  fieldDateArray: Array<any> = [];
   ExpiryDate: any;
   ActivationDate:any;

  private selectedLink: string = "ARNumber";
  constructor(public modalService: BsModalService,
    public manageAssetsService: ManageAssetsService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router,
    private toastr: ToastrService) { }

  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    let searchType = this._activatedRoute.snapshot.queryParams["searchType"];
    let requestNumber = this._activatedRoute.snapshot.queryParams["requestNumber"];
    this._assetId = this._activatedRoute.snapshot.queryParams["AssetId"];
    this.manageAssetsService.GetAssetsDetails(searchType, requestNumber);
    this._expiryDate = this._activatedRoute.snapshot.queryParams["ExpiryDate"];
    this._activationDate = this._activatedRoute.snapshot.queryParams["ActivationDate"]; 
    this.ExpiryDate = new Date(this._expiryDate); 
    this.ActivationDate = new Date(this._activationDate);
  }

  btnUpdate() {
    var activationDate = ((document.getElementById("dtActivationDate") as HTMLInputElement)).value;
    var expiryDate = ((document.getElementById("dtExpiryDate") as HTMLInputElement)).value;
    this.manageAssetsService.UpdateAssetDetails(this._assetId, activationDate, expiryDate , this.currentUser.UserId)
      .subscribe(
        data => {
          if (data) {           
            this.toastr.success('Data has been updated successfully.')
            this._router.navigate(['/assets/manageassets/manageassets']);
          }
          else{
            this._router.navigate(['/assets/manageassets/manageasset-list/manageasset-list']);
          }
        },
        error => {         
        });
      
  }
  onBackButtonClick() {
    this._router.navigate(['/assets/manageassets/manageassets']);
  }
}
