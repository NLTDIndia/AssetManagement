import { Component, OnInit, QueryList, TemplateRef } from '@angular/core';
import { NgForm } from '@angular/forms';
import { NullAstVisitor } from '@angular/compiler';

import { AssetTypeSpecificationService } from '../shared/assettypespecification.service';
import { AssetTypeService } from '../../assettypes/shared/assettype.service';

import { BsModalService } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';


import { AccordionTemplate, AccordionData } from 'ngx-accordion-table';


@Component({
  selector: 'app-assettypespecification',
  templateUrl: './assettypespecification.component.html',
  styleUrls: ['./assettypespecification.component.scss']
})
export class AssettypespecificationComponent implements OnInit {

  modalRef: BsModalRef;
  public currentUser: any;
  AssetTypeSpecification: any;
  constructor(public assetTypeSpecificationService: AssetTypeSpecificationService, public modalService: BsModalService) {
}

  openModal(template: TemplateRef<any>) {
    this.modalRef = this.modalService.show(template);
  }

  ngOnInit() {
    this.resetForm();
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    this.assetTypeSpecificationService.selectedAssetTypeSpecification=this.currentUser.UserId;   
  }
  onSubmit(form: NgForm) {
    console.log(this.AssetTypeSpecification, form);
    if (form.value.Id == null) {
    }
    else {

    }
  }
  resetForm(form?: NgForm) {
    if (form != null)
      form.reset;
    this.assetTypeSpecificationService.selectedAssetTypeSpecification = {
      Id: null,
      Name: '',
      AssetTypeId: '',
      AssetTypeName: '',
      IsActive: false,
      ValueType: '',
      CreatedBy:'',
      LastModifiedBy:''
    }
  }
  GetAssetSpecificaion() {
    this.AssetTypeSpecification = [];
    let list = [{
      ID: '1',
      Name: 'AssetTypeSpecification',
      ValueType: 'single',
      Value: ''
    },
    {
      ID: '2',
      Name: 'Ram',
      ValueType: 'multiline',
      Value: ''
    },
    {
      ID: '3',
      Name: 'Hardisk',
      ValueType: 'single',
      Value: ''
    },
    {
      ID: '4',
      Name: 'Note',
      ValueType: 'multiline',
      Value: ''
    }];
    this.AssetTypeSpecification = list;
  }

}
