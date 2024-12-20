@Component
export struct iCardItem {
  title: string = ''
  @Prop textRight?: string = ''
  showRightIcon: boolean = true
  rightIcon: ResourceStr = $r('app.media.arrow_right')
  showBottomBorder: boolean = false

  build() {
    Row() {
      Text(this.title)
        .fontSize(16)
        .fontWeight(400)
        .fontColor($r('app.color.text_primary'))
      Row({ space: 5 }) {
        if (this.textRight) {
          Text(this.textRight)
            .fontSize(14)
            .fontColor($r('app.color.text_secondary'))
        }

        if (this.showRightIcon) {
          Image(this.rightIcon)
            .width(20)
        }
      }
    }
    .width('100%')
    .border({
      width: {
        bottom: this.showBottomBorder ? 1 : 0
      },
      color: $r('app.color.border')
    })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}