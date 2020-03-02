import { Component, OnInit, TemplateRef } from '@angular/core';
import { VendorsModel } from '../shared/vendors.model';
import { VendorService } from '../shared/vendors.service';
import { ToastrService } from 'ngx-toastr';
import { BsModalService } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ActivatedRoute, Router, Params } from '@angular/router';

@Component({
  selector: 'app-vendor-list',
  templateUrl: './vendor-list.component.html',
  styleUrls: ['./vendor-list.component.scss']
})
export class VendorListComponent implements OnInit {
  message: string;
  modalRef: BsModalRef;
  _vendorId: string;
  public currentUser: any;
  constructor(public vendorService: VendorService,
    public modalService: BsModalService,
    private toastr: ToastrService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router,) {   
  }

  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    this.vendorService.getVendorDetailsList();
  }

  showForEdit(vend: VendorsModel) {
    this._router.navigate(['/admin/vendor/vendor']);
    this.vendorService.selectedVendor = Object.assign({}, vend);
  }

  openModalViewYesorNo(templateYesorNo: TemplateRef<any>, VendorId) {
    this.modalRef = this.modalService.show(templateYesorNo, { class: 'gray modal-md' });
    this._vendorId = VendorId;

  }
  confirm(): void {
    this.message = 'Confirmed!';
    this.modalRef.hide();
    this.vendorService.deleteVendor(this._vendorId, this.currentUser.UserId)
      .subscribe(x => {
        this.vendorService.getVendorDetailsList();
        this.toastr.success('Location has been deleted successfully.');
      })
    this._vendorId = "";
  }
  decline(): void {
    this.message = 'Declined!';
    this.modalRef.hide();
  }
  p: number = 1;
}
