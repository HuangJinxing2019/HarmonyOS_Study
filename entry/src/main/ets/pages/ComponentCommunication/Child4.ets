@Observed
class Child{
  name: string;
  constructor(name: string) {
    this.name = name;
  }
}

@Observed
class Student{
  name: string;
  age: number;
  child: Child;
  constructor(name: string, age: number, child: Child) {
    this.name = name;
    this.age = age;
    this.child = child
  }
}

@Component
export struct Child4{
  @Prop count: number;
  @ObjectLink student: Student;

  setName: (name: string) => void = () => {};

  build() {
    Column(){
      Text('@State+@Observed')
      Row(){
        Text('Child4：')
          .fontSize(24)
          .fontWeight(700)
        Text(`姓名：${this.student.child.name}, 年龄：${this.student.age}`)
          .layoutWeight(1)
          .margin({ top: 10 })
          .fontSize(18)
      }
      Button('名字改为“李四”')
        .margin({ top: 10 })
        .onClick(() => {
          // this.student.name = '赵六'
          this.student.child.name = '赵六'
          this.setName('李四')
        })
    }
    .width(200)
    .height(120)
    .backgroundColor(Color.Pink)
    .alignItems(HorizontalAlign.Start)
  }
}