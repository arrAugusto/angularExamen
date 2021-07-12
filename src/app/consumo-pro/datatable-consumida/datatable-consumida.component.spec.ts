import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DatatableConsumidaComponent } from './datatable-consumida.component';

describe('DatatableConsumidaComponent', () => {
  let component: DatatableConsumidaComponent;
  let fixture: ComponentFixture<DatatableConsumidaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DatatableConsumidaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DatatableConsumidaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
