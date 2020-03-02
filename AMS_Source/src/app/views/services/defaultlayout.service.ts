import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute, Router, Params } from '@angular/router';
import { map } from 'rxjs/operators';
import { AppGlobals } from '../../app.global';

@Injectable()
export class DefaultLayoutService {
    
  constructor(private http: HttpClient, private _global: AppGlobals, public _router: Router) { }

  GetAuthorizedRole(userRole, url) {
        return this.http.get<any>(this._global.baseAppUrl + '/users/RoleAuthorization?role=' + userRole + '&url=' + url)
            .pipe(map(user => {
                if(!user) {
                    return false;
                }
                return true;
        }));

    }
}