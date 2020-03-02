import { Component, OnInit } from '@angular/core';
import {TrackRequestService} from '../shared/trackrequest.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
@Component({
  selector: 'app-trackrequest',
  templateUrl: './trackrequest.component.html',
  styleUrls: ['./trackrequest.component.scss']
})
export class TrackrequestComponent implements OnInit {
 
  public currentUser: any;
  _poNumber: string;
  _arNumber:string;
  requestedNumber:string;
  show_Cheque: boolean = false;
  show_Credit_Card: boolean = false;
  constructor(public trackRequestService:TrackRequestService,
    public _activatedRoute: ActivatedRoute,
    public _router: Router,   
   private toastr: ToastrService) { }
    

  ngOnInit() {  
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));   
    this.trackRequestService.GetAssetHistory(this.selectedLink,this.requestedNumber);
  }
  private selectedLink: string="ARNumber"; 
  setradio(e: string, requestNumber): void   
  {  
    this.selectedLink = e;  
    requestNumber.value = '';
  }  
  
    isSelected(name: string): boolean   
  { 
  
        if (!this.selectedLink) { // if no radio button is selected, always return false so every nothing is shown  
            return false;  
  }  
  
        return (this.selectedLink === name); // if current radio button is selected, return true, else return false  
    }  
  toggleARNumber(){

  }

  togglePONumber(){

  }

 
  search(requestedNumber) { 
    if(requestedNumber.value != ''){
      this.trackRequestService.GetAssetHistory(this.selectedLink, requestedNumber.value);
    } 
    if(requestedNumber.value == ''){
      this.toastr.warning('Please enter the number.');
    }
    // if(requestedNumber!=requestedNumber.value){
    //   this.toastr.warning('No results found.');
    // }
    
  }
  p: number = 1;
}
