@Component
export struct iCard {
  // 定义一个插槽，插入iCardItem
  @BuilderParam
  iCarFn: () => void

  build() {
    Column({ space: 20 }) {
      if (this.iCarFn) {
        this.iCarFn()
      }
    }
    .width('100%')
    .borderRadius(10)
    .padding(20)
    .backgroundColor($r('app.color.white'))
    .margin({ top: 15 })
  }
}