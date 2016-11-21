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

  FormElement form1 = document.getElementById('f1') as FormElement;

  debug('Missing value');
  InputElement ip1 = document.getElementById('ip1') as InputElement;
  shouldBeEqualToString(ip1.formMethod, "");
  shouldBeNull(ip1.getAttribute('formmethod'));
  debug('');

  debug('Empty value');
  InputElement ip2 = document.getElementById('ip2') as InputElement;
  shouldBeEqualToString(ip2.formMethod, "get");
  shouldBeEqualToString(ip2.getAttribute('formmethod'), "");
  debug('');

  debug('Post value');
  InputElement ip3 = document.getElementById('ip3') as InputElement;
  shouldBeEqualToString(ip3.formMethod, "post");
  shouldBeEqualToString(ip3.getAttribute('formmethod'), "post");
  debug('');

  debug('Get value');
  InputElement ip4 = document.getElementById('ip4') as InputElement;
  shouldBeEqualToString(ip4.formMethod, "get");
  shouldBeEqualToString(ip4.getAttribute('formmethod'), "get");
  debug('');

  debug('Invalid value');
  InputElement ip5 = document.getElementById('ip5') as InputElement;
  shouldBeEqualToString(ip5.formMethod, "get");
  shouldBeEqualToString(ip5.getAttribute('formmethod'), "foo");
}
