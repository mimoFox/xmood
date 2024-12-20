import { router } from '@kit.ArkUI'

@Component
export struct iNavBar {
  title: string = ''
  backIcon: ResourceStr = $r('app.media.arrow_left')
  showBackIcon: boolean = true

  build() {
    Stack({ alignContent: Alignment.Start }) {
      Row() {
        Text(this.title)
          .fontSize(16)
          .fontColor($r('app.color.text_primary'))
          .fontWeight(600)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)

      if (this.showBackIcon) {
        Image($r('app.media.arrow_left'))
          .width(20).autoResize(true)
          .margin({ left: 8 })
          .onClick(() => {
            router.back()
          })
      }
    }
    .width('100%')
    .height(50)
    .backgroundColor($r('app.color.white'))
  }
}