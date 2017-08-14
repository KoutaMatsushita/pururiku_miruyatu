<user-view>
  <img src={ data.avatarUrl }/>
  <span>{ data.login }</span>

  <style>
    span {
      margin-left: 10px;
    }
    img {
      height: 50px;
      width: 50px;
      vertical-align: middle;
    }
  </style>

  <script>
    this.data = opts.data
    this.on('update', () => {
      this.data = opts.data
    })
  </script>
</user-view>
