import { Component, OnInit } from '@angular/core';
import { ManageAssetsService } from '../shared/manageassets.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { daLocale } from 'ngx-bootstrap';

@Component({
  selector: 'app-manageasset',
  templateUrl: './manageasset.component.html',
  styleUrls: ['./manageasset.component.scss']
})
export class ManageassetComponent implements OnInit {
  public currentUser: any;
  _poNumber: string;
  _arNumber: string;
  requestedNumber: string;
  public returnValue: any;
  constructor(public manageAssetsService: ManageAssetsService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router,
    private toastr: ToastrService) {

  }

  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    if (this.requestedNumber) {
      this.manageAssetsService.GetAssetsDetails(this.selectedLink, this.requestedNumber);
    }
  }


  private selectedLink: string = "ARNumber";
  setradio(e: string, requestNumber): void {
    this.selectedLink = e;
    requestNumber.value = '';
  }

  isSelected(name: string): boolean {

    if (!this.selectedLink) { // if no radio button is selected, always return false so every nothing is shown  
      return false;
    }

    return (this.selectedLink === name); // if current radio button is selected, return true, else return false  
  }
  toggleARNumber() {

  }

  togglePONumber() {

  }
  btnEdit(AssetId, ActivationDate, ExpiryDate) {
    this._router.navigate(['/assets/manageassets/manageasset-list/manageasset-list'], { queryParams: { searchType: this.selectedLink, requestNumber: this.requestedNumber, AssetId: AssetId, ActivationDate: ActivationDate, ExpiryDate: ExpiryDate } })
  }

  search(requestedNumber) {
    this.requestedNumber = requestedNumber.value;
    if (requestedNumber.value) {
      this.manageAssetsService.GetAssetsDetails(this.selectedLink, requestedNumber.value);
    }
    else if (requestedNumber.value == '') {
      this.toastr.warning('Please enter the number.');
    }
  }
  p: number = 1;
}

