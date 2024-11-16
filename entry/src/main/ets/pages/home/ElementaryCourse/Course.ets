export interface CourseProp{
  id?: number;
  imgUrl: string;
  name: string;
  description: string;
}
@Component
export struct Course{
  @Prop imgUrl: string;
  @Prop name: string;
  @Prop description: string;

  build() {
    Row(){
      Column(){
        Text(this.name)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Text(this.description)
          .fontSize(12)
          .fontColor('#666')
          .margin({ top: 5 })
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      Image($r(this.imgUrl))
        .width(100)
        .height(80)
        .borderRadius(10)
    }
    .padding(10)
    .backgroundColor('#fff')
    .margin({ top: 10 })
    .borderRadius(10)
  }
}