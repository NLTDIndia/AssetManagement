import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AssetallocationComponent } from './assetallocation/assetallocation.component';
import { AllocatedassetsComponent } from './allocatedassets/allocatedassets.component';
import { ManageassetsComponent } from './manageassets/manageassets.component';
import{ManageassetListComponent} from './manageassets/manageasset-list/manageasset-list.component';
import{CreateassetComponent} from './createasset/createasset.component'
const routes: Routes = [
    {
      path: '',
      data: {
        title: 'Assets'
      },
      children: [
        {
          path: 'createasset/createasset',
          component: CreateassetComponent,
          data: {
            title: 'Create New Asset'
          }
        },  
        {
          path: 'manageassets/manageassets',
          component: ManageassetsComponent,
          data: {
            title: 'Manage Assets'
          }
        },  
        {
          path: 'manageassets/manageasset-list/manageasset-list',
          component: ManageassetListComponent,
          data: {
            title: 'Manage Assets'
          }
        },  
        {
          path: 'allocatedassets/allocatedassets',
          component: AllocatedassetsComponent,
          data: {
            title: 'Revoke Assets'
          }
        },     
        {
          path: 'assetallocation/assetallocation',
          component: AssetallocationComponent,
          data: {
            title: 'Allocate Assets'
          }
        }
      ]
      
    }
  ];
  
  @NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
  })
  export class AssetsRoutingModule {}

