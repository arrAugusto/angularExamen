import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})
export class TiporangofechaService {
  _url = '/payaraWSRBanguat/resources/generic'
  constructor
  (private http:HttpClient
  ) {   }

   getTipoRangoJava(fechaInicio:string, fechaFinal:string):Promise<any>{
     let header = new HttpHeaders()
     .set('Type-content', 'aplication/json')
     .set('Type-content', 'aplication/json')
     .set('Type-content', 'aplication/json')
      return this.http.get(this._url+"?fechaInicio="+fechaInicio+"&fechaFinal="+fechaFinal).toPromise();
    }
}