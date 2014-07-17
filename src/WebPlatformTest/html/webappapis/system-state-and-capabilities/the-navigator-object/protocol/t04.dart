/**
 * after web-platform-tests/html/webappapis/system-state-and-capabilities/the-navigator-object/protocol/004.xhtml
 * @assertion
 * @description Non-matching url in isProtocolHandlerRegistered 
 */
import 'dart:html';
import "../../../../../Utils/expectWeb.dart";

void main() {
  var scheme = 'web+CustomProtocolFour';
  var url = window.location.href.replaceAll(new RegExp(r"/\/[^\/]*$/"), "") + '/%s';
  window.navigator.registerProtocolHandler(scheme, url, 'Ignore dialog');
  assert_equals(window.navigator.isProtocolHandlerRegistered(scheme, 'http://t/core/standards/registerhandler/%s'), 'new');
}
