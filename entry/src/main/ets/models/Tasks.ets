// 任务信息接口数据模型
export interface TaskParamsModel {
  /**
   * 月
   */
  month: string;

  /**
   * 年
   */
  year: string;

}

export interface TaskInfoModel {
  /**
   * 完成任务数量,基于实际完成时间统计
   */
  completedAmounts: number;

  /**
   * 每日里程,基于实际完成时间统计
   */
  dailyMileage: DailyMileage[];

  /**
   * 任务数量,基于计划完成时间统计
   */
  taskAmounts: number;

  /**
   * 运输里程，单位：公里，基于实际完成时间统计
   */
  transportMileage: number;

}

export interface DailyMileage {
  /**
   * 日期,格式：2022-07-16 00:00:00
   */
  dateTime?: string;

  /**
   * 里程，单位：公里;计算公式：原始数据（单位米）/1000 四舍五入取整
   */
  mileage?: number;

}


// 任务列表接口数据模型
export interface TaskListParamsModel {
  /**
   * 结束时间
   */
  endTime?: string;

  /**
   * 页码
   */
  page: number;

  /**
   * 页面大小
   */
  pageSize: number;

  /**
   * 开始时间
   */
  startTime?: string;

  /**
   * 作业状态，1为待提货）、2为在途(在途和已交付)、3为改派、5为已作废、6为已完成（已回车登记）
   */
  status: TaskStatusEnum;

  /**
   * 运输任务id
   */
  transportTaskId?: string;
}

export enum TaskStatusEnum {
  WAITING = 1,
  LINE = 2,
  FINISH = 6
}

export interface TaskListDataModel {
  /**
   * 总条目数
   */
  counts: number;

  /**
   * 数据列表
   */
  items: TaskListItemDataModel[];

  /**
   * 页码
   */
  page: number;

  /**
   * 总页数
   */
  pages: number;

  /**
   * 页尺寸
   */
  pageSize: number;

}

export interface TaskListItemDataModel {
  /**
   * 实际到达时间
   */
  actualArrivalTime: string;

  /**
   * 实际发车时间
   */
  actualDepartureTime: string;

  /**
   * 创建时间
   */
  created: string;

  /**
   * 司机id
   */
  driverId: string;

  /**
   * 是否可提货
   */
  enablePickUp: boolean;

  /**
   * 目的机构地址
   */
  endAddress: string;

  /**
   * 目的机构id
   */
  endAgencyId: number;

  /**
   * 交付对接人
   */
  finishHandover: string;

  /**
   * 司机作业单id
   */
  id: string;

  /**
   * 计划到达时间
   */
  planArrivalTime: string;

  /**
   * 计划发车时间
   */
  planDepartureTime: string;

  /**
   * 起始机构地址
   */
  startAddress: string;

  /**
   * 起始机构id
   */
  startAgencyId: number;

  /**
   * 提货对接人
   */
  startHandover: string;

  /**
   * 作业状态，作业状态，1为待提货）、2为在途）、3为改派）、4为已交付）、5为已作废
   */
  status: TaskStatusEnum;

  /**
   * 运输任务id
   */
  transportTaskId: string;

}