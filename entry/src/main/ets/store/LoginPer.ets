import { PersistenceV2 } from '@kit.ArkUI'

class LoginInfo{
  token: string = 'dfasfasdfasd';
  setToken(token: string){
    this.token = token;
  }
}

type Remove = () => void
type Save = () => void

export interface LoginPre{
  value: LoginInfo;
  remove: Remove;
  save: Save;
}

export function useLoginPre(): LoginPre{
  const login: LoginInfo = PersistenceV2.connect(LoginInfo, () => new LoginInfo())!
  const remove: Remove = () => {
    PersistenceV2.remove(LoginInfo)
  }
  const save: Remove = () => {
    PersistenceV2.save(LoginInfo)
  }
  return {
    value: login,
    remove,
    save,
  }
}