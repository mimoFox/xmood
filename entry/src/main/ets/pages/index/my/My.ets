import { iCard, iCardItem } from 'basic'

@Component
export default struct My {
  @Styles
  textStyles() {

  }

  build() {
    Column() {
      Column({ space: 10 }) {
        Image('https://iknow-pic.cdn.bcebos.com/810a19d8bc3eb1354bb3a625b41ea8d3fd1f4433')
          .width(60)
          .height(60)
          .borderRadius(30)
          .margin({ top: 50 })
        Text('XMood')
          .fontSize(20)
          .fontWeight(600)
          .fontColor($r('app.color.white'))
          .margin({ top: 5, bottom: 5 })
        Text('司机编号：666666')
          .fontSize(15)
          .fontColor($r('app.color.white'))
        Text('手机号：177 9898 8888')
          .fontSize(15)
          .fontColor($r('app.color.white'))
      }
      .height(292)
      .width('100%')
      .backgroundColor($r('app.color.primary'))


      Column() {
        Column() {
          Text('- 本月任务 -')
            .fontSize(16)
            .fontColor($r('app.color.text_secondary'))
            .margin({ bottom: 20, top: 5 })

          Row({ space: 30 }) {
            Column({ space: 20 }) {
              Text('18').fontSize(20).fontWeight(500)
              Text('任务总量').fontSize(16)
            }

            Column({ space: 20 }) {
              Text('16').fontSize(20).fontWeight(500)
              Text('完成任务量').fontSize(16)
            }

            Column({ space: 20 }) {
              Text('3987').fontSize(20).fontWeight(500)
              Text('运输里程(km)').fontSize(16)
            }
          }
        }
        .width('100%')
        .borderRadius(10)
        .height(134)
        .padding({ left: 15, right: 15, bottom: 20 })
        .backgroundColor($r('app.color.white'))

        // Column({ space: 20 }) {
        //   Row() {
        //     Text('车辆信息')
        //       .fontSize(16)
        //       .fontWeight(400)
        //       .fontColor($r('app.color.text_primary'))
        //     Image($r('app.media.arrow_right'))
        //       .width(20)
        //   }
        //   .width('100%')
        //   .justifyContent(FlexAlign.SpaceBetween)
        //
        //   Divider()
        //
        //   Row() {
        //     Text('任务数据')
        //       .fontSize(16)
        //       .fontWeight(400)
        //       .fontColor($r('app.color.text_primary'))
        //     Image($r('app.media.arrow_right'))
        //       .width(20)
        //   }
        //   .width('100%')
        //   .justifyContent(FlexAlign.SpaceBetween)
        //
        //   Divider()
        //
        //   Row() {
        //     Text('系统设置')
        //       .fontSize(16)
        //       .fontWeight(400)
        //       .fontColor($r('app.color.text_primary'))
        //     Image($r('app.media.arrow_right'))
        //       .width(20)
        //   }
        //   .width('100%')
        //   .justifyContent(FlexAlign.SpaceBetween)
        // }
        // .width('100%')
        // .borderRadius(10)
        // .padding(20)
        // .backgroundColor($r('app.color.white'))
        // .margin({ top: 15 })

        iCard() {
          iCardItem({ title: '车辆信息' })
          Divider()
          iCardItem({ title: '任务数据' })
          Divider()
          iCardItem({ title: '系统设置' })
        }

      }
      .margin({ left: 10, right: 10 })
      .offset({ y: -60 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_page'))
  }
}