import { hilog } from "@kit.PerformanceAnalysisKit"

@Component
export struct Person{
  aboutToAppear(): void {
    hilog.debug(0x0000, '组件生命周期-Person', 'aboutToAppear')
  }
  build() {
    Column(){
      Text('我的页面')
    }
    .height('100%')
  }
}