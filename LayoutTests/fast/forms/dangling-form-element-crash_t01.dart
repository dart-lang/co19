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
      <p>Checks dangling form associated elements doesn't cause crash. WebKit should not crash when this page is loaded.</p>
      ''', treeSanitizer: new NullTreeSanitizer());

  resetFormOwner() {
    gc();
    var form = document.createElement('form');
    form.id = 'foo';
    document.body.append(form);
    document.body.innerHtml += '<div>PASS</div>';
    asyncEnd();
  }

  test() {
    var div = document.createElement('div');
    var input = document.createElement('input');
    input.setAttribute('form', 'foo');
    div.append(input);
    setTimeout(resetFormOwner, 0);
  }

  asyncStart();
  test();
}
