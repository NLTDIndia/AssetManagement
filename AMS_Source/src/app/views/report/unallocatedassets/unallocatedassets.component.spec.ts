import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UnallocatedassetsComponent } from './unallocatedassets.component';

describe('UnallocatedassetsComponent', () => {
  let component: UnallocatedassetsComponent;
  let fixture: ComponentFixture<UnallocatedassetsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UnallocatedassetsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UnallocatedassetsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
