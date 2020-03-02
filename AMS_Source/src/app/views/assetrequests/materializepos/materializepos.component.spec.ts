import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MaterializeposComponent } from './materializepos.component';

describe('MaterializeposComponent', () => {
  let component: MaterializeposComponent;
  let fixture: ComponentFixture<MaterializeposComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MaterializeposComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MaterializeposComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
