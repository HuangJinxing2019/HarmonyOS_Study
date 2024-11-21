import { EnablementItem,  EnablementProp} from './EnablementItem'
import { hilog } from '@kit.PerformanceAnalysisKit';

export { EnablementProp }

@ComponentV2
export struct EnablementView{
  @Param data: EnablementProp[] = [];

  @Consumer('NavPathStack') pageInfos: NavPathStack = new NavPathStack();
  @Event onWillScroll: (xOffset: number, yOffset: number, scrollState: ScrollState) => void = () => {}
  @Event onScrollEdge: (sid: Edge) => void = () => {}

  build() {
    Column(){
      Text('赋能套件')
        .margin({ left: 15 })
        .fontWeight(700)
        .fontFamily('HarmonyHeiTi-Bold')
      Scroll(){
        Row(){
          ForEach(this.data, (item: EnablementProp) => {
            EnablementItem(item)
              .onClick(() => {
                hilog.debug(0x0000, '生命周期钩子', JSON.stringify(item))
                this.pageInfos.pushPathByName('ComponentCommunication', JSON.stringify(item))
              })
          }, (item: EnablementProp) => item.id?.toString())
        }
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .padding({ right: 10 })
      .onWillScroll(this.onWillScroll)
      .onScrollEdge(this.onScrollEdge)
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
  }
}