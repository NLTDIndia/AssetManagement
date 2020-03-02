import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PendingassetsComponent } from './pendingassets.component';

describe('PendingassetsComponent', () => {
  let component: PendingassetsComponent;
  let fixture: ComponentFixture<PendingassetsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PendingassetsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PendingassetsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
