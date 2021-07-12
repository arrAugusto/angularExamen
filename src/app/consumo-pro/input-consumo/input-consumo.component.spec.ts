import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InputConsumoComponent } from './input-consumo.component';

describe('InputConsumoComponent', () => {
  let component: InputConsumoComponent;
  let fixture: ComponentFixture<InputConsumoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InputConsumoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InputConsumoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
