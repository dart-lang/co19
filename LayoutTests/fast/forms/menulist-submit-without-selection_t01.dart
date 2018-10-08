/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description A unselected option was submitted as fallback. This behavior
 * was removed by the change of webkit.org/b/35056.
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
    + '</select>'
    + '</form>';

  asyncStart();

  var query = window.location.search;
  if (query.indexOf('submitted=true') == -1) {
    SelectElement select = document.body.querySelector('select');
    select.selectedIndex = 0;
    FormElement form = document.body.querySelector('form');
    form.submit();
  } else {
    shouldBe(query.indexOf("select=Disabled"), -1);
    asyncEnd();
  }
}
