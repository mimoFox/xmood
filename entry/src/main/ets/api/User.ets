import { Http } from 'basic';
import { AccountFormModel, UserInfoModel } from '../models/Users';

/**
 * 登录接口
 * */
export const LoginApi = (data: AccountFormModel): Promise<string> => {
  return Http.post<string>('/driver/login/account', data)
}

/*
* 获取用户信息
 */

export const getUserInfoApi = (): Promise<UserInfoModel> => {
  return Http.get<UserInfoModel>('/driver/users')
}