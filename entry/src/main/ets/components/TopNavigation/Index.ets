@Component
export  struct TopNavigation {
  @Prop title: string = '';
  @Prop back: boolean = true;
  // 顶部问题
  @Builder textTitle(){
    Text(this.title)
      .fontSize(24)
      .fontWeight(700)
      .width('100%')
      .padding({ left: 16 })
      .fontFamily('HarmonyHeiTi-Bold')
  }

  @Builder iconLeft(){
    Image($r('app.media.chevron_left'))
      .width(24)
      .height(24)
  }

  build() {
    Row(){
      if(this.back) {
        this.iconLeft()
      }
      this.textTitle();
    }
    .height(44)
  }
}