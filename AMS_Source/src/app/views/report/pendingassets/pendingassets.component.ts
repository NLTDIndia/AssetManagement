import { Component, OnInit } from '@angular/core';
import { ReportService } from '../shared/report.service';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-pendingassets',
  templateUrl: './pendingassets.component.html',
  styleUrls: ['./pendingassets.component.scss']
})
export class PendingassetsComponent implements OnInit {

  modalRef: BsModalRef;
  message: string; // added
  AllocationId: string;
  public currentUser: any;
  _comments:string;

  constructor(public reportService: ReportService,
    private toastr: ToastrService) { }

  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));    
    this.reportService.GetPendingAssets();
  }
  p: number = 1;
}
