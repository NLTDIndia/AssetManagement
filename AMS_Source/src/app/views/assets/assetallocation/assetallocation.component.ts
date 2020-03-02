import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-assetallocation',
  templateUrl: './assetallocation.component.html',
  styleUrls: ['./assetallocation.component.scss']
})
export class AssetallocationComponent implements OnInit {
  public currentUser: any;
  constructor() {
  }

  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
  }
}