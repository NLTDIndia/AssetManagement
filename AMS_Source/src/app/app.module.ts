import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule, Routes } from '@angular/router';
import { HttpModule } from '@angular/http';

import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { LocationStrategy, HashLocationStrategy } from '@angular/common';
import { ModalModule} from 'ngx-bootstrap';
import { NgxAccordionTableModule  } from 'ngx-accordion-table';

import { PerfectScrollbarModule } from 'ngx-perfect-scrollbar';
import { PERFECT_SCROLLBAR_CONFIG } from 'ngx-perfect-scrollbar';
import { AuthenticationService } from './views/services/authentication.service';
import { DefaultLayoutService } from './views/services/defaultlayout.service';
import { ChangePasswordService } from './views/services/changepassword.service';
import { AuthGuard } from './views/guards/auth.guard';


import { AppComponent } from './app.component';

// Import containers
import { DefaultLayoutComponent } from './containers';

import { P404Component } from './views/error/404.component';
import { P500Component } from './views/error/500.component';
import { LoginComponent } from './views/login/login.component';
import { RegisterComponent } from './views/register/register.component';
import { ToastrModule } from 'ngx-toastr';
import { CommonModule } from '@angular/common';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppGlobals } from './app.global';


const APP_CONTAINERS = [
  DefaultLayoutComponent
];

import {
  AppAsideModule,
  AppBreadcrumbModule,
  AppHeaderModule,
  AppFooterModule,
  AppSidebarModule,
} from '@coreui/angular'

// Import routing module
import { AppRoutingModule } from './app.routing';

// Import 3rd party components
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { TabsModule} from 'ngx-bootstrap/tabs';
import { ChartsModule } from 'ng2-charts/ng2-charts';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { ChangepasswordComponent } from './views/changepassword/changepassword.component';
// import { UnallocatedassetsComponent } from './views/report/unallocatedassets/unallocatedassets.component';
// import { PendingassetsComponent } from './views/report/pendingassets/pendingassets.component';
import { NgxWigModule } from 'ngx-wig';

@NgModule({
  imports: [
    BrowserModule,
    AppRoutingModule,
    AppAsideModule,
    AppBreadcrumbModule.forRoot(),
    AppFooterModule,
    AppHeaderModule,
    AppSidebarModule,
    PerfectScrollbarModule,
    BsDropdownModule.forRoot(),
    TabsModule.forRoot(),
    ChartsModule,
    HttpClientModule,
    RouterModule,
    ModalModule.forRoot(),
    NgxAccordionTableModule,
    TabsModule.forRoot(),
    CommonModule,
    BrowserAnimationsModule, // required animations module
    ToastrModule.forRoot(), // ToastrModule added
    NgbModule.forRoot(),
    FormsModule,
    NgxWigModule,
    HttpModule,
      ],
  declarations: [
    AppComponent,
    ...APP_CONTAINERS,
    P404Component,
    P500Component,
    LoginComponent,
    RegisterComponent,
    ChangepasswordComponent,
    // UnallocatedassetsComponent,
    // PendingassetsComponent,
   
  ],
  providers: [{
    provide: LocationStrategy,
    useClass: HashLocationStrategy,
    
  },
  AuthenticationService,
  AuthGuard,
  AppGlobals,
  DefaultLayoutService,
  ChangePasswordService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
