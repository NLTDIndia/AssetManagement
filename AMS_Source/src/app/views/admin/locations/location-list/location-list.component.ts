import { Component, OnInit, TemplateRef } from '@angular/core';
import { Location } from '../shared/location.model';
import { LocationService } from '../shared/location.service';
import { ToastrService } from 'ngx-toastr';
import { BsModalService } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ActivatedRoute, Router, Params } from '@angular/router';
@Component({
  selector: 'app-location-list',
  templateUrl: './location-list.component.html',
  styleUrls: ['./location-list.component.scss']
})
export class LocationListComponent implements OnInit {
  message: string;
  modalRef: BsModalRef;
  _locationId: string;
  public currentUser:any;
  constructor(public locationService: LocationService,
     public modalService: BsModalService,
     public _activatedRoute: ActivatedRoute,
     public _router: Router,
     private toastr: ToastrService) {      
     }

  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    this.locationService.getLocationList();
  }
   showForEdit(loc: Location) {
    this._router.navigate(['/admin/location/location'], { queryParams: { LocationId:  loc.Id }});   
    //this.locationService.selectedLocation = Object.assign({}, loc);
  }

   openModalViewYesorNo(templateYesorNo: TemplateRef<any>, LocationId) {
    this.modalRef = this.modalService.show(templateYesorNo, { class: 'gray modal-md' });
    this._locationId = LocationId;

  }
  confirm(): void {
    this.message = 'Confirmed!';
    this.modalRef.hide();
    this.locationService.deleteLocation(this._locationId, this.currentUser.UserId)
      .subscribe(x => {
        this.locationService.getLocationList();
        this.toastr.success('Location has been deleted successfully.');
      })
    this._locationId = "";
  }

  decline(): void {
    this.message = 'Declined!';
    this.modalRef.hide();
  }

  p: number = 1;
}
