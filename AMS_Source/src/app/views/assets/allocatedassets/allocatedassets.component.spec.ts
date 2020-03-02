import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AllocatedassetsComponent } from './allocatedassets.component';

describe('AllocatedassetsComponent', () => {
  let component: AllocatedassetsComponent;
  let fixture: ComponentFixture<AllocatedassetsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AllocatedassetsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AllocatedassetsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
