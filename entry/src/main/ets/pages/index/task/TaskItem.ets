import { TaskListItemDataModel } from '../../../models'

@Component
export default struct TaskItem {
  @Prop taskListItemData: TaskListItemDataModel[] = []

  @Builder
  taskListItemBuilder(item: TaskListItemDataModel) {
    Column({ space: 5 }) {
      Row() {
        Text(`任务编号：${item.transportTaskId}`)
          .fontSize(22)
          .fontWeight(600)
          .fontColor($r('app.color.text_primary'))

        Stack() {
          Row()
            .width(70)
            .height(25)
            .border({
              width: 3,
              color: $r('app.color.danger')
            })
            .borderRadius(10)

          Text(item.status === 1 ? '待提货' : item.status === 2 ? '在途' : item.status === 6 ? '已完成' : '已延迟')
            .fontSize(14)
            .fontColor($r('app.color.primary'))
        }

      }
      .width('100%')
      .height(35)
      .justifyContent(FlexAlign.SpaceBetween)


      Column() {
        Row({ space: 10 }) {
          Stack() {
            Row()
              .width(22)
              .height(22)
              .borderRadius(11)
              .backgroundColor($r('app.color.black'))
            Text('起')
              .fontSize(12)
              .fontColor($r('app.color.white'))
          }

          Row() {
            Text(item.startAddress)
              .fontSize(14)
              .fontColor($r('app.color.text_secondary'))
          }
          .layoutWeight(1)
        }
        .alignItems(VerticalAlign.Top)

        Row({ space: 10 }) {
          Stack() {
            Row()
              .width(22)
              .height(22)
              .borderRadius(11)
              .backgroundColor($r('app.color.primary'))
            Text('止')
              .fontSize(12)
              .fontColor($r('app.color.white'))
          }

          Row() {
            Text(item.endAddress)
              .fontSize(14)
              .fontColor($r('app.color.text_secondary'))
          }
          .layoutWeight(1)
        }
        .alignItems(VerticalAlign.Center)
        .margin({ top: 15, bottom: 15 })
      }
      .margin({ top: 15 })
      .border({
        width: { bottom: 1 },
        color: $r('app.color.border')
      })


      Row() {
        Column({ space: 5 }) {
          Text('提货时间')
            .fontSize(14)
            .fontColor($r('app.color.text_secondary'))
          Text(item.planArrivalTime)
            .fontSize(14)
            .fontColor($r('app.color.text_primary'))
        }
        .alignItems(HorizontalAlign.Start)

        Button() {
          Text('提货')
            .fontSize(12)
            .fontColor($r('app.color.white'))
            .textAlign(TextAlign.Center)
        }
        .width(70)
        .height(30)
        .backgroundColor(item.enablePickUp ? $r('app.color.primary') : $r('app.color.primary_disabled'))
        .enabled(item.enablePickUp)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ top: 10 })

    }
    .width('100%')
    .padding(10)
    .borderRadius(10)
    .backgroundColor($r('app.color.white'))
  }

  build() {
    Column({ space: 15 }) {
      ForEach(this.taskListItemData, (item: TaskListItemDataModel) => {
        this.taskListItemBuilder(item)
      })
    }
    .width('100%')

  }
}