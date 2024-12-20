export interface AccountFormModel {
  /**
   * 登录账号
   */
  account: string;

  /**
   * 登录密码
   */
  password: string;
}

export interface UserInfoModel {
  /**
   * 头像
   */
  avatar: ResourceStr;

  /**
   * 姓名
   */
  name: string;

  /**
   * 司机编号
   */
  number: string;

  /**
   * 手机号
   */
  phone: string;

}