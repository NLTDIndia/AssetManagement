import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod, HttpModule } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';

import { AssetTypeSpecification } from './assettypespecification.model';
import { AssetType } from '../../assettypes/shared/assettype.model';


@Injectable()
export class AssetTypeSpecificationService{
    
    selectedAssetType : AssetType;
    assetTypeList : AssetType[];
    selectedAssetTypeSpecification: AssetTypeSpecification;
    assetTypeSpecificationList : AssetTypeSpecification[];

    constructor(private http : Http) { 
        
        http.get('http://localhost:57006/api/AssetType').map((data : Response) => {
            return data.json() as AssetType[];}).toPromise().then(x=>{this.assetTypeList = x;})
    }

    postAssetTypeSpecification(at: AssetType, CreatedBy){
        var body = JSON.stringify(at,CreatedBy);
        var headerOptions = new Headers({'Content-Type':'application/json'});
        var requestOptions = new RequestOptions({method : RequestMethod.Post,headers : headerOptions});
        return this.http.post('http://localhost:57006/api/AssetTypeSpecification',body, requestOptions).map(x => x.json());
    }

    getAssetTypeSpecificationList(){
        this.http.get('http://localhost:57006/api/AssetTypeSpecification')
            .map((data : Response) => {
            return data.json() as AssetTypeSpecification[];}).toPromise().then(x=>{this.assetTypeSpecificationList = x;})
    }

    putAssetTypeSpecification(id, emp, loginId){
        var LastModifiedBy=loginId;
        var body = JSON.stringify(emp);
        var headerOptions = new Headers({'Content-Type':'application/json'});
        var requestOptions = new RequestOptions({method : RequestMethod.Put,headers : headerOptions});
        return this.http.put('http://localhost:57006/api/AssetTypeSpecification/' + id  + 'LastModifiedBy='+LastModifiedBy,body,requestOptions).map(x=>x.json());
    }

    deleteAssetTypeSpecification(id,loginId){
        var LastModifiedBy=loginId;
        return this.http.delete('http://localhost:57006/api/AssetTypeSpecification/' + id + 'LastModifiedBy='+LastModifiedBy).map(res=>res.json());
    }

}
