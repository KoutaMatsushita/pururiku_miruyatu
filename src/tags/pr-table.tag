<pr-table>
  <table if={ data !== undefined && data !== null && data.datas.length !== 0 }>
    <thead>
      <tr>
        <th>Reviewer</th>
        <th>PullRequest</th>
      </tr>
    </thead>
    <tbody>
      <tr each={ data in data.datas }>
        <td>
          <user-view data={ data }></user-view>
        </td>
        <td>
          <task-view data={ data }></task-view>
        </td>
      </tr>
    </tbody>
  </table>

  <style>
     table {
       margin-top: 10px;
     }
  </style>

  <script>
    import './user-view.tag'
    import './task-view.tag'

    this.on('update', () => {
      this.data = opts.data
    })
  </script>
</pr-table>
