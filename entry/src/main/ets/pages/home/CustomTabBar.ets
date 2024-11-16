@Component
export  struct CustomTabBar{
  @Link active: number;
  change: (index: number) => void = () => {}
  build() {
    Row(){
      Column(){
        Image(this.active === 0 ? $r("app.media.house_active") : $r('app.media.house'))
          .width(32)
          .height(32)
        Text('首页')
          .fontColor(this.active === 0 ? Color.Blue : Color.Gray)
      }
      .onClick(() => {
        if(this.active === 0) return
        this.active = 0;
        this.change(this.active)
      })
      Column(){
        Image(this.active === 1 ? $r('app.media.person_active') : $r('app.media.person'))
          .width(32)
          .height(32)
        Text('我的')
          .fontColor(this.active === 1 ? Color.Blue : Color.Gray)
      }
      .onClick(() => {
        if(this.active === 1) return
        this.active = 1;
        this.change(this.active)
      })
    }
    .width('100%')
    .height(64)
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.SpaceAround)
  }
}

interface Item{
  text: string;
  icon: Resource | null;
  activeIcon: Resource | null;
  active: boolean;
}
@Component
export struct CustomTabItem{
  @Prop item: Item;

  build() {
    Column(){
      Image(this.item.active ? this.item.activeIcon : this.item.icon)
        .width(32)
        .height(32)
      Text(this.item.text)
        .fontColor(this.item.active ? Color.Blue : Color.Gray)
    }
  }
}