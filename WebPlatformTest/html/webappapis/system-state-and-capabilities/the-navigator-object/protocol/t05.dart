/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
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
