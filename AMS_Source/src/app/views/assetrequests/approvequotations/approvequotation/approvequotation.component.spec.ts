import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ApprovequotationComponent } from './approvequotation.component';

describe('ApprovequotationComponent', () => {
  let component: ApprovequotationComponent;
  let fixture: ComponentFixture<ApprovequotationComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ApprovequotationComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ApprovequotationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
