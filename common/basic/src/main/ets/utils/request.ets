import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios';
import { BASE_URL } from '../constants';


export const service = axios.create({
  baseURL: BASE_URL,
  timeout: 10000
})

// Add a request interceptor.
service.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  // Do something about the request data.
  return config;
}, (error: AxiosError) => {
  // Do something with the request error.
  return Promise.reject(error);
});


// Add a response interceptor.
service.interceptors.response.use((response: AxiosResponse) => {
  // Do something about the response data.
  return response;
}, (error: AxiosError) => {
  // Do something with the response error.
  return Promise.reject(error);
});

export class Http {
  get<T>(url: string, params?: object) {
    return service.get<null, T>(url, { params })
  }

  post<T>(url: string, data?: object) {
    return service.post<null, T>(url, data)
  }

  put<T>(url: string, data?: object) {
    return service.put<null, T>(url, data)
  }

  delete<T>(url: string, data?: object) {
    return service.delete<null, T>(url, data)
  }
}