import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MpopaymentdetailsComponent } from './mpopaymentdetails.component';

describe('MpopaymentdetailsComponent', () => {
  let component: MpopaymentdetailsComponent;
  let fixture: ComponentFixture<MpopaymentdetailsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MpopaymentdetailsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MpopaymentdetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
