import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PendingassetsComponent } from './pendingassets/pendingassets.component';
import { UnallocatedassetsComponent } from './unallocatedassets/unallocatedassets.component';

const routes: Routes = [
    {
      path: '',
      data: {
        title: 'Report'
      },
      children: [
        {
          path: 'pendingassets',
          component: PendingassetsComponent,
          data: {
            title: 'Pending Assets Detail'
          }
        },  
        {
          path: 'unallocatedassets',
          component: UnallocatedassetsComponent,
          data: {
            title: 'Unallocated Assets'
          }
        }
      ]
    }
  ];
  
  @NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
  })
  export class ReportRoutingModule {}

