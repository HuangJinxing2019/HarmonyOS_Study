import { TopNavigation } from "../../components/TopNavigation/Index";
import { courseList, enablementList } from "./data.home";
import { CourseProp } from "./ElementaryCourse/Course";
import { ElementaryCourse } from "./ElementaryCourse/Index";
import { EnablementProp } from "./EnablementView/EnablementItem";
import { EnablementView } from "./EnablementView/Index";
import { TopSwiper } from "./TopSwiper/Index";
import { hilog } from "@kit.PerformanceAnalysisKit";

@Component
export struct Home{
  @State title: string = '快速入门';
  @State backIcon: boolean = false;
  @State enablementList: EnablementProp[] = enablementList
  @State courseList: CourseProp[] = courseList


  aboutToAppear(): void {
    hilog.debug(0x0000, '组件生命周期-Home', 'aboutToAppear')
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