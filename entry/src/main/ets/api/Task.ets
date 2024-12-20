import { Http } from 'basic';
import { TaskInfoModel, TaskParamsModel } from '../models';

// 获取用户任务数据接口
export const getTaskInfoApi = (params: TaskParamsModel): Promise<TaskInfoModel> => {
  return Http.get<TaskInfoModel>('/driver/users/taskReport', params)
}