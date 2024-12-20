import { ConfirmDialogModel } from '../models'

@CustomDialog
@Component
export struct iConfirmDialog {
  controller: CustomDialogController
  btnList: ConfirmDialogModel[] = []
  title: string = '确定退出登录吗？'

  build() {
    Row() {
      Column() {
        Column() {
          Text(this.title)
            .fontSize(20)
            .fontWeight(600)
            .fontColor($r('app.color.text_primary'))
            .height(80)
        }
        .width('100%')
        .border({
          width: { bottom: 1 },
          color: $r('app.color.border')
        })

        Row() {
          ForEach(this.btnList, (item: ConfirmDialogModel, index: number) => {
            Text(item.text || '取消')
              .fontSize(item.fontsize || 16)
              .fontColor(item.fontcolor || $r('app.color.text_secondary'))
              .onClick(() => {
                if (item.action) {
                  item.action()
                }
                this.controller.close()
              })
            // .border({
            //   width: { right: this.btnList.length >= 1 && index !== this.btnList.length - 1 ? 1 : 0 }
            // })
            if (this.btnList.length >= 1 && index !== this.btnList.length - 1) {
              Divider().vertical(true)
                .color($r('app.color.border'))
                .width(1)
            }
          })
        }
        .width('100%')
        .height(60)
        .justifyContent(FlexAlign.SpaceEvenly)
      }
    }
    .width('100%')
    .padding({ left: 25, right: 25 })
  }
}