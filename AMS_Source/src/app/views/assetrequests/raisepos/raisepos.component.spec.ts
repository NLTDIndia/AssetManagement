import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RaiseposComponent } from './raisepos.component';

describe('RaiseposComponent', () => {
  let component: RaiseposComponent;
  let fixture: ComponentFixture<RaiseposComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RaiseposComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RaiseposComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
