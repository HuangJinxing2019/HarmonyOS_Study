import { AppStorageV2 } from '@kit.ArkUI'

@ObservedV2
class UserInfo{
  @Trace name: string = '张三';
  @Trace mobile: string = '138001`38000';
  setUserName(name: string){
    this.name = name
  }
}

@ObservedV2
export class AppStore{
  @Trace name: string = '设备名称';
  @Trace version: string = '1.0.0';
  @Trace userInfo: UserInfo = new UserInfo();
  setVersion(version: string){
    this.version = version
  }
  remove: () => void = () => {
    AppStorageV2.remove(AppStore)
  };
}

export function useAppStore(): AppStore{
  return AppStorageV2.connect(AppStore, () => new AppStore())!
}