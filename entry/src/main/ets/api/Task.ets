import { Http } from 'basic';
import { TaskInfoModel, TaskListDataModel, TaskListParamsModel, TaskParamsModel } from '../models';

// 获取用户任务数据接口
export const getTaskInfoApi = (params: TaskParamsModel): Promise<TaskInfoModel> => {
  return Http.get<TaskInfoModel>('/driver/users/taskReport', params)
}


// 获取用户任务列表数据接口
export const getTaskListDataApi = (params: TaskListParamsModel): Promise<TaskListDataModel> => {
  return Http.get<TaskListDataModel>('/driver/tasks/list', params)
}