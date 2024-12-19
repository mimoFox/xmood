import { TabBarModel } from 'basic'

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
            Text(item.name)
          }.tabBar(this.tabsBuilder(item.icon as string, item.text, index))
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}