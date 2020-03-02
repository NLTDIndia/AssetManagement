import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { RouterModule, Routes } from '@angular/router';
import { NgxPaginationModule } from 'ngx-pagination';
import { AllocatedassetsComponent } from './allocatedassets/allocatedassets.component';
import { AllocatedassetsListComponent } from './allocatedassets/allocatedassets-list/allocatedassets-list.component';
import { AllocatedAssetsService } from './allocatedassets/shared/allocatedassetslist.service';
import { AssetsRoutingModule } from './assets-routing.module';
import {AssetAllocationService} from './assetallocation/shared/assetallocationlist.service';
import { AssetallocationComponent } from './assetallocation/assetallocation.component';
import { AssetallocationsComponent } from './assetallocation/assetallocations/assetallocations.component';
import { AppGlobals } from '../../app.global';
import {NgbModule,NgbActiveModal} from '@ng-bootstrap/ng-bootstrap';
import { ManageassetsComponent } from './manageassets/manageassets.component';
import { ManageassetComponent } from './manageassets/manageasset/manageasset.component';
import { ManageAssetsService } from './manageassets/shared/manageassets.service';
import { ManageassetListComponent } from './manageassets/manageasset-list/manageasset-list.component';
import { BsDatepickerModule } from 'ngx-bootstrap';
import { CreateassetComponent } from './createasset/createasset.component';
import{CreateAssetService} from './createasset/shared/createasset.service';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        HttpModule,
        RouterModule,
        NgxPaginationModule,
        AssetsRoutingModule,
        NgbModule.forRoot(),  
        BsDatepickerModule.forRoot(),
      
    ],
    declarations: [AllocatedassetsComponent, AllocatedassetsListComponent, AssetallocationComponent, AssetallocationsComponent, ManageassetsComponent, ManageassetComponent, ManageassetListComponent, CreateassetComponent],
    providers: [ AllocatedAssetsService, AssetAllocationService, AppGlobals,NgbActiveModal, ManageAssetsService, CreateAssetService ]
})

export class AssetsModule { }