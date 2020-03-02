import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MaterializepoComponent } from './materializepo.component';

describe('MaterializepoComponent', () => {
  let component: MaterializepoComponent;
  let fixture: ComponentFixture<MaterializepoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MaterializepoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MaterializepoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
