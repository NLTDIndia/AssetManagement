import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ApprovequotationListComponent } from './approvequotation-list.component';

describe('ApprovequotationListComponent', () => {
  let component: ApprovequotationListComponent;
  let fixture: ComponentFixture<ApprovequotationListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ApprovequotationListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ApprovequotationListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
