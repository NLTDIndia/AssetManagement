import { Component, OnInit } from '@angular/core';
import { AssetTypeSpecification } from '../shared/assettypespecification.model'; 
import { AssetTypeSpecificationService } from '../shared/assettypespecification.service';
import { ActivatedRoute, Router, Params } from '@angular/router';
@Component({
  selector: 'app-assettypespecification-list',
  templateUrl: './assettypespecification-list.component.html',
  styleUrls: ['./assettypespecification-list.component.scss']
})

export class AssettypespecificationListComponent implements OnInit {
public currentUser:any;
  constructor(public assetTypeSpecificationService: AssetTypeSpecificationService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router,) { }

  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    this.assetTypeSpecificationService.getAssetTypeSpecificationList();
  }

  
  showForEdit(at: AssetTypeSpecification){
    this._router.navigate(['/admin/assettypespecification/assettypespecification']);
    this.assetTypeSpecificationService.selectedAssetTypeSpecification = Object.assign({},at);
  }

  onDelete(id:number){
    if(confirm('Are you sure to delete this record ?') == true)
    this.assetTypeSpecificationService.deleteAssetTypeSpecification(id,this.currentUser.UserId)
    .subscribe(x=>{
      this.assetTypeSpecificationService.getAssetTypeSpecificationList();     
    })
  }

  p: number = 1;

}
