import { TabBarModel } from '../../models'

@Component
export struct iTabs {
  tabsData: TabBarModel[] = []
  @State currentIndex: number = 0
  controller: TabsController = new TabsController()
  // 定义一个插槽，插入iCardItem
  @BuilderParam
  iTabsItemFn: () => void

  @Builder
  tabsBuilder(item: TabBarModel, index: number) {
    Column() {
      Text(item.text)
        .fontSize(16)
        .fontWeight(600)
        .fontColor(this.currentIndex === index ? $r('app.color.text_primary') : $r('app.color.text_secondary'))

      Divider()
        .color($r('app.color.warning'))
        .strokeWidth(6)
        .lineCap(LineCapStyle.Round)
        .width(this.currentIndex === index ? 23 : 0)
    }
    .height(50)
    .justifyContent(FlexAlign.SpaceEvenly)
    .margin({ left: 15, right: 5 })
    .onClick(() => {
      this.controller.changeIndex(index)
    })
    .animation({ duration: 300 })
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.Top }) {
        Tabs({ controller: this.controller, index: $$this.currentIndex }) {
          ForEach(this.tabsData, (item: TabBarModel, index: number) => {
            TabContent() {
              if (item.name === 'waiting') {
                if (this.iTabsItemFn) {
                  this.iTabsItemFn()
                }
              } else if (item.name === 'line') {
                if (this.iTabsItemFn) {
                  this.iTabsItemFn()
                }
              } else if (item.name === 'finish') {
                if (this.iTabsItemFn) {
                  this.iTabsItemFn()
                }
              }
            }.tabBar(item.text)
          })
        }
        .animation({ duration: 400 })

        Row({ space: 20 }) {
          ForEach(this.tabsData, (item: TabBarModel, index: number) => {
            this.tabsBuilder(item, index)
          })
        }
        .width('100%')
        .height(50)
        .backgroundColor($r('app.color.white'))
      }
    }
    .width('100%')
    .height('100%')
  }
}