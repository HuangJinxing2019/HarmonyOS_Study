interface Student{
  name: string;
  age: number;
}

@Component
export struct Child3{
  @Prop count: number;
  @Prop student: Student;

  setName: (name: string) => void = () => {};

  build() {
    Column(){
      Text('@State+@Observed')
      Row(){
        Text('Child3：')
          .fontSize(24)
          .fontWeight(700)
        Text(`姓名：${this.student.name}, 年龄：${this.student.age}`)
          .layoutWeight(1)
          .margin({ top: 10 })
          .fontSize(18)
      }
      Button('名字改为“李四”')
        .margin({ top: 10 })
        .onClick(() => {
          // this.student.name = '李四'
          this.setName('李四')
        })
    }
    .width(200)
    .height(120)
    .backgroundColor(Color.Pink)
    .alignItems(HorizontalAlign.Start)
  }
}