/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <p>Test formmethod attribute</p>

      <form id=f1 method="post">
      <input type="submit" value="Submit" id="ip1">
      <input type="submit" formmethod="" value="Submit" id="ip2">
      <input type="submit" formmethod="post" value="Submit" id="ip3">
      <input type="submit" formmethod="get" value="Submit" id="ip4">
      <input type="submit" formmethod="foo" value="Submit" id="ip5">
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  var form1 = document.getElementById('f1');

  debug('Missing value');
  var ip1 = document.getElementById('ip1');
  shouldBeEqualToString(ip1.formMethod, "");
  shouldBeNull(ip1.getAttribute('formmethod'));
  debug('');

  debug('Empty value');
  var ip2 = document.getElementById('ip2');
  shouldBeEqualToString(ip2.formMethod, "get");
  shouldBeEqualToString(ip2.getAttribute('formmethod'), "");
  debug('');

  debug('Post value');
  var ip3 = document.getElementById('ip3');
  shouldBeEqualToString(ip3.formMethod, "post");
  shouldBeEqualToString(ip3.getAttribute('formmethod'), "post");
  debug('');

  debug('Get value');
  var ip4 = document.getElementById('ip4');
  shouldBeEqualToString(ip4.formMethod, "get");
  shouldBeEqualToString(ip4.getAttribute('formmethod'), "get");
  debug('');

  debug('Invalid value');
  var ip5 = document.getElementById('ip5');
  shouldBeEqualToString(ip5.formMethod, "get");
  shouldBeEqualToString(ip5.getAttribute('formmethod'), "foo");
}
