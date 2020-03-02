import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { RouterModule, Routes } from '@angular/router';
import { NgxPaginationModule } from 'ngx-pagination';
import { PendingassetsComponent } from './pendingassets/pendingassets.component';
import { UnallocatedassetsComponent } from './unallocatedassets/unallocatedassets.component';
import { ReportService } from './shared/report.service';
import { ReportRoutingModule } from './report-routing.module';
import { AppGlobals } from '../../app.global';
import { NgbModule, NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { BsDatepickerModule } from 'ngx-bootstrap';
@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        HttpModule,
        RouterModule,
        NgxPaginationModule,
        ReportRoutingModule,
        NgbModule.forRoot(),
        BsDatepickerModule.forRoot(),
    ],
    declarations: [PendingassetsComponent, UnallocatedassetsComponent],
    providers: [ReportService, AppGlobals, NgbActiveModal]
})

export class ReportModule { }