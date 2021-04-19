let proxyObj = {}
proxyObj['/ws'] = {
  ws: true,
  target: 'ws://127.0.0.1:8081'
};
proxyObj['/'] = {
//websocket
  ws: false,
//目标地址
  target: 'http://127.0.0.1:8081',
//发送请求头中host会设置成target
  changeOrigin: true,
//不重写请求地址
  pathRewrite: {
    '^/': '/'
  }
}
module.exports = {
  devServer: {
    host: '127.0.0.1',
    port: 8083,
    proxy: proxyObj
  }
}
