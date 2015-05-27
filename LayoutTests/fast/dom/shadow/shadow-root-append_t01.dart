/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks that appending shadow root as a child does
 * not crash.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <pre id="console"></pre>
    <div id="container"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var div = document.createElement('div');
  var root = div.createShadowRoot();
  root.append(new Text('SS'));

  var container = document.getElementById('container');
  container.append(root);

  shouldBeNull(root.firstChild);
  shouldBe(container.firstChild.text, "SS");

  div = document.createElement('div');
  root = div.createShadowRoot();
  root.append(new Text('PA'));

  container.insertBefore(root, container.firstChild);

  shouldBeNull(root.firstChild);
  shouldBe(container.firstChild.text, "PA");
  shouldNotBe(container.firstChild, container.lastChild);
}

