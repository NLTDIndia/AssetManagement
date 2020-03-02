import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ApprovequotationsComponent } from './approvequotations.component';

describe('ApprovequotationsComponent', () => {
  let component: ApprovequotationsComponent;
  let fixture: ComponentFixture<ApprovequotationsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ApprovequotationsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ApprovequotationsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
