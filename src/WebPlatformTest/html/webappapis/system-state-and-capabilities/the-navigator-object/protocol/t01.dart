/**
 * after web-platform-tests/html/webappapis/system-state-and-capabilities/the-navigator-object/protocol/001.xhtml
 * @assertion
 * @description isProtocolHandlerRegistered for new protocol 
 */
import 'dart:html';
import "../../../../../Utils/expectWeb.dart";

void main() {
  var dir_uri = window.location.href.replaceAll(new RegExp(r"/\/[^\/]*$/"), "");
  assert_equals(window.navigator.isProtocolHandlerRegistered('web+CustomProtocolOne', '$dir_uri/%s'), 'new');
}
