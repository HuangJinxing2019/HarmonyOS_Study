import { Course, CourseProp } from './Course'
export { CourseProp }

@Component
export struct ElementaryCourse{
  @Prop courseList: CourseProp[]

  build() {
    Column(){
      Text('入门课程')
      ForEach(this.courseList, (item: CourseProp) => {
        Course(item)
      }, (item: CourseProp) => item.id?.toString())
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .padding({ left: 10, right: 10 })
  }
}