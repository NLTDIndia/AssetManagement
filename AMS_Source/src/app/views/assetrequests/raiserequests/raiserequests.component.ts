import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-raiserequests',
  templateUrl: './raiserequests.component.html',
  styleUrls: ['./raiserequests.component.scss']
})
export class RaiserequestsComponent implements OnInit {
  public currentUser: any;
  constructor() {  
  }

  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
  }

}
