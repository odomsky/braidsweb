(function () {
  var base = document.createElement('base');

  if (location.hostname.includes('github.io')) {
    base.href = '/braidsweb/';
  } else {
    base.href = './';
  }

  document.head.appendChild(base);
})();
