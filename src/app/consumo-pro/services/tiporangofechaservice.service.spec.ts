import { TestBed } from '@angular/core/testing';

import { TiporangofechaserviceService } from './tiporangofechaservice.service';

describe('TiporangofechaserviceService', () => {
  let service: TiporangofechaserviceService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TiporangofechaserviceService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
