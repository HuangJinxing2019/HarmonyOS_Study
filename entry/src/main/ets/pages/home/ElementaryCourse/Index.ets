import { Course, CourseProp } from './Course'
export { CourseProp }

@ComponentV2
export struct ElementaryCourse{
  @Param courseList: CourseProp[] = [];

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