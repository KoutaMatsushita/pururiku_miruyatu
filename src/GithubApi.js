import key from '../secret/key.json'

export default class GithubApi {

  constructor(){
    this.endpoint = 'https://api.github.com'
  }

  fetchApi(url) {
    return fetch(`${this.endpoint}${url}?&access_token=${key.access_token}`,{
      mode: 'cors',
      headers: {
        'Accept': 'application/vnd.github.inertia-preview+json'
      }
    }).then((res) => {
      return res.json()
    })
  }

  getProject(repos) {
    const url = `/repos/nekojarashi/${repos}/projects`
    return this.fetchApi(url)
  }

  getColumns(projectId) {
    const url = `/projects/${projectId}/columns`
    return this.fetchApi(url)
  }

  getCards(columId) {
    const url = `/projects/columns/${columId}/cards`
    return this.fetchApi(url)
  }

  getIssue() {

  }

  getPullRequest(repos) {
    const url = `/repos/nekojarashi/${repos}/pulls`
    return this.fetchApi(url)
  }
}
