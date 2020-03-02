import { Component, OnInit, TemplateRef } from '@angular/core';
import { RaiseRequest } from '../shared/raiserequest.model';
import { RaiseRequestService } from '../shared/raiserequest.service';
import { BsModalService } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ToastrService } from 'ngx-toastr';
@Component({
  selector: 'app-raiserequest-list',
  templateUrl: './raiserequest-list.component.html',
  styleUrls: ['./raiserequest-list.component.scss']
})
export class RaiserequestListComponent implements OnInit {
  modalRef: BsModalRef;
  message: string;
  _assetRequestId: string;
  AssetRequestId: string;
  public currentUser: any;
  constructor(public raiseRequestService: RaiseRequestService,
    private modalService: BsModalService,
    private toastr: ToastrService) {   
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

  ngOnInit() {
    this.raiseRequestService.getRaiseRequestList();
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
  }

  sendForRequest(id: number) {
    this.raiseRequestService.postSendRaiseRequst(id, this.currentUser.UserId)
      .subscribe(data => {
        this.raiseRequestService.getRaiseRequestList();
        this.toastr.success('Request has been raised successfully.');
      })
  }
  openModalViewYesorNo(templateYesorNo: TemplateRef<any>, id) {
    this.modalRef = this.modalService.show(templateYesorNo, { class: 'gray modal-md' });
    this.AssetRequestId = id;
  }
  confirm(): void {
    this.message = 'Confirmed!';
    this.modalRef.hide();
    this.raiseRequestService.deleteRaiseRequest(this.AssetRequestId, this.currentUser.UserId)
      .subscribe(x => {
        this.raiseRequestService.getRaiseRequestList();
      });
    this.AssetRequestId = "";

  }

  decline(): void {
    this.message = 'Declined!';
    this.modalRef.hide();
  }

  onDelete(id: number) {
    if (confirm('Are you sure to delete this record ?' + id)) {
      this.raiseRequestService.deleteRaiseRequest(id, this.currentUser.UserId)
        .subscribe(x => {
          this.raiseRequestService.getRaiseRequestList();
          this.toastr.error("The selected request has been deleted.");
        })
    }
  }


  p: number = 1;
}
