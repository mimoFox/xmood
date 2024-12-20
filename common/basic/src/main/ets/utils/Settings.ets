import { preferences } from '@kit.ArkData'
import { TOKEN_KEY, XMD_SETTING, XMD_SETTING_AD } from '../constants'
import { AdvertClass } from '../models'


// 广告的默认配置(后台返回的广告配置)
export const defaultAd: AdvertClass = {
  // 广告时长
  adTime: 2,
  // 显示广告
  showAd: true,
  //  广告图片
  adImage: $r("app.media.start")
}

export class UserSettingClass {
  context: Context

  constructor(context: Context) {
    this.context = context
  }

  // 创建仓库
  getStore() {
    return preferences.getPreferencesSync(this.context, {
      name: XMD_SETTING
    })
  }

  // 存储数据
  setUserAd(ad: AdvertClass) {
    // 获取仓库
    const store = this.getStore()

    // 存储数据
    store.putSync(XMD_SETTING_AD, JSON.stringify(ad)) // 别忘记转换为字符串JSON.stringify(ad)

    // 写入数据
    store.flush()
  }

  // 获取数据
  getUserAd(): AdvertClass {
    // 获取仓库
    const store = this.getStore()

    // 如果获取数据失败则用默认值
    return JSON.parse(store.getSync(XMD_SETTING_AD, JSON.stringify(defaultAd)) as string)
  }


  async getAdConfig() {
    return await new Promise<AdvertClass>((resolve) => {
      setTimeout(() => {
        resolve(defaultAd)
      }, 500)
    })
  }

  setUserToken(token: string) {
    // 获取仓库
    const store = this.getStore()
    store.putSync(TOKEN_KEY, token)
    store.flush()
  }

  getUserToken() {
    // 获取仓库
    const store = this.getStore()

    // 如果没有token，则设置为空
    return store.getSync(TOKEN_KEY, '') as string
  }

  deleteUserToken() {
    // 获取仓库
    const store = this.getStore()

    // 删除token
    store.deleteSync(TOKEN_KEY)

    // 写入磁盘
    store.flush()
  }
}