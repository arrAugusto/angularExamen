import { Component, OnInit } from '@angular/core';
import {FormGroup, FormControl} from '@angular/forms';
import { TiporangofechaService } from '../services/tiporangofechaservice.service';
import * as moment from 'moment';
import { convertActionBinding } from '@angular/compiler/src/compiler_util/expression_converter';
import { MatTable } from '@angular/material/table';
import { ViewChild } from '@angular/core';
import {MatPaginator} from '@angular/material/paginator';

export interface PeriodicElement {
  position: number;
  name: string;
  weight: number;
  symbol: number;
}

const ELEMENT_DATA: PeriodicElement[] = [
];


@Component({
  selector: 'app-input-consumo',
  templateUrl: './input-consumo.component.html',
  styleUrls: ['./input-consumo.component.css']
})
export class InputConsumoComponent implements OnInit {

  constructor(private tiporangofechaService: TiporangofechaService ) { 

  }

  @ViewChild(MatTable, { static: true })
  table!: MatTable<any>;
  displayedColumns: string[] = ['position', 'name', 'weight', 'symbol' ];
  dataSource = ELEMENT_DATA;
  clickedRows = new Set<PeriodicElement>();

  @ViewChild(MatPaginator)
  paginator!: MatPaginator;


  ngOnInit(): void {
    
  }
  public range = new FormGroup({
    start: new FormControl(),
    end: new FormControl()

  });
  async onSave(){

    var fechaInicio = moment(this.range.value.start).format('DD-MM-YYYY');
    var fechaFinal = moment(this.range.value.end).format('DD-MM-YYYY');
    var a:any[] = []
    const data = await this.tiporangofechaService.getTipoRangoJava(fechaInicio, fechaFinal).catch();
    a.push({"response":data});
    var conver = await this.converse(a[0]["response"]["response"]);
    var dataSo = [];
    //  {position: 1, name: 'Hydrogen', weight: 1.0079, symbol: 'H'},
     var contador=0;
    for (let i = 0; i<conver.length; i++){
      contador = contador+1;
      this.dataSource.push({"position":contador,  "name":conver[i]["fecha"], "weight":conver[i]["venta"], "symbol":conver[i]["venta"]});
    }
    this.table.renderRows();
  } 

  converse(response:string) {
    return JSON.parse(response);
  }

  
}


