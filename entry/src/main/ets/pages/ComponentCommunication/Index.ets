import { StatusManageV1 } from './StatusManageV1'
import { StatusManageV2 } from './StatusManageV2'
@Builder
export function CommunicationBuilder(){
  ComponentCommunication()
}

@Preview
@Component
struct ComponentCommunication{
  @Consume('NavPathStack') pageInfos: NavPathStack;

  build() {
    NavDestination(){
      StatusManageV1()
      StatusManageV2()
    }
    .title('组件通信')
  }
}