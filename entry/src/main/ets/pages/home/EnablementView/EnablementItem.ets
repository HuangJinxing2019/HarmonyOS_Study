export interface EnablementProp{
  id?: number;
  imgUrl: string;
  name: string;
  content: string;
  pageName?: string;
}
@Component
export struct EnablementItem{
  @Prop imgUrl: string;
  @Prop name: string;
  @Prop content: string;

  build() {
    Column(){
      Image($r(this.imgUrl))
        .width('100%')
        .height(100)
        .borderRadius({ topLeft: 10, topRight: 10 })
      Column(){
        Text(this.name)
          .fontSize(15)
        Text(this.content)
          .fontSize(13)
          .fontColor('#666666')
          .margin({ top: 5 })
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
      .padding({ top: 10, bottom: 10, left: 5, right: 10 })
    }
    .borderRadius(10)
    .width(160)
    .margin({ left: 10, top: 10  })
    .backgroundColor('#fff')
  }
}