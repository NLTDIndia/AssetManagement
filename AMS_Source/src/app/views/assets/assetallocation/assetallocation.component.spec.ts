import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetallocationComponent } from './assetallocation.component';

describe('AssetallocationComponent', () => {
  let component: AssetallocationComponent;
  let fixture: ComponentFixture<AssetallocationComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssetallocationComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssetallocationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
