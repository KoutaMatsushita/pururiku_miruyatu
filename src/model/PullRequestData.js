export default class PullRequestData {

  constructor(login, url) {
    this.login = login
    this.avatarUrl = url

    // 'nbs', 'nbs-windows', 'ms2-client-osx', 'nbs-ios', 'nbs-objc-sdk', 'nbs-android'
    this.repos = {
      nbs: {work: [], review: []},
      nbs_windows: {work: [], review: []},
      ms2_client_osx: {work: [], review: []},
      nbs_ios: {work: [], review: []},
      nbs_objc_sdk: {work: [], review: []},
      nbs_android: {work: [], review: []}
    }
  }

  addWork(title, url, repo) {
    repo = repo.replace(/-/g,'_')
    this.repos[repo].work.push({title: title, url: url})
  }

  addReview(title, url, repo) {
    repo = repo.replace(/-/g,'_')
    this.repos[repo].review.push({title: title, url: url})
  }
}
