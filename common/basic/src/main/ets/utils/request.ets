import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios';
import { UserSettingClass } from '../../../../Index';
import { BASE_URL } from '../constants';


export const service = axios.create({
  baseURL: BASE_URL,
  timeout: 10000
})

// Add a request interceptor.
service.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  // Do something about the request data.
  // 设置请求头携带token信息
  const setting = new UserSettingClass(getContext())
  const token = setting.getUserToken()
  if (token) {
    config.headers.Authorization = token
  }
  return config;
}, (error: AxiosError) => {
  // Do something with the request error.
  return Promise.reject(error);
});


// Add a response interceptor.
service.interceptors.response.use((response: AxiosResponse) => {
  // Do something about the response data.
  if (response.status === 200 && response.data.code === 200) {
    return response.data.data
  }

}, (error: AxiosError) => {
  // Do something with the response error.
  return Promise.reject(error);
});

export class Http {
  static get<T>(url: string, params?: object) {
    return service.get<null, T>(url, { params })
  }

  static post<T>(url: string, data?: object) {
    return service.post<null, T>(url, data)
  }

  static put<T>(url: string, data?: object) {
    return service.put<null, T>(url, data)
  }

  static delete<T>(url: string, data?: object) {
    return service.delete<null, T>(url, data)
  }
}