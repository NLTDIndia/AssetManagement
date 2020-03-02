import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


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
import { VendorComponent } from './vendors/vendor/vendor.component';
import { VendorListComponent } from './vendors/vendor-list/vendor-list.component';
import { VendorsComponent } from './vendors/vendors.component';

const routes: Routes = [
    {
      path: '',
      data: {
        title: 'Admin'
      },
      children: [
        {
          path: 'locations/locations',
          component: LocationsComponent,
          data: {
            title: 'Location'
          }
        },
        {
          path: 'location/location',
          component: LocationComponent,
          data: {
            title: 'Location'
          }
        },
        {
          path: 'location-list/location-list',
          component: LocationListComponent,
          data: {
            title: 'Location'
          }
        },
        {
            path: 'asset-categories/asset-categories',
            component: AssetCategoriesComponent,
            data: {
              title: 'Asset Categories'
            }
          },
          {
            path: 'assetcategory/assetcategory',
            component: AssetcategoryComponent,
            data: {
              title: 'Asset Categories'
            }
          },
          {
            path: 'assetcategory-list/assetcategory-list',
            component: AssetcategoryListComponent,
            data: {
              title: 'Asset Categories'
            }
          },
          {
            path: 'assettypes/assettypes',
            component: AssettypesComponent,
            data: {
              title: 'Asset Type'
            }
          },
          {
            path: 'assettype/assettype',
            component: AssettypeComponent,
            data: {
              title: 'Asset Type'
            }
          },
          {
            path: 'assettype-list/assettype-list',
            component: AssettypeListComponent,
            data: {
              title: 'Asset Type'
            }
          },
          {
            path: 'vendors/vendors',
            component: VendorsComponent,
            data: {
              title: 'Vendors'
            }
          },
          {
            path: 'vendor/vendor',
            component: VendorComponent,
            data: {
              title: 'Vendors'
            }
          },
          {
            path: 'vendor-list/vendor-list',
            component: VendorListComponent,
            data: {
              title: 'Vendors'
            }
          },
          {
            path: 'assettypespecifications/assettypespecifications',
            component: AssettypespecificationsComponent,
            data: {
              title: 'Asset Type Specifications'
            }
          },
          {
            path: 'assettypespecification/assettypespecification',
            component: AssettypespecificationComponent,
            data: {
              title: 'Asset Type Specifications'
            }
          },
          {
            path: 'assettypespecification-list/assettypespecification-list',
            component: AssettypespecificationListComponent,
            data: {
              title: 'Asset Type Specifications'
            }
          },
      ]
    }
  ];
  
  @NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
  })
  export class AdminRoutingModule {}


