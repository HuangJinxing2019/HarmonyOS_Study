@ObservedV2
export class TabBarItem {
  @Trace text: string = '';
  @Trace icon: Resource | null = null;
  @Trace activeIcon: Resource | null = null;
  @Trace active: boolean = false;
  constructor(text?: string, icon?: Resource, activeIcon?: Resource, active?: boolean) {
    this.text = text || ''
    this.icon = icon || null
    this.activeIcon = activeIcon || null
    this.active = active || false
  }
}

@ComponentV2
export struct CustomTabItem{
  @Param item: TabBarItem = new TabBarItem();
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