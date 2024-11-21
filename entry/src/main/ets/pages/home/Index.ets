import { hilog } from '@kit.PerformanceAnalysisKit';
import { setInterception } from './navPathStack'
import { Home } from './Home'
import { Person } from './Person'
import { CustomTabItem, TabBarItem } from './CustomTabBar'
import { useAppStore, AppStore } from '../../store/App'

@Entry
@ComponentV2
struct Index {
  @Local count: number = 0;
  // 创建一个页面栈对象并传入Navigation
  @Provider('NavPathStack') pageInfos: NavPathStack = new NavPathStack()
  @Local appStore: AppStore = useAppStore();

  aboutToAppear(): void {
    hilog.debug(0x0000, '组件生命周期-index', 'aboutToAppear')
    // 添加路由拦截器
    setInterception(this.pageInfos);
  }

  @Monitor('appStore.version') onVersionChange(monitor: IMonitor){
    console.log(`Index-IMonitor-version：${monitor.value()?.now}`)
  }

  @Builder
  tabBarItem(item: TabBarItem){
    CustomTabItem({ item })
  }

  tabBarList: TabBarItem[] = [
    new TabBarItem('首页', $r('app.media.house'),  $r('app.media.house_active'), true),
    new TabBarItem('我的', $r('app.media.person'),  $r('app.media.person_active'), false),
  ]

  build() {
    Navigation(this.pageInfos){
      Button('count + 1').onClick(() => this.count++)
      Tabs({ index: 0, barPosition: BarPosition.End }){
        ForEach(this.tabBarList, (item: TabBarItem, index: number) => {
          TabContent(){
            if(index === 0){
              Home({ active: this.count })
            } else if(index === 1){
              Person({ active: this.count })
            }
          }
          .tabBar(this.tabBarItem(this.tabBarList[index]))
        }, (_: TabBarItem, index: number) => index.toString())
      }
      .onContentWillChange((currentIndex: number, index: number) => {
        this.tabBarList.forEach(item => item.active = false)
        this.tabBarList[index].active = true
        return true
      })
    }
    .onNavBarStateChange((isVisible: boolean) => {
      console.log(isVisible + '')
    })
    .hideToolBar(true)
  }
}