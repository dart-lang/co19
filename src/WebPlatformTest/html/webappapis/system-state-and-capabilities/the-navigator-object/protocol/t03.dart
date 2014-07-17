/**
 * after web-platform-tests/html/webappapis/system-state-and-capabilities/the-navigator-object/protocol/003.xhtml
 * @assertion
 * @description Protocol case insensitivity in isProtocolHandlerRegistered 
 */
import 'dart:html';
import "../../../../../Utils/expectWeb.dart";

void main() {
  var scheme = 'web+CustomProtocolTree';
  var url = window.location.href.replaceAll(new RegExp(r"/\/[^\/]*$/"), "") + '/%s';
  window.navigator.registerProtocolHandler(scheme, url, 'Ignore dialog or decline it');
  assert_equals(window.navigator.isProtocolHandlerRegistered(scheme.toUpperCase(), url), 'declined');
}
