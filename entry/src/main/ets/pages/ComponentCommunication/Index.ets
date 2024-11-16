import { hilog } from '@kit.PerformanceAnalysisKit';
import { Theme } from '@ohos.arkui.theme';

@Builder
export function CommunicationBuilder(){
  ComponentCommunication()
}
@Preview
@Component
struct ComponentCommunication{
  @Consume('NavPathStack') pageInfos: NavPathStack;

  aboutToAppear(): void {
    hilog.debug(0x0000, '生命周期钩子', 'aboutToAppear')
    hilog.debug(0x0000, '生命周期钩子', JSON.stringify(this.pageInfos.getParamByName('ComponentCommunication')))
  }

  onDidBuild(): void {
    hilog.debug(0x0000, '生命周期钩子', 'onDidBuild')
  }

  aboutToDisappear(): void {
    hilog.debug(0x0000, '生命周期钩子', 'aboutToDisappear')
  }

  onWillApplyTheme(theme: Theme): void {
    hilog.debug(0x0000, '生命周期钩子', 'onWillApplyTheme')
    // hilog.debug(0x0000, '生命周期钩子', JSON.stringify(theme))
  }

  build() {
    NavDestination(){
      Column(){
        Text('组件通信')
      }
    }
    .title('组件通信')
  }
}