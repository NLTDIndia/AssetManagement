import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';


@Component({
  selector: 'app-materializepos',
  templateUrl: './materializepos.component.html',
  styleUrls: ['./materializepos.component.scss']
})
export class MaterializeposComponent implements OnInit {
  public currentUser: any;

  constructor() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
  }
  ngOnInit() {
  }
}