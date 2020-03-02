import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { HttpModule } from '@angular/http';
import { RouterModule, Routes } from '@angular/router';
import { AssetCategoryService } from './asset-categories/shared/asset.service';
import { LocationService } from './locations/shared/location.service';
import { AssetTypeService } from './assettypes/shared/assettype.service';
import { AssetTypeSpecificationService } from './assettypespecifications/shared/assettypespecification.service';
import { VendorService } from './vendors/shared/vendors.service'

import { AdminRoutingModule } from './admin-routing.module';
import { NgxPaginationModule } from 'ngx-pagination';
import { TooltipModule, TabsModule } from 'ngx-bootstrap';

import { AssetCategoriesComponent } from './asset-categories/asset-categories.component';
import { AssetcategoryComponent } from './asset-categories/assetcategory/assetcategory.component';
import { AssetcategoryListComponent } from './asset-categories/assetcategory-list/assetcategory-list.component';
import { LocationsComponent } from './locations/locations.component';
import { LocationComponent } from './locations/location/location.component';
import { LocationListComponent } from './locations/location-list/location-list.component';
import { AssettypesComponent } from './assettypes/assettypes.component';
import { AssettypeComponent } from './assettypes/assettype/assettype.component';
import { AssettypeListComponent } from './assettypes/assettype-list/assettype-list.component';
import { AssettypespecificationsComponent } from './assettypespecifications/assettypespecifications.component';
import { AssettypespecificationComponent } from './assettypespecifications/assettypespecification/assettypespecification.component';
import { AssettypespecificationListComponent } from './assettypespecifications/assettypespecification-list/assettypespecification-list.component';

import { AppGlobals } from '../../app.global';
import { VendorsComponent } from './vendors/vendors.component';
import { VendorComponent } from './vendors/vendor/vendor.component';
import { VendorListComponent } from './vendors/vendor-list/vendor-list.component';


@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    AdminRoutingModule,
    HttpModule,
    RouterModule,
    NgxPaginationModule,
    TooltipModule.forRoot(),
    TabsModule.forRoot()
  ],
  declarations: [AssetCategoriesComponent, AssetcategoryComponent, AssetcategoryListComponent,
    LocationsComponent,
    LocationComponent,
    LocationListComponent,
    AssettypesComponent,
    AssettypeComponent,
    AssettypeListComponent,
    AssettypespecificationsComponent,
    AssettypespecificationComponent,
    AssettypespecificationListComponent,
    VendorsComponent,
    VendorComponent,
    VendorListComponent,
    
  ],
  providers: [AssetCategoryService,
    LocationService,
    AssetTypeService,
    AssetTypeSpecificationService,
    VendorService,
    AppGlobals
    ]

})

export class AdminModule { }

