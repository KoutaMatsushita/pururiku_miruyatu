export default class PullRequestDataCollection {

  constructor() {
    this.datas = []
  }

  update(data) {
    const index = this.getIndex(data)
    if (index >= 0) {
      this.datas[index] = data
    } else {
      this.datas.push(data)
    }
  }

  getIndex(data) {
    let res = -1
    this.datas.some((val, index) => {
      if (val.login === data.login) {
        res = index
        return true
      }
    })
    return res
  }

  findData(login) {
    let res = null
    this.datas.some((val) => {
      if (val.login === login) {
        res = val
        return true
      }
    })
    return res
  }
}
