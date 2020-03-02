import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageassetsComponent } from './manageassets.component';

describe('ManageassetsComponent', () => {
  let component: ManageassetsComponent;
  let fixture: ComponentFixture<ManageassetsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ManageassetsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ManageassetsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
