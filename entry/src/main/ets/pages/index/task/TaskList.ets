import { getTaskListDataApi } from '../../../api';
import { TaskListDataModel, TaskListItemDataModel, TaskListParamsModel, TaskStatusEnum } from '../../../models';
import TaskItem from './TaskItem';

@Component
export default struct TaskList {
  @State taskListItemData: TaskListItemDataModel[] = [
    {
      /**
       * 实际到达时间
       */
      actualArrivalTime: '2024-12-12',

      /**
       * 实际发车时间
       */
      actualDepartureTime: '2024-12-01',

      /**
       * 创建时间
       */
      created: '2024-11-30',

      /**
       * 司机id
       */
      driverId: '666666',

      /**
       * 是否可提货
       */
      enablePickUp: true,

      /**
       * 目的机构地址
       */
      endAddress: '上课的房间昆仑山搭街坊',

      /**
       * 目的机构id
       */
      endAgencyId: 8888888,

      /**
       * 交付对接人
       */
      finishHandover: 'mimo',

      /**
       * 司机作业单id
       */
      id: '45487879',

      /**
       * 计划到达时间
       */
      planArrivalTime: '2024-12-12',

      /**
       * 计划发车时间
       */
      planDepartureTime: '2024-12-01',

      /**
       * 起始机构地址
       */
      startAddress: '撒可见度分厘卡伺机待发,撒可见度分厘卡伺机待发',

      /**
       * 起始机构id
       */
      startAgencyId: 888888,

      /**
       * 提货对接人
       */
      startHandover: 'tim',

      /**
       * 作业状态，作业状态，1为待提货）、2为在途）、3为改派）、4为已交付）、5为已作废
       */
      status: TaskStatusEnum.WAITING,

      /**
       * 运输任务id
       */
      transportTaskId: '6888'
    },
    {
      /**
       * 实际到达时间
       */
      actualArrivalTime: '2024-12-12',

      /**
       * 实际发车时间
       */
      actualDepartureTime: '2024-12-01',

      /**
       * 创建时间
       */
      created: '2024-11-30',

      /**
       * 司机id
       */
      driverId: '666666',

      /**
       * 是否可提货
       */
      enablePickUp: false,

      /**
       * 目的机构地址
       */
      endAddress: '上课的房间昆仑山搭街坊',

      /**
       * 目的机构id
       */
      endAgencyId: 8888888,

      /**
       * 交付对接人
       */
      finishHandover: 'mimo',

      /**
       * 司机作业单id
       */
      id: '45487879',

      /**
       * 计划到达时间
       */
      planArrivalTime: '2024-12-12',

      /**
       * 计划发车时间
       */
      planDepartureTime: '2024-12-01',

      /**
       * 起始机构地址
       */
      startAddress: '撒可见度分厘卡伺机待发,撒可见度分厘卡伺机待发,撒可见度分厘卡伺机待发,撒可见度分厘卡伺机待发',

      /**
       * 起始机构id
       */
      startAgencyId: 888888,

      /**
       * 提货对接人
       */
      startHandover: 'tim',

      /**
       * 作业状态，作业状态，1为待提货）、2为在途）、3为改派）、4为已交付）、5为已作废
       */
      status: TaskStatusEnum.WAITING,

      /**
       * 运输任务id
       */
      transportTaskId: '345346'
    },
    {
      /**
       * 实际到达时间
       */
      actualArrivalTime: '2024-12-12',

      /**
       * 实际发车时间
       */
      actualDepartureTime: '2024-12-01',

      /**
       * 创建时间
       */
      created: '2024-11-30',

      /**
       * 司机id
       */
      driverId: '666666',

      /**
       * 是否可提货
       */
      enablePickUp: true,

      /**
       * 目的机构地址
       */
      endAddress: '上课的房间昆仑山搭街坊',

      /**
       * 目的机构id
       */
      endAgencyId: 8888888,

      /**
       * 交付对接人
       */
      finishHandover: 'mimo',

      /**
       * 司机作业单id
       */
      id: '45487879',

      /**
       * 计划到达时间
       */
      planArrivalTime: '2024-12-12 13.30',

      /**
       * 计划发车时间
       */
      planDepartureTime: '2024-12-01 13:30',

      /**
       * 起始机构地址
       */
      startAddress: '撒可见度分厘卡伺机待发,撒可见度分厘卡伺机待发,撒可见度分厘卡伺机待发,撒可见度分厘卡伺机待发',

      /**
       * 起始机构id
       */
      startAgencyId: 888888,

      /**
       * 提货对接人
       */
      startHandover: 'tim',

      /**
       * 作业状态，作业状态，1为待提货）、2为在途）、3为改派）、4为已交付）、5为已作废
       */
      status: TaskStatusEnum.WAITING,

      /**
       * 运输任务id
       */
      transportTaskId: '235234'
    }
  ]
  @State TaskListParams: TaskListParamsModel = {
    page: 1,
    pageSize: 5,
    status: TaskStatusEnum.WAITING,
  }
  scroller: Scroller = new Scroller()
  @State loading: boolean = false

  aboutToAppear(): void {
    // this.getTaskListData()
  }

  // 接口请求回来是个null，先用假数据替代
  async getTaskListData() {
    try {
      this.loading = true
      const res: TaskListDataModel = await getTaskListDataApi(this.TaskListParams)
      this.taskListItemData.push(...this.taskListItemData)
      this.loading = false

    } catch (err) {
      console.log('获取任务列表失败' + err)
    }

  }

  build() {
    Scroll(this.scroller) {
      Column({ space: 10 }) {
        TaskItem({ taskListItemData: this.taskListItemData })
      }
      .width('100%')
      .padding({ left: 15, right: 15 })
      .margin({ bottom: 10 })
    }
    .edgeEffect(EdgeEffect.Spring)
    .scrollBar(BarState.Off)
    .onReachEnd(() => {
      if (this.loading) {
        return
      }

      this.getTaskListData()
    })
    .onReachStart(() => {
      
    })
  }
}