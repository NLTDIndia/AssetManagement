import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';


import { NgxPaginationModule } from 'ngx-pagination';
import { RouterModule, Routes } from '@angular/router';
import { HttpModule } from '@angular/http';
import { AssetRequestRoutingModule } from './assetrequests-routing.module';
import { ApprovequotationsComponent } from './approvequotations/approvequotations.component';
import { ApprovequotationComponent } from './approvequotations/approvequotation/approvequotation.component'
import { QuotationsComponent } from './quotations/quotations.component';
import { QuotationComponent } from './quotations/quotation/quotation.component';

import { RaiserequestsComponent } from './raiserequests/raiserequests.component';
import { RaiserequestComponent } from './raiserequests/raiserequest/raiserequest.component';
import { RaiserequestListComponent } from './raiserequests/raiserequest-list/raiserequest-list.component';
import { AccordionModule, TooltipModule, TabsModule  } from 'ngx-bootstrap';
// import {  DatepickerModule, BsDatepickerModule } from 'ngx-bootstrap/datepicker';
import {QuotationsListComponent } from './quotations/quotations-list/quotations-list.component';
import {QuotationListComponent } from './quotations/quotation-list/quotation-list.component';
import { ApproveQuotationService } from './approvequotations/shared/approvequotation.service'
import { QuotationService } from './quotations/shared/quotation.service';
import { RaiseRequestService } from './raiserequests/shared/raiserequest.service';
import { ApprovequotationListComponent } from './approvequotations/approvequotation-list/approvequotation-list.component';
import { RaiseposComponent } from './raisepos/raisepos.component';
import { RaisepoComponent } from './raisepos/raisepo/raisepo.component';
import { RaisePoService  } from './raisepos/shared/raisepo.service';
import { PaymentdetailsComponent } from './raisepos/paymentdetails/paymentdetails.component';
import { MpopaymentdetailsComponent } from './materializepos/mpopaymentdetails/mpopaymentdetails.component';


import { AppGlobals } from '../../app.global';
import { MaterializeposComponent } from './materializepos/materializepos.component';
import { MaterializepoComponent } from './materializepos/materializepo/materializepo.component';
import { MaterializePOService } from './materializepos/shared/materializepo.service';
import { ViewmaterializepoComponent } from './materializepos/viewmaterializepo/viewmaterializepo.component';
import { BsDatepickerModule } from 'ngx-bootstrap';
import * as jsPDF from 'jspdf';
import { ViewraisepoComponent } from './raisepos/viewraisepo/viewraisepo.component';
import { TruncateModule } from 'ng2-truncate';
import {TrackRequestService} from '../assetrequests/trackrequests/shared/trackrequest.service';
import { TrackrequestsComponent } from '../assetrequests/trackrequests/trackrequests.component';
import { TrackrequestComponent } from '../assetrequests/trackrequests/trackrequest/trackrequest.component';
import { NgxWigModule } from 'ngx-wig';

@NgModule({
    imports: [
      CommonModule,
      FormsModule,
      HttpModule,
      RouterModule,
      NgxPaginationModule,
      AssetRequestRoutingModule,
      AccordionModule.forRoot(),
      BsDatepickerModule.forRoot(),
      TooltipModule.forRoot(),
      TabsModule.forRoot(),
      TruncateModule,
      NgxWigModule
      //DatepickerModule.forRoot() 
    ],
    declarations: [ ApprovequotationsComponent, 
        ApprovequotationComponent,
        QuotationsComponent,
        QuotationComponent,
        QuotationListComponent,
        RaiserequestsComponent,
        RaiserequestComponent,
        RaiserequestListComponent,
        ApprovequotationListComponent,
        RaiseposComponent,
        RaisepoComponent,
        PaymentdetailsComponent,
        MaterializeposComponent,
        MaterializepoComponent,
        ViewmaterializepoComponent,
        MpopaymentdetailsComponent,
        ViewraisepoComponent,
        QuotationListComponent,
        QuotationsListComponent,
        TrackrequestComponent, 
        TrackrequestsComponent,       
      ],
    providers: [ ApproveQuotationService,
      QuotationService,
      RaiseRequestService,
      RaisePoService,
      MaterializePOService,
      AppGlobals,
      TrackRequestService,
     ]
  
  })

  export class AssetRequestsModule { }