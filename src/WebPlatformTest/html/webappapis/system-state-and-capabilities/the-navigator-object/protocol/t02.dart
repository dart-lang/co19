/**
 * after web-platform-tests/html/webappapis/system-state-and-capabilities/the-navigator-object/protocol/002.xhtml
 * @assertion
 * @description isProtocolHandlerRegistered for protocol that is not yet accepted 
 */
import 'dart:html';
import "../../../../../Utils/expectWeb.dart";

void main() {
  var scheme = 'web+CustomProtocolTwo';
  var url = window.location.href.replaceAll(new RegExp(r"/\/[^\/]*$/"), "") + '/%s';
  print("url=$url");
  window.navigator.registerProtocolHandler(scheme, url, 'Ignore dialog or decline it');
  assert_equals(window.navigator.isProtocolHandlerRegistered(scheme, url), 'declined');
}
