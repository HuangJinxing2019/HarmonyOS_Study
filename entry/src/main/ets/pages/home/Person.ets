import { hilog } from "@kit.PerformanceAnalysisKit"
import { useAppStore, AppStore } from '../../store/App'
import { useLoginPre, LoginPre } from '../../store/LoginPer'

@ComponentV2({ freezeWhenInactive: true })
export struct Person{
  @Param active: number = 0;
  @Local appStore: AppStore = useAppStore();
  @Local loginPre: LoginPre = useLoginPre();


  @Monitor('active') onActiveChange(monitor: IMonitor){
    console.log(`Person-IMonitor-active：${monitor.value()?.now}`)
  }
  @Monitor('appStore.version') onVersionChange(monitor: IMonitor){
    console.log(`Person-IMonitor-version：${monitor.value()?.now}`)
  }

  aboutToAppear(): void {
    hilog.debug(0x0000, '组件生命周期-Person', 'aboutToAppear')
    hilog.debug(0x0000, '持久化数据-Person', `${this.loginPre.value.token}`)
  }
  build() {
    Column(){
      Text('我的页面')
      Text(`版本：${this.appStore.version}`)
      Text(`token：${this.loginPre.value.token}`)
    }
    .height('100%')
  }
}

@ComponentV2({ freezeWhenInactive: true })
struct FreezeChild {
  @Param message: number = 0;

  @Monitor('message') onMessageUpdated(mon: IMonitor) {
    console.info(`FreezeChild message callback func ${this.message}`);
  }

  build() {
    Text("message" + `${this.message}`)
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
  }
}