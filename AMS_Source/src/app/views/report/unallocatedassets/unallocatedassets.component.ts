import { Component, OnInit } from '@angular/core';
import { ReportService } from '../shared/report.service';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-unallocatedassets',
  templateUrl: './unallocatedassets.component.html',
  styleUrls: ['./unallocatedassets.component.scss']
})
export class UnallocatedassetsComponent implements OnInit {
  public currentUser: any;
  constructor(public reportService: ReportService) { }

  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));    
    this.reportService.GetUnallocatedAssets();
  }
  p: number = 1;
}
