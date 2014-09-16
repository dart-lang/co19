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
