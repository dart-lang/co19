/**
 * after web-platform-tests/html/webappapis/system-state-and-capabilities/the-navigator-object/protocol/005.xhtml
 * @assertion
 * @description Invalid characters in protocol scheme and isProtocolHandlerRegistered 
 */
import 'dart:html';
import "../../../../../Utils/expectWeb.dart";

void main() {
  var scheme = 'web+CústomPrótocolFíve';
  var url = window.location.href.replaceAll(new RegExp(r"/\/[^\/]*$/"), "") + '/%s';
  window.navigator.registerProtocolHandler(scheme, url, 'Ignore dialog or decline it');
  assert_equals(window.navigator.isProtocolHandlerRegistered(scheme, url), 'new');
}
