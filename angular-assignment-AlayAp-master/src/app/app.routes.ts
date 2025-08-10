import { Routes } from '@angular/router';
import { Home } from './home/home';
import { ApiData } from './api-data/api-data';
import { FormPage } from './form-page/form-page';

export const routes: Routes = [
  { path: '', component: Home },
  { path: 'home', component: Home },
  { path: 'api-data', component: ApiData },
  { path: 'form', component: FormPage },
  { path: '**', redirectTo: '' }
];
