<app-tag>
  <h1>プルリク見るやつ</h1>
  <button ref="updateButton" onclick={ fetch }>更新</button>
  <pr-table data={ data }></pr-table>

  <script>
    import './pr-table.tag'
    import GithubApi from 'src/GithubApi.js'
    import PullRequestData from 'model/PullRequestData.js'
    import PullRequestDataCollection from 'model/PullRequestDataCollection.js'

    this.data = opts.data || null

    this.on('mount', () => {
      this.fetch(null)
    })

    this.fetch = async (e) => {
      this.refs.updateButton.disabled = true
      let _data = new PullRequestDataCollection()
      const api = new GithubApi()
      const repositories = ['nbs', 'nbs-windows', 'ms2-client-osx', 'nbs-ios', 'nbs-objc-sdk', 'nbs-android']
      for (let i = 0; i < repositories.length; i++) {
        const pulls = await api.getPullRequest(repositories[i])
        _data = this.generateData(_data, pulls, repositories[i])
      }

      this.refs.updateButton.disabled = false
      this.update({data: _data})
    }

    this.generateData = (_data, pulls, repo) => {
      pulls.forEach((val) => {
        val.assignees.forEach((_val) => {
          let prd = _data.findData(_val.login)
          if (prd === null) {
            prd = new PullRequestData(_val.login, _val.avatar_url)
          }
          prd.addWork(`#${val.number} ${val.title}`, val.html_url, repo)
          _data.update(prd)
        })

        val.requested_reviewers.forEach((_val) => {
          if (val.title.startsWith('[WIP]')) {
            // ignore WIP
            return
          }
          let prd = _data.findData(_val.login)
          if (prd === null) {
            prd = new PullRequestData(_val.login, _val.avatar_url)
          }
          prd.addReview(`#${val.number} ${val.title}`, val.html_url, repo)
          _data.update(prd)
        })
      })
      return _data
    }

  </script>
</app-tag>
