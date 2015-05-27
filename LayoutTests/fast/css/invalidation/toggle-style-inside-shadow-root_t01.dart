/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var div = document.querySelector('div');
  var root = div.createShadowRoot();
  root.innerHtml = '<style> .red { background: red; }</style><div>tap to toggle red</div>';
  var rootDiv = root.querySelector('div');
  rootDiv.offsetHeight;

  rootDiv.classes.toggle('red');
  shouldBe(getComputedStyle(rootDiv).backgroundColor, 'rgb(255, 0, 0)');

  rootDiv.offsetHeight;
  rootDiv.classes.toggle('red');
  shouldBe(getComputedStyle(rootDiv).backgroundColor, 'rgba(0, 0, 0, 0)');
}
