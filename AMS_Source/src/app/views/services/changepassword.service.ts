import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute, Router, Params } from '@angular/router';
import { map } from 'rxjs/operators';
import { AppGlobals } from '../../app.global';

@Injectable()
export class ChangePasswordService {
    
  constructor(private http: HttpClient, private _global: AppGlobals, public _router: Router) { }

  UpdatePassword(changedPasswordDetail : any) {
    var body = changedPasswordDetail;
        return this.http.put<any>(this._global.baseAppUrl +`/users/ChangePassword`, body)
            .pipe(map(data => {
                return data;
        }));
    }
}