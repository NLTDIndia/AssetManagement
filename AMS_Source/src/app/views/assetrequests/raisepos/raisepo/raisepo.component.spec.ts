import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RaisepoComponent } from './raisepo.component';

describe('RaisepoComponent', () => {
  let component: RaisepoComponent;
  let fixture: ComponentFixture<RaisepoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RaisepoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RaisepoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
