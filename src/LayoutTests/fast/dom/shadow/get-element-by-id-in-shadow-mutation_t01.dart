/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests to ensure that ShadowRoot.getElementById works even after
 * mutation
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="host"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var host = document.getElementById("host");
  var shadow = host.createShadowRoot();

  shouldBe(shadow.getElementById('foo'), null);

  var e0a = document.createElement("div");
  e0a.id = "foo";
  shadow.append(e0a);
  shouldBe(shadow.getElementById('foo'), e0a);

  var e0b = document.createElement("span");
  e0b.id = "foo";
  shadow.insertBefore(e0b, e0a);
  shouldBe(shadow.getElementById('foo'), e0b);

  var e0c = document.createElement("p");
  e0c.id = "foo";
  var e0cParent = document.createElement("div");
  e0cParent.append(e0c);
  shadow.insertBefore(e0cParent, e0b);
  shouldBe(shadow.getElementById('foo'), e0c);

  e0cParent.remove();
  shouldBe(shadow.getElementById('foo'), e0b);
  e0b.remove();
  shouldBe(shadow.getElementById('foo'), e0a);
  e0a.remove();
  shouldBe(shadow.getElementById('foo'), null);
}
