@ObservedV2
class Son{
  @Trace age: number;
  constructor(age: number) {
    this.age = age
  }
}
@ObservedV2
class Person{
  @Trace name: string = '张三';
  @Trace son: Son = new Son(18)
}

@ComponentV2
export struct StatusManageV2{
  @Local person: Person = new Person();
  @Local name: string = '张三'
  @Provider() count: number = 0;
  @Local count2: number = 0;

  @Computed
  get total(){
    return this.count2 + this.count
  }

  @Monitor('person.son.age', 'name')
  personChange(monitor: IMonitor){
    console.dir(monitor.dirty)
    console.dir(monitor.value())
    console.dir(monitor.value('person.son.age'))
    console.log(`${monitor.value()?.now}`)
  }

  build() {
    Column(){
      Text('statusManageV2')
      Text(`父组件展示 姓名：${this.name} 年龄：${this.person.son.age}`)
      Text(`count：${this.count}，count2: ${this.count2}，total：${this.total}`)
      Button('父组件改变年龄 +1')
        .onClick(() => {
          console.log('=====================')
          this.person.son.age += 1
        })
      Button('父组件改变名称')
        .onClick(() => {
          this.name = '李四'
        })
      Button('父组件改变count+1')
        .onClick(() => {
          this.count += 1
        })
      Button('父组件改变count2 +1')
        .onClick(() => {
          this.count2 += 1
        })
      Child({
        person: this.person,
        name: this.name,
        setName: (name: string) => {
          this.name = name;
        }
      })
    }
  }
}
@ComponentV2
struct Child{
  @Param person: Person | null = null;
  @Param name: string | '' = '';
  @Event setName: (name: string) => void = (name: string) => {}

  @Consumer() count: number = 0;

  build() {
    Column(){
      Text(`子组件展示：姓名：${this.name} 年龄：${this.person?.son.age}`)
      Text(`count：${this.count}`)
      if(this.person){
        Button('子组件改变年龄 +1')
          .onClick(() => {
            this.person!.son.age += 1
          })
        Button('子组件改变名称')
          .onClick(() => {
            this.setName('李四')
          })
        Button('子组件改变count +1')
          .onClick(() => {
            this.count += 1
          })
      }
    }
    .width(300)
    .height(200)
    .backgroundColor(Color.Pink)
    .padding(10)
  }
}