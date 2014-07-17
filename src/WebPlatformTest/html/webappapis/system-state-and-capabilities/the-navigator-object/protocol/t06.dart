/**
 * after web-platform-tests/html/webappapis/system-state-and-capabilities/the-navigator-object/protocol/006/xhtml
 * @assertion
 * @description Scheme outside white list and isProtocolHandlerRegistered 
 */
import 'dart:html';
import "../../../../../Utils/expectWeb.dart";

void main() {
  var dir_uri = window.location.href.replaceAll(new RegExp(r"/\/[^\/]*$/"), "");
  var scheme = 'http', url = '${dir_uri}/%s';
  window.navigator.registerProtocolHandler(scheme, url, 'Ignore dialog or decline it');
  assert_equals(window.navigator.isProtocolHandlerRegistered(scheme, url), 'new');
}
