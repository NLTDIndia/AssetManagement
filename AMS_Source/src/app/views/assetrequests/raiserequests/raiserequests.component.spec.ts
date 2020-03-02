import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RaiserequestsComponent } from './raiserequests.component';

describe('RaiserequestsComponent', () => {
  let component: RaiserequestsComponent;
  let fixture: ComponentFixture<RaiserequestsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RaiserequestsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RaiserequestsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
