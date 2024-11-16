import { hilog } from '@kit.PerformanceAnalysisKit';
import { setInterception } from './navPathStack'
import { Home } from './Home'

@Entry
@Component
struct Index {
  // 创建一个页面栈对象并传入Navigation
  @Provide('NavPathStack') pageInfos: NavPathStack = new NavPathStack()

  tabbarList: ToolbarItem[] = [
    {
      value: '首页',
      action: () => {
        console.log('首页')
      }
    },
    {
      value: '我的',
      action: () => {
        console.log('我的')
      }
    }
  ]

  aboutToAppear(): void {
    hilog.debug(0x0000, '组件生命周期-index', 'aboutToAppear')
    // 添加路由拦截器
    setInterception(this.pageInfos);
  }

  build() {
    Navigation(this.pageInfos){
      Home()
    }
    // .mode(NavigationMode.Auto)
    .toolbarConfiguration(this.tabbarList)
  }
}