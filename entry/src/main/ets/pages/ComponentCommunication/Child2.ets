@Component
export struct Child2{
  @Prop count: number;
  add: (num: number) => void = () => {};

  build() {
    Column(){
      Text('@Prop')
      Row(){
        Text('Child2：')
          .fontSize(24)
          .fontWeight(700)
        Text(this.count?.toString())
          .margin({ top: 10 })
          .fontSize(18)
      }
      Button('调用父组件方法+1')
        .margin({ top: 10 })
        .onClick(() => {
          this.add(1)
        })
    }
    .width(200)
    .height(100)
    .backgroundColor(Color.Pink)
    .alignItems(HorizontalAlign.Start)
  }
}