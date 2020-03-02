import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { NullAstVisitor } from '@angular/compiler';
import { VendorService } from '../shared/vendors.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-vendor',
  templateUrl: './vendor.component.html',
  styleUrls: ['./vendor.component.scss']
})
export class VendorComponent implements OnInit {
  public currentUser: any;
  constructor(public vendorService: VendorService, private toastr: ToastrService) {  
  }

  ngOnInit() {
    this.resetForm();
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    this.vendorService.selectedVendor.CreatedBy = this.currentUser.UserId;
  
  }

  resetForm(form?: NgForm) {
    if (form != null)
      form.reset;
    this.vendorService.selectedVendor = {
      Id: null,
      Name: '',
      ContactPerson:'',
      AddressLine1: '',
      AddressLine2: '',
      Area: '',
      City: '',
      Pincode: '',
      State: '',
      MobileNo: '',
      Email: '',
      LandLineNo: '',
      CreatedOn: '',
      CreatedBy: '',
      LastModifiedOn: '',
      LastModifiedBy: '',
      strCreatedOn: ''
    }
  }

  onSubmit(form: NgForm) {
    if (form.value.Id == null) {
      this.vendorService.postVendor(form.value)
        .subscribe(data => {
          this.resetForm(form);
          this.vendorService.getVendorDetailsList();
          this.toastr.success('Vendor has been saved successfully.');
        }, (error) => {
          console.log(error);
        })
    }
    else {
      this.vendorService.postVendordetails(form.value.Id, form.value)
        .subscribe(data => {
          this.resetForm(form);
          this.vendorService.getVendorDetailsList();
          this.toastr.success('Vendor has been updated successfully.');
        }, (error) => {
          console.log(error);
        })
    }
  }
  public restrictNumeric(e) {
    let input;
    if (e.metaKey || e.ctrlKey) {
      return true;
    }
    if (e.which === 32) {
      return false;
    }
    if (e.which === 0) {
      return true;
    }
    if (e.which < 33) {
      return true;
    }
    input = String.fromCharCode(e.which);
    return !!/[\d\s]/.test(input);
  }

}
