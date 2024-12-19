import { LoginApi } from '../../api/User'
import { AccountFormModel } from '../../models/Users'
import { router } from '@kit.ArkUI'
import { UserSettingClass } from 'basic'

@Entry
@Component
struct Login {
  @State accountForm: AccountFormModel = {
    account: 'xbsj001',
    password: '123456'
  }
  @State showLoading: boolean = false

  @Styles
  textInputStyle(){
    .height(58)
    .borderRadius(0)
    .backgroundColor($r('app.color.white'))
    .border({
      width: {
        bottom: 1
      },
      color: $r('app.color.back_divider')
    })
  }

  // 用户名密码非空判断
  getFormValidate() {
    if (this.accountForm.account && this.accountForm.password) {
      return true
    }
    return false
  }

  // 登录请求
  async Login() {
    this.showLoading = true
    try {
      const res = await LoginApi(this.accountForm)
      console.log('resData' + JSON.stringify(res))

      const setting = new UserSettingClass(getContext())
      setting.setUserToken(res)

      if (res) {
        router.replaceUrl({ url: 'pages/Index' })
      }
    } catch (err) {
      console.log('登录失败' + err)
    } finally {
      this.showLoading = false
    }
  }

  build() {
    Column() {
      Text('X-Mood 快递')
        .fontSize(25)
        .fontWeight(600)
        .height(30)

      Row() {
        Text('账号登录')
          .fontSize(23)
          .fontWeight(600)
        Row() {
          Text('手机号登录')
            .fontSize(18)
            .fontWeight(600)
            .fontColor($r('app.color.danger'))
          Image($r('app.media.ARROW'))
            .width(20)
            .margin({ left: 5 })
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ top: 50 })

      Column({ space: 10 }) {
        TextInput({ placeholder: '请输入账号', text: $$this.accountForm.account })
          .textInputStyle()

        TextInput({ placeholder: '请输入密码', text: $$this.accountForm.password })
          .textInputStyle()
          .type(InputType.Password)

      }
      .width('100%')
      .margin({ top: 20 })

      Button() {
        Row({ space: 10 }) {
          if (this.showLoading) {
            LoadingProgress()
              .color($r('app.color.white'))
              .width(30)
          }
          Text('登录')
            .fontSize(20)
            .fontColor($r('app.color.white'))
        }
      }
      .width('100%')
      .height(50)
      .type(ButtonType.Capsule)
      .backgroundColor(this.getFormValidate() ? $r('app.color.primary') : $r('app.color.btn_plain'))
      .margin({ top: 30 })
      .enabled(this.getFormValidate())
      .onClick(() => {
        this.Login()
      })

    }
    .padding({ left: 20, right: 20 })
    .height('100%')
    .width('100%')
  }
}