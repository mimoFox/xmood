import { TabBarModel } from 'basic'
import Message from './message/Message'
import My from './my/My'
import Task from './task/Task'

@Entry
@Component
struct Index {
  @State tabsData: TabBarModel[] = [
    {
      text: '任务',
      icon: $r('app.media.gtasks'),
      name: 'task'
    },
    {
      text: '消息',
      icon: $r('app.media.message_l'),
      name: 'message'
    },
    {
      text: '我的',
      icon: $r('app.media.My_m'),
      name: 'my'
    }
  ]
  @State currentIndex: number = 0

  @Builder
  tabsBuilder(icon: ResourceStr, text: string, index: number) {
    Column({ space: 5 }) {
      Image(icon).width(22)
        .fillColor(this.currentIndex === index ? $r('app.color.primary') : '')
      Text(text).fontSize(12)
        .fontColor(this.currentIndex === index ? $r('app.color.primary') : '')
    }
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, index: $$this.currentIndex }) {
        ForEach(this.tabsData, (item: TabBarModel, index: number) => {
          TabContent() {
            if (index === 0) {
              Task()
            } else if (index === 1) {
              Message()
            } else if (index === 2) {
              My()
            }
          }.tabBar(this.tabsBuilder(item.icon as string, item.text, index))
        })
      }
      .animationDuration(400)
      .barMode(BarMode.Fixed)
    }
    .height('100%')
    .width('100%')
  }
}