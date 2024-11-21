import { TopNavigation } from "../../components/TopNavigation/Index";
import { courseList, enablementList } from "./data.home";
import { CourseProp } from "./ElementaryCourse/Course";
import { ElementaryCourse } from "./ElementaryCourse/Index";
import { EnablementProp } from "./EnablementView/EnablementItem";
import { EnablementView } from "./EnablementView/Index";
import { TopSwiper } from "./TopSwiper/Index";
import { hilog } from "@kit.PerformanceAnalysisKit";
import { useAppStore, AppStore } from '../../store/App'
import { useLoginPre, LoginPre } from '../../store/LoginPer'

@ComponentV2({ freezeWhenInactive: true })
export struct Home{
  @Param active: number = 0;

  @Local title: string = '快速入门';
  @Local backIcon: boolean = false;
  @Local enablementList: EnablementProp[] = enablementList
  @Local courseList: CourseProp[] = courseList
  @Local appStore: AppStore = useAppStore();
  @Local loginPre: LoginPre = useLoginPre();

  @Monitor('active') onActiveChange(monitor: IMonitor){
    console.log(`Home-IMonitor-active：${monitor.value()?.now}`)
  }

  @Monitor('appStore.version') onVersionChange(monitor: IMonitor){
    console.log(`Home-IMonitor-version：${monitor.value()?.now}`)
  }

  @Computed get activeCount(){
    console.log(`Home-IMonitor-activeCount：${this.active + 2}`)
    return this.active + 2
  }

  aboutToAppear(): void {
    hilog.debug(0x0000, '组件生命周期-Home', 'aboutToAppear')
    hilog.debug(0x0000, '输出应用版本-index', `${ this.appStore }`)
  }

  onWillScroll(xOffset: number, yOffset: number, scrollState: ScrollState){
    console.log(xOffset.toString(), yOffset.toString(), scrollState)
  }
  onScrollEdge(side: Edge){
    console.info('To the edge', Edge[side])
  }

  build() {
    Column(){
      TopNavigation({ title: this.title, back: this.backIcon })
      Scroll(){
        Column(){
          TopSwiper()
          EnablementView({
            data: this.enablementList,
            onWillScroll: this.onWillScroll,
            onScrollEdge: this.onScrollEdge,
          })
            .margin({ top: 15 })
          ElementaryCourse({ courseList: this.courseList })
            .margin({ top: 15 })
          Text(`版本：${ this.appStore.version } ${ this.appStore.userInfo.name }`)
            .height(44)
            .fontColor('#666')
            .onClick(() => {
              this.appStore.setVersion('1.0.0')
              // this.appStore.userInfo.setUserName('李四')
            })
          Text(`token：${ this.loginPre.value.token }`)
            .height(44)
            .fontColor('#666')
            .onClick(() => {
              this.loginPre.value.setToken('909')
              // this.loginPre.save();
            })
        }
      }
      .scrollable(ScrollDirection.Vertical)
      .padding({ bottom: 50 })
      .onScrollEdge((side: Edge) => {
        console.log(Edge[side])
      })
    }
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}