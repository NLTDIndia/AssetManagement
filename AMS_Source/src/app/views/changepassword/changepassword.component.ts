import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { NgForm } from '@angular/forms';
import { ChangePasswordService } from '../services/changepassword.service'
import { ToastrService } from 'ngx-toastr';


@Component({
  selector: 'app-changepassword',
  templateUrl: './changepassword.component.html',
  styleUrls: ['./changepassword.component.scss']
})
export class ChangepasswordComponent implements OnInit {
  model: any = {};
  public currentUser: any;
  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private toastr: ToastrService,
    private changePasswordService: ChangePasswordService) { }

  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
  }
  keyvalidation(event) {
    if (event.which === 32) {
      return false;
    }
    return true;
  }
  OnSubmit(form: NgForm) {
    let password = form.value.OldPassword, newPassword = form.value.NewPassword;
    var userId = this.currentUser.UserId;
    if (form.value.NewPassword == form.value.ConfirmPassword) {
      var userPasswordDetail = { userId, password, newPassword };
      this.changePasswordService.UpdatePassword(userPasswordDetail)
        .subscribe(
          data => {
            if (data === 'fail') {
              this.toastr.warning('Old password is incorrect');
            }
            else {
              this.resetForm(form);
              this.toastr.success('Password has been updated successfully');
            }
          },
          error => {
            console.log(error);
          });
    }
    else {
      this.toastr.warning('New and confirm password should be same');
    }
  }

  resetForm(form?: NgForm) {
    if (form != null)
      form.reset();
  }

}
