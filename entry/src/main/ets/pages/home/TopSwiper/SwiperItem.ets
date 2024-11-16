@Component
export struct SwiperItem{
  @Prop img: Resource;
  build() {
    Image(this.img)
  }
}