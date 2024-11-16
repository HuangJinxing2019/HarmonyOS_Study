import { hilog } from '@kit.PerformanceAnalysisKit';
import { setInterception } from './navPathStack'
import { Home } from './Home'
import { Person } from './Person'
import { CustomTabBar, CustomTabItem } from './CustomTabBar'

@Observed
class TabBarItem {
  text: string = '';
  icon: Resource | null = null;
  activeIcon: Resource | null = null;
  active: boolean = false;
  constructor(text: string, icon: Resource, activeIcon: Resource, active: boolean) {
    this.text = text
    this.icon = icon
    this.activeIcon = activeIcon
    this.active = active
  }
}


@Entry
@Component
struct Index {
  @State activeTab: number = 0;
  // 创建一个页面栈对象并传入Navigation
  @Provide('NavPathStack') pageInfos: NavPathStack = new NavPathStack()

  aboutToAppear(): void {
    hilog.debug(0x0000, '组件生命周期-index', 'aboutToAppear')
    // 添加路由拦截器
    setInterception(this.pageInfos);
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
      Tabs({ index: this.activeTab, barPosition: BarPosition.End }){
        ForEach(this.tabBarList, (item: TabBarItem, index: number) => {
          TabContent(){
            if(index === 0){
              Home()
            } else if(index === 1){
              Person()
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




  // tabChange = (index: number) => {
  //   console.log(this.activeTab + '', index)
  // }
  // @Builder
  // customTab(){
  //   CustomTabBar({
  //     active: this.activeTab,
  //     change: this.tabChange
  //   })
  // }
  //
  // build() {
  //   Navigation(this.pageInfos){
  //     Column(){
  //       if(this.activeTab === 0){
  //         Home()
  //       } else if(this.activeTab === 1){
  //         Column(){
  //           Text('我的页面')
  //         }
  //       }
  //     }
  //   }
  //   .onNavBarStateChange((isVisible: boolean) => {
  //     console.log(isVisible + '')
  //   })
  //   .toolbarConfiguration(this.customTab)
  // }
}