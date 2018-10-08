/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check that a select control does not produce a form value if
 * the selected option element is disabled.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var parent = document.createElement('div');
  document.body.append(parent);
  parent.innerHtml = '<form action="">'
    + '<input type=hidden name="submitted" value="true">'
    + '<select name="select">'
    + '<option disabled>Disabled</option>'
    + '<option>Enabled</option>'
    + '</select>'
    + '</form>';

  asyncStart();

  String query = window.location.search;
  if (query.indexOf('submitted=true') == -1) {
    SelectElement select = document.getElementsByTagName('select')[0] as SelectElement;
    select.selectedIndex = 0;
    FormElement form = document.body.querySelector('form') as FormElement;
    form.submit();
  } else {
    shouldBe(query.indexOf("select=Disabled"), -1);
    shouldBe(query.indexOf("select=Enabled"), -1);
    asyncEnd();
  }
}
