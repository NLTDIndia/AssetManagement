import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TrackrequestsComponent } from './trackrequests.component';

describe('TrackrequestsComponent', () => {
  let component: TrackrequestsComponent;
  let fixture: ComponentFixture<TrackrequestsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TrackrequestsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TrackrequestsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
