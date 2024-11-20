import { Child1 } from './Child1'
import { Child2 } from './Child2'

@Observed
class Child{
  name: string;
  constructor(name: string) {
    this.name = name;
  }
}

@Observed
class Student{
  age: number;
  child: Child;
  constructor(age: number , child: Child) {
    this.age = age;
    this.child = child
  }
}

@Component
struct TestCom{
  @ObjectLink child: Child
  build() {
    Text(this.child.name)
      .onClick(() => {
        this.child.name = '00000'
      })
  }
}
@Component
struct TestCom2{
  @Prop child: Child
  build() {
    Text(this.child.name)
  }
}

@Component
export struct StatusManageV1 {
  @State count: number = 0;
  @State student: Student = new Student(18, new Child('王五'));

  add(num: number){
    this.count += num
  }
  setName(name: string){
    this.student.child.name = name
  }

  build() {
    Stack(){
      Column(){
        Text('@State')
        Row(){
          Text('Parent：')
            .fontSize(24)
            .fontWeight(700)
          Text(this.count?.toString())
            .margin({ top: 10 })
            .fontSize(18)
        }
        Row(){
          Child1({ count: this.count, add: this.add })
          Child2({ count: this.count, add: this.add })
        }
        Text(this.student.age.toString())
        TestCom({ child: this.student.child })
        TestCom2({ child: this.student.child })
        Button('修改名称')
          .onClick(() => {
            this.student.age = 24
            this.student.child.name = '赵六'
          })
      }
      .alignItems(HorizontalAlign.Start)
      .width('100%')
      .height(300)
      .backgroundColor(Color.Orange)
      .padding(10)
    }
  }
}