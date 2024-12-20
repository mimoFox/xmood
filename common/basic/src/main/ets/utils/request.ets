import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios';
import { UserSettingClass } from '../../../../Index';
import { BASE_URL } from '../constants';
import { promptAction, router } from '@kit.ArkUI';


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
  // token过期了
  if (error.response?.status === 401) {
    promptAction.showToast({
      message: '登录超时了~'
    })
    // 删除旧token
    const setting = new UserSettingClass(getContext())
    setting.deleteUserToken()
    // 也可以用下面的方法删除，将token设置为空
    //setting.setUserToken('')


    // 重新跳转登录页面
    router.replaceUrl({ url: 'pages/login/Login' })
  }
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