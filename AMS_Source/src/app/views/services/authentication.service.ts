import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { AppGlobals } from '../../app.global';

@Injectable()
export class AuthenticationService {

  constructor(private http: HttpClient, private _global: AppGlobals) { }

  login(userId: string, password: string) {
    var body = { userId, password };
    return this.http.post<any>(this._global.baseAppUrl +`/users/Authentication`, body)
        .pipe(map(user => {
            if (user) {
                // store user details in local storage to keep user logged in between page refreshes
                localStorage.setItem('currentUser', JSON.stringify(user));
            }

            return user;
        }));
}

logout() {
    // remove user from local storage to log user out
    localStorage.removeItem('currentUser');
}
}
