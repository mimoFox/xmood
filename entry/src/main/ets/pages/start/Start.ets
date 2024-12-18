import { AdvertClass } from 'basic/src/main/ets/models/Advert'
import { window } from '@kit.ArkUI'

@Entry
@Component
struct Start {
  @State adObj: AdvertClass = {
    showAd: false,
    adTime: 5
  }
  @State timer: number = -1

  aboutToAppear(): void {
    this.countDown()
  }

  aboutToDisappear(): void {
    clearInterval(this.timer)
  }

  // 开始倒计时
  countDown() {
    this.timer = setInterval(() => {
      this.adObj.adTime--
      if (this.adObj.adTime === 0) {
        this.countEnd()
        return
      }

    }, 1000)
  }

  // 清除定时器 并且关闭窗口
  countEnd() {
    clearInterval(this.timer)
    window.findWindow('ad_window').destroyWindow()
  }

  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Stack() {
        Image($r('app.media.start'))
          .objectFit(ImageFit.Cover)
        Text('Xmood 物流助手')
          .fontSize(30)
          .fontWeight(600)
          .fontColor($r('app.color.white'))
          .align(Alignment.Bottom)
          .offset({
            y: -100
          })
          .height('100%')
      }

      Text(this.adObj.adTime != 0 ? `${this.adObj.adTime}秒后跳过` : '跳过')
        .fontColor($r('app.color.white'))
        .margin({
          top: 50,
          right: 20
        })

    }
    .height('100%')
    .width('100%')
  }
}