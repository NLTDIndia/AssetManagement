import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetallocationsComponent } from './assetallocations.component';

describe('AssetallocationsComponent', () => {
  let component: AssetallocationsComponent;
  let fixture: ComponentFixture<AssetallocationsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssetallocationsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssetallocationsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
