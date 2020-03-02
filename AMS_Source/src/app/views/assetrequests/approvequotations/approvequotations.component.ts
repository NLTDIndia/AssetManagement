import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-approvequotations',
  templateUrl: './approvequotations.component.html',
  styleUrls: ['./approvequotations.component.scss']
})
export class ApprovequotationsComponent implements OnInit {
  public currentUser: any;
  constructor() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
  }

  ngOnInit() {
  }

}
