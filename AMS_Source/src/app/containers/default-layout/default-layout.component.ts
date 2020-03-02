import { Component, OnInit, Input } from '@angular/core';
import { navItems } from '../../_nav';
import { ActivatedRoute, Router, Params } from '@angular/router';
import { DefaultLayoutService } from '../../views/services/defaultlayout.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './default-layout.component.html',
  styleUrls: ['./default-layout.component.scss']
})
export class DefaultLayoutComponent implements OnInit {
  public navItems;
  public sidebarMinimized = true;
  private changes: MutationObserver;
  public element: HTMLElement = document.body;
  public currentUser: any;
  public firstName: string;
  public lastName: string;

  constructor(public _activatedRoute: ActivatedRoute, public _router: Router
    , public defaultLayoutService:DefaultLayoutService) {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    this.changes = new MutationObserver((mutations) => {
      this.sidebarMinimized = document.body.classList.contains('sidebar-minimized')
    });

    this.changes.observe(<Element>this.element, {
      attributes: true
    });
    if(this.currentUser){
      this.navItems = JSON.parse(this.currentUser.MenuList);
      // this.navItems = navItems;
    }
    else{
      this.navItems = navItems;
    }
   
  }
  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser')) ;
    if(this.currentUser!==null){
      this.firstName = this.currentUser.FirstName;
      this.lastName = this.currentUser.LastName;
    }
    else{
      this.logout();
    }
  }

  logout() {
    this._router.navigate(['/login']);
  }

  onActivate(){
    var url = this._router.url;
    url = url.split('?')[0];
    this.defaultLayoutService.GetAuthorizedRole(this.currentUser.Role, url)
    .subscribe(
        data => {
          if(!data){
            this._router.navigate([localStorage.getItem('currentUrl')]);
          }
          else{
            localStorage.setItem('currentUrl', this._router.url);
          }
        },
        error => {
          //this._router.navigate(['/login']);
          localStorage.setItem('currentUrl', this._router.url);
        });
  }
}
