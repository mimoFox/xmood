@Entry
@Component
struct Login {
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
        TextInput({ placeholder: '请输入账号' })
          .textInputStyle()

        TextInput({ placeholder: '请输入密码' })
          .textInputStyle()
          .type(InputType.Password)

      }
      .width('100%')
      .margin({ top: 20 })

      Button('登录')
        .width('100%')
        .height(50)
        .fontSize(20)
        .type(ButtonType.Capsule)
        .fontColor($r('app.color.white'))
        .backgroundColor($r('app.color.btn_plain'))
        .margin({ top: 30 })

    }
    .padding({ left: 20, right: 20 })
    .height('100%')
    .width('100%')
  }
}