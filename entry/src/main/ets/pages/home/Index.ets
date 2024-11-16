import { TopNavigation } from '../../components/TopNavigation/Index'
import { TopSwiper } from './TopSwiper/Index'
import { EnablementView, EnablementProp } from './EnablementView/Index'
import { ElementaryCourse, CourseProp } from './ElementaryCourse/Index'
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct Index {
  @State title: string = '快速入门';
  @State backIcon: boolean = false;
  @State enablementList: EnablementProp[] = [
    {
      id: 1,
      imgUrl: 'app.media.enablement_pic1',
      name: 'HarmonyOS第一课',
      content: '基于真实的开发场景，提供向导式学习，多维度融合课程等内容，给开发者提供全新的学习体验。',
    },
    {
      id: 2,
      imgUrl: 'app.media.enablement_pic2',
      name: 'HarmonyOS第二课',
      content: '父子组件通行：状态管理最佳实践、EventHub、emitter',
    },
    {
      id: 3,
      imgUrl: 'app.media.enablement_pic3',
      name: 'HarmonyOS第一课',
      content: '基于真实的开发场景，提供向导式学习，多维度融合课程等内容，给开发者提供全新的学习体验。',
    },
    {
      id: 4,
      imgUrl: 'app.media.enablement_pic4',
      name: 'HarmonyOS第一课',
      content: '基于真实的开发场景，提供向导式学习，多维度融合课程等内容，给开发者提供全新的学习体验。',
    },
    {
      id: 5,
      imgUrl: 'app.media.enablement_pic5',
      name: 'HarmonyOS第一课',
      content: '基于真实的开发场景，提供向导式学习，多维度融合课程等内容。',
    },
    {
      id: 6,
      imgUrl: 'app.media.enablement_pic6',
      name: 'HarmonyOS第一课',
      content: '基于真实的开发场景，提供向导式学习，多维度融合课程等内容。',
    },
    {
      id: 7,
      imgUrl: 'app.media.enablement_pic7',
      name: 'HarmonyOS第一课',
      content: '基于真实的开发场景，提供向导式学习，多维度融合课程等内容，给开发者提供全新的学习体验。',
    },
    {
      id: 8,
      imgUrl: 'app.media.enablement_pic8',
      name: 'HarmonyOS第一课',
      content: '基于真实的开发场景，提供向导式学习，多维度融合课程等内容，给开发者提供全新的学习体验。',
    },
  ]
  @State courseList: CourseProp[] = [
    {
      id: 1,
      name: 'Step1 环境的搭建',
      imgUrl: 'app.media.tutorial_pic1',
      description: '本简教程实现了快速入门——一个用于了解和学习Harmony0s的也用程序。',
    },
    {
      id: 2,
      name: 'Step2 使用Swiper构建运营广告位',
      imgUrl: 'app.media.tutorial_pic2',
      description: 'Swiper组件提供滑动轮播显示的能力。Swiper本身是一个容器组件，当设置收到复活甲阿克苏打分卡三大发贺卡受打击和',
    },
    {
      id: 3,
      name: 'Step3 创建和组合视图',
      imgUrl: 'app.media.tutorial_pic3',
      description: 'Item定义子组件相关特征。相关组件支持使用条件渲染、循环渲染、懒加载答复哈上岛咖啡哈多手机卡合法',
    },
    {
      id: 4,
      name: 'Step4 环境的搭建',
      imgUrl: 'app.media.tutorial_pic4',
      description: '本简教程实现了快速入门——一个用于了解和学习Harmony0s的也用程序。',
    },
    {
      id: 5,
      name: 'Step5 环境的搭建',
      imgUrl: 'app.media.tutorial_pic5',
      description: '本简教程实现了快速入门——一个用于了解和学习Harmony0s的也用程序。',
    },
    {
      id: 6,
      name: 'Step6 环境的搭建',
      imgUrl: 'app.media.tutorial_pic6',
      description: '本简教程实现了快速入门——一个用于了解和学习Harmony0s的也用程序。',
    },
    {
      id: 7,
      name: 'Step7 环境的搭建',
      imgUrl: 'app.media.tutorial_pic7',
      description: '本简教程实现了快速入门——一个用于了解和学习Harmony0s的也用程序。',
    },
    {
      id: 8,
      name: 'Step8 环境的搭建',
      imgUrl: 'app.media.tutorial_pic8',
      description: '本简教程实现了快速入门——一个用于了解和学习Harmony0s的也用程序。',
    },
    {
      id: 9,
      name: 'Step9 环境的搭建',
      imgUrl: 'app.media.tutorial_pic9',
      description: '本简教程实现了快速入门——一个用于了解和学习Harmony0s的也用程序。',
    },
    {
      id: 10,
      name: 'Step10 环境的搭建',
      imgUrl: 'app.media.tutorial_pic10',
      description: '本简教程实现了快速入门——一个用于了解和学习Harmony0s的也用程序。',
    },
    {
      id: 11,
      name: 'Step11 环境的搭建',
      imgUrl: 'app.media.tutorial_pic11',
      description: '本简教程实现了快速入门——一个用于了解和学习Harmony0s的也用程序。',
    },
    {
      id: 12,
      name: 'Step13 环境的搭建',
      imgUrl: 'app.media.tutorial_pic12',
      description: '本简教程实现了快速入门——一个用于了解和学习Harmony0s的也用程序。',
    }
  ]

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
  // 创建一个页面栈对象并传入Navigation
  @Provide('NavPathStack') pageInfos: NavPathStack = new NavPathStack()

  aboutToAppear(): void {
    hilog.debug(0x0000, '组件生命周期-index', 'aboutToAppear')
    this.pageInfos.setInterception({
     willShow: (from: NavDestinationContext | "navBar", to: NavDestinationContext | "navBar",
       operation: NavigationOperation, animated: boolean) => {
       if (typeof to === "string") {
         hilog.debug(0x0000, '路由拦截from', "target page is navigation home page.")
         return;
       }
       // if (target.pathInfo.name === 'PageTwo') {
       //   target.pathStack.pop();
       //   target.pathStack.pushPathByName('PageOne', null);
       // }
       hilog.debug(0x0000, '路由拦截from', JSON.stringify(from))
       hilog.debug(0x0000, '路由拦截to', JSON.stringify(to.pathInfo.name))
       hilog.debug(0x0000, '路由拦截operation', JSON.stringify(operation))
     }
    })
  }

  onWillScroll(xOffset: number, yOffset: number, scrollState: ScrollState){
    console.log(xOffset.toString(), yOffset.toString(), scrollState)
  }
  onScrollEdge(side: Edge){
    console.info('To the edge', Edge[side])
  }
  build() {
    Navigation(this.pageInfos){
      Column(){
        TopNavigation({ title: this.title, back: this.backIcon })
        Button('hhhh').onClick(() => {
          this.pageInfos.pushPathByName('ComponentCommunication', null)
        })
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
          }
        }
        .scrollable(ScrollDirection.Vertical)
        .padding({ bottom: 50 })
        .onScrollEdge((side: Edge) => {
          console.log(Edge[side])
        })
      }
      .height('100%')
      .width('100%')
      .backgroundColor('#F1F3F5')
    }
    // .mode(NavigationMode.Auto)
    .toolbarConfiguration(this.tabbarList)
  }
}