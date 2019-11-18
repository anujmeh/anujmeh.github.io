window["comm100main"] = (function (filename) {
  window["Comm100API"] = window["Comm100API"] || {};
  var api = window["Comm100API"];
  api.call = function (name) {
    return (new Function('return ' + name)).call();
  };
  api.chat_buttons = api.chat_buttons || [];
  return function (main, standby, isStandby, bundleJsName) {
    if ([1000308, 1000325, 1000475, 1000476].indexOf(api.site_id) !== -1) {
      main = 'https://entchatserver7.comm100.com';
    }
    api.main = main;
    api.standby = standby;
    var host = isStandby ? standby : main;
    var src = host + '/js/' + (bundleJsName || filename);

    var iframe = document.createElement('iframe');
    iframe.style.display = 'none';
    iframe.title = 'code running environment';
    iframe.id = "comm100-iframe";
    document.body.appendChild(iframe);
    var innerDoc = iframe.contentDocument;
    innerDoc.open();
    innerDoc.write('<!doctype html><head><script src="' + src + '" async type="text/javascript" charset="utf-8"></script></head><body></body>');
    innerDoc.close();
  };
}('bundle.b22f2d9993d3b6c61127fc45f877b961.js'));
window.comm100main('https://enterprise.comm100.com/chatserver','https://appmax1.comm100.com/chatserver');delete window.comm100main;