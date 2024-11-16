import { SwiperItem } from './SwiperItem'

@Component
export struct TopSwiper{
  @State bannerList: Resource[] = [
    $r('app.media.banner_pic0'),
    $r('app.media.banner_pic1'),
    $r('app.media.banner_pic2'),
    $r('app.media.banner_pic3'),
    $r('app.media.banner_pic4'),
    $r('app.media.banner_pic5'),
  ]
  build() {
    Swiper(){
      ForEach(this.bannerList, (item: Resource) => {
        SwiperItem({ img: item })
      }, (_: Resource, index: number) => index.toString())
    }
    .width('95%')
    .borderRadius(10)
  }
}