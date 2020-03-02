import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-allocatedassets',
  templateUrl: './allocatedassets.component.html',
  styleUrls: ['./allocatedassets.component.scss']
})
export class AllocatedassetsComponent implements OnInit {
  public currentUser: any;
  constructor() {  
  }

  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
  }

}
