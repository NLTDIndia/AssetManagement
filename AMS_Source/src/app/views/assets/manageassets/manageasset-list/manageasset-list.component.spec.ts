import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageassetListComponent } from './manageasset-list.component';

describe('ManageassetListComponent', () => {
  let component: ManageassetListComponent;
  let fixture: ComponentFixture<ManageassetListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ManageassetListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ManageassetListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
