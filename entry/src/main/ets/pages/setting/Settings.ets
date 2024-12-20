import { iCard, iCardItem, iConfirmDialog, iNavBar } from 'basic';

@Entry
@Component
struct Settings {
  controller: CustomDialogController = new CustomDialogController({
    builder: iConfirmDialog({
      title: '确定退出登录吗？',
      btnList: [
        {
          text: '取消'
        },
        {
          text: '退出',
          fontcolor: $r('app.color.primary'),
          action: () => {
            AlertDialog.show({ message: '666' })
          }
        }
      ]
    })
  })

  build() {
    Column() {
      iNavBar({ title: '系统设置' })

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
        .onClick(() => {
          this.controller.open()
        })

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