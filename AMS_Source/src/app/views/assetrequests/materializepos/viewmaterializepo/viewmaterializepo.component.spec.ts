import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewmaterializepoComponent } from './viewmaterializepo.component';

describe('ViewmaterializepoComponent', () => {
  let component: ViewmaterializepoComponent;
  let fixture: ComponentFixture<ViewmaterializepoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViewmaterializepoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewmaterializepoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
