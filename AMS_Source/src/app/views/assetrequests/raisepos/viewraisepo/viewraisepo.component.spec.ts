import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewraisepoComponent } from './viewraisepo.component';

describe('ViewraisepoComponent', () => {
  let component: ViewraisepoComponent;
  let fixture: ComponentFixture<ViewraisepoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViewraisepoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewraisepoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
