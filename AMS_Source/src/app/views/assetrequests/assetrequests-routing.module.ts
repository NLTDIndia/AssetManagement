import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ApprovequotationsComponent } from './approvequotations/approvequotations.component';
import { QuotationsComponent } from './quotations/quotations.component';
import { RaiserequestsComponent } from './raiserequests/raiserequests.component';
import { ApprovequotationListComponent } from './approvequotations/approvequotation-list/approvequotation-list.component';
import { RaiseposComponent } from './raisepos/raisepos.component';
import { PaymentdetailsComponent } from './raisepos/paymentdetails/paymentdetails.component';
import { MaterializeposComponent } from './materializepos/materializepos.component';
import { ViewmaterializepoComponent } from './materializepos/viewmaterializepo/viewmaterializepo.component';
import { MpopaymentdetailsComponent } from './materializepos/mpopaymentdetails/mpopaymentdetails.component';
import { ViewraisepoComponent } from './raisepos/viewraisepo/viewraisepo.component';

import {QuotationListComponent } from './quotations/quotation-list/quotation-list.component';

import {QuotationsListComponent } from './quotations/quotations-list/quotations-list.component';
import { TrackrequestsComponent } from '../assetrequests/trackrequests/trackrequests.component';


const routes: Routes = [
  {
    path: '',
    data: {
      title: 'Asset Requests'
    },
    children: [
      {
        path: 'trackrequests/trackrequests',
        component: TrackrequestsComponent,
        data: {
            title: 'Track Request'
        }
    },
      {
        path: 'raiserequests/raiserequests',
        component: RaiserequestsComponent,
        data: {
          title: 'Raise Requests'
        }
      },
      {
        path: 'quotations/quotations',
        component: QuotationsComponent,
        data: {
          title: 'Manage Quotation'
        }
      },
      {
        path: 'quotation-list/quotation-list',
        component: QuotationListComponent,
        data: {
          title: 'Manage Quotation'
        }
      },
      {
        path: 'quotations-list/quotations-list',
        component: QuotationsListComponent,
        data: {
          title: 'Manage Quotation'
        }
      },
      {
        path: 'approvequotations/approvequotations',
        component: ApprovequotationsComponent,
        data: {
          title: 'Approve Quotation'
        }
      },
      {
        path: 'approvequotation-list/approvequotation-list',
        component: ApprovequotationListComponent,
        data: {
          title: 'Approve Quotation'
        }
      },
      {
        path: 'raisepos/raisepos',
        component: RaiseposComponent,
        data: {
          title: 'Raise PO'
        }
      },
      {
        path: 'paymentdetails/paymentdetails',
        component: PaymentdetailsComponent,
        data: {
          title: 'Payment Details'
        }
      },
      {
        path: 'viewraisepo/viewraisepo',
        component: ViewraisepoComponent,
        data: {
          title: 'View Raise PO Details'
        }
      },
      {
        path: 'materializepos/materializepos',
        component: MaterializeposComponent,
        data: {
          title: 'Materialize PO'
        }
      },
      {
        path: 'viewmaterializepo/viewmaterializepo',
        component: ViewmaterializepoComponent,
        data: {
          title: 'View Materialize PO'
        }
      },
      {
        path: 'mpopaymentdetails/mpopaymentdetails',
        component: MpopaymentdetailsComponent,
        data: {
          title: 'Materialize PO Payment Details'
        }
      },
    
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AssetRequestRoutingModule { }


