<task-view>
  <div each={ key in Object.keys(data.repos) } if={data.repos[key].work.length !== 0 || data.repos[key].review.length !== 0}>

    <h2>{ key.replace(/_/g,'-') }</h2>

    <!-- Work -->
    <h4 if={ data.repos[key].work.length !== 0 }>Work</h4>
    <ul>
      <li each={ data.repos[key].work }>
        <a href={ url }>{ title }</a>
      </li>
    </ul>

    <!-- Review -->
    <h4 if={ data.repos[key].review.length !== 0 }>Review</h4>
    <ul>
      <li each={ data.repos[key].review }>
        <a href={ url }>{ title }</a>
      </li>
    </ul>

  </div>

  <script>
    this.data = opts.data
    this.on('update', () => {
      this.data = opts.data
    })
  </script>
</task-view>
