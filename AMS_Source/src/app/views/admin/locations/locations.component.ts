import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-locations',
  templateUrl: './locations.component.html',
  styleUrls: ['./locations.component.scss']
})
export class LocationsComponent implements OnInit {
  public currentUser: any;
  constructor() {   
  }

  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
  }

}
