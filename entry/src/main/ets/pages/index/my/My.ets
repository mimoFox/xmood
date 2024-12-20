import { iCard, iCardItem } from 'basic'
import { getTaskInfoApi, getUserInfoApi } from '../../../api'
import { TaskInfoModel, TaskParamsModel, UserInfoModel } from '../../../models'
import { router } from '@kit.ArkUI'

@Component
export default struct My {
  @State userInfo: UserInfoModel = {
    avatar: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F95844b1e-4e9a-43d7-8b26-745a585eb02a%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1737253865&t=03074126e7ca2927a956bdb7e1eb4fb9',
    name: '',
    number: '',
    phone: ''
  } as UserInfoModel
  @State taskInfo: TaskInfoModel = {
    taskAmounts: 0,
    completedAmounts: 0,
    transportMileage: 0
  } as TaskInfoModel
  @State taskParams: TaskParamsModel = {
    month: (new Date().getMonth() + 1).toString(),
    year: new Date().getFullYear().toString()
  }

  aboutToAppear(): void {
    this.getUserInfo()
    this.getTaskInfo()
  }

  async getUserInfo() {
    try {
      this.userInfo = await getUserInfoApi()
    } catch (err) {
      console.log('获取用户信息失败：' + err)
    }
  }

  async getTaskInfo() {
    try {
      this.taskInfo = await getTaskInfoApi(this.taskParams)
    } catch (err) {
      console.log('获取任务信息失败：' + err)
    }
  }

  build() {
    Column() {
      Column({ space: 10 }) {
        Image(this.userInfo?.avatar)
          .width(60)
          .height(60)
          .borderRadius(30)
          .margin({ top: 50 })
        Text(this.userInfo?.name)
          .fontSize(20)
          .fontWeight(600)
          .fontColor($r('app.color.white'))
          .margin({ top: 5, bottom: 5 })
        Text(`司机编号：${this.userInfo?.number}`)
          .fontSize(15)
          .fontColor($r('app.color.white'))
        Text(`手机号：${this.userInfo?.phone}`)
          .fontSize(15)
          .fontColor($r('app.color.white'))
      }
      .height(292)
      .width('100%')
      .borderRadius({ bottomLeft: 50, bottomRight: 50 })
      .backgroundColor($r('app.color.primary'))


      Column() {
        Column() {
          Text('- 本月任务 -')
            .fontSize(16)
            .fontColor($r('app.color.text_secondary'))
            .margin({ bottom: 20, top: 5 })

          Row({ space: 30 }) {
            Column({ space: 20 }) {
              Text(`${this.taskInfo?.taskAmounts}`).fontSize(20).fontWeight(500)
              Text('任务总量').fontSize(16)
            }

            Column({ space: 20 }) {
              Text(`${this.taskInfo?.completedAmounts}`).fontSize(20).fontWeight(500)
              Text('完成任务量').fontSize(16)
            }

            Column({ space: 20 }) {
              Text(`${this.taskInfo?.transportMileage}`).fontSize(20).fontWeight(500)
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
          iCardItem({
            title: '车辆信息', onArrowClick() {

            }
          })
          Divider()
          iCardItem({
            title: '任务数据', onArrowClick() {

            }
          })
          Divider()
          iCardItem({
            title: '系统设置', onArrowClick() {
              router.pushUrl({ url: 'pages/setting/Settings' })
            }
          })
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