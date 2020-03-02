import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { LocationService } from '../shared/location.service';
import { ToastrService } from 'ngx-toastr';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-location',
  templateUrl: './location.component.html',
  styleUrls: ['./location.component.scss']
})
export class LocationComponent implements OnInit {
  public currentUser: any;
  public _locationId: string

  constructor(public locationService: LocationService,
    private toastr: ToastrService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router, ) {
      // this._locationId = this._activatedRoute.snapshot.queryParams["LocationId"];
      
  }

  ngOnInit() {
    this.resetForm();
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));    
    this.locationService.selectedLocation.CreatedBy = this.currentUser.UserId; 
  }
  resetForm(form?: NgForm) {
    if (form != null)
      form.reset;
    this.locationService.selectedLocation = {
      Id: null,
      Name: '',
      Address: '',
      CreatedBy: '',
      LastModifiedBy: ''
    }
  }

  onSubmit(form: NgForm) {

    if (form.value.Id == null) {
      this.locationService.postLocation(form.value)
        .subscribe(data => {
          this.resetForm(form);
          this.locationService.getLocationList();
          this.toastr.success('Location has been saved successfully.');
        }, (error) => {
          console.log(error);
        })
    }
    else {
      this.locationService.postLocationdetails(form.value.Id, form.value, this.currentUser.UserId)
        .subscribe(data => {
          this.resetForm(form);
          this.locationService.getLocationList();
          this.toastr.success('Location has been updated successfully.');
        }, (error) => {
          console.log(error);
        })
    }
  }

}
