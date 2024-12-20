import { iCard, iCardItem } from 'basic';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct Settings {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Stack({ alignContent: Alignment.Start }) {
        Row() {
          Text('系统设置')
            .fontSize(16)
            .fontColor($r('app.color.text_primary'))
            .fontWeight(600)
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)

        Image($r('app.media.arrow_left'))
          .width(20).autoResize(true)
          .margin({ left: 8 })
          .onClick(() => {
            router.back()
          })
      }
      .width('100%')
      .height(50)
      .backgroundColor($r('app.color.white'))

      Column() {
        iCard() {
          iCardItem({ title: '换绑手机' })
          iCardItem({ title: '修改密码' })
          iCardItem({ title: '消息通知设置' })
          iCardItem({ title: '清理缓存' })
        }
      }
      .padding({ left: 20, right: 20 })

      Column() {
        Button() {
          Text('退出登录')
            .fontSize(16)
            .fontColor($r('app.color.text_primary'))
        }
        .type(ButtonType.Normal)
        .borderRadius(6)
        .backgroundColor($r('app.color.white'))
        .width('100%')
        .height('100%')

      }
      .padding({ left: 20, right: 20 })
      .height(60)
      .margin({ top: 20 })

    }
    .height('100%')
    .width('100%')

    .backgroundColor($r('app.color.background_page'))
  }
}