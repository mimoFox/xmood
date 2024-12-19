import { Http } from 'basic';
import { AccountFormModel } from '../models/Users';

/**
 * 登录接口
 * */
export const LoginApi = (data: AccountFormModel): Promise<string> => {
  return Http.post<string>('/driver/login/account', data)
}