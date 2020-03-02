import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgForm } from '@angular/forms';
import {AuthenticationService} from '../services/authentication.service'
import { ToastrService  } from 'ngx-toastr';

@Component({
  selector: 'app-dashboard',
  moduleId: module.id,
  templateUrl: 'login.component.html',
  styleUrls: ['login.component.scss'],
})

export class LoginComponent implements OnInit {
  model: any = {};
  loading = false;
  returnUrl: string;

  constructor(
      private route: ActivatedRoute,
      private router: Router,
      private toastr: ToastrService,
      private authenticationService: AuthenticationService) { }

  ngOnInit() {
      // reset login status
      this.authenticationService.logout();
      // get return url from route parameters or default to '/'
      this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
  }

  login() {
      this.loading = true;
      this.authenticationService.login(this.model.username, this.model.password)
          .subscribe(
              data => {
                if(data==null){
                  this.toastr.warning('Please enter valid user name and password');
                  this.loading = false;
                }
                else{
                   this.router.navigate([this.returnUrl]);
                }
                 
              },
              error => {
                  this.loading = false;
              });
  }
}
