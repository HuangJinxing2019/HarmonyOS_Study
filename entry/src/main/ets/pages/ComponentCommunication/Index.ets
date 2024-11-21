import { StatusManageV1 } from './StatusManageV1'
import { StatusManageV2 } from './StatusManageV2'
import { useAppStore, AppStore } from '../../store/App'
@Builder
export function CommunicationBuilder(){
  ComponentCommunication()
}

@Preview
@ComponentV2
struct ComponentCommunication{
  @Consumer('NavPathStack') pageInfos: NavPathStack = new NavPathStack();
  @Local appStore: AppStore = useAppStore();

  // @Monitor('appStore.version') onVersionChange(monitor: IMonitor){
  //   console.log(`ComponentCommunication-IMonitor-version：${monitor.value()?.now}`)
  // }

  build() {
    NavDestination(){
      Text(`版本：${ this.appStore.version } ${ this.appStore.userInfo.name }`)
        .height(44)
        .fontColor('#666')
        .onClick(() => {
          this.appStore.setVersion('1.0.1')
          // this.appStore.userInfo.setUserName('李四')
        })
      StatusManageV1()
      StatusManageV2()
    }
    .title('组件通信')
  }
}