import { hilog } from '@kit.PerformanceAnalysisKit';

export function setInterception(navPathStack: NavPathStack){
  navPathStack.setInterception({
    willShow: (from: NavDestinationContext | "navBar", to: NavDestinationContext | "navBar",
      operation: NavigationOperation, animated: boolean) => {
      if (typeof to === "string") {
        hilog.debug(0x0000, '路由拦截from', "target page is navigation home page.")
        return;
      }
      // if (target.pathInfo.name === 'PageTwo') {
      //   target.pathStack.pop();
      //   target.pathStack.pushPathByName('PageOne', null);
      // }
      hilog.debug(0x0000, '路由拦截from', JSON.stringify(from))
      hilog.debug(0x0000, '路由拦截to', JSON.stringify(to.pathInfo.name))
      hilog.debug(0x0000, '路由拦截operation', JSON.stringify(operation))
    }
  })
}