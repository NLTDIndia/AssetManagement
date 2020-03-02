import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssettypespecificationListComponent } from './assettypespecification-list.component';

describe('AssettypespecificationListComponent', () => {
  let component: AssettypespecificationListComponent;
  let fixture: ComponentFixture<AssettypespecificationListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssettypespecificationListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssettypespecificationListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
