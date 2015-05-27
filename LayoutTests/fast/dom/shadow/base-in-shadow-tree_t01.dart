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

main() {
  document.body.setInnerHtml('''
    <div id="container"><a id="anchor-in-host-children" href="/">tehepero</a></div>
    <div><a id="anchor-outside-of-shadow" href="/">tehepero</a></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var container = document.getElementById('container');

  var shadowRoot = container.createShadowRoot();

  var base = document.createElement('base');
  base.setAttribute('href', 'http://www.example.com/');
  var anchorInShadow = document.createElement('a');
  anchorInShadow.setAttribute('href', '/');

  shadowRoot.append(base);
  shadowRoot.append(anchorInShadow);

  var anchorInHostChildren = document.getElementById('anchor-in-host-children');
  var anchorOutsideOfShadow = document.getElementById('anchor-outside-of-shadow');

  shouldBe(anchorInShadow.href.indexOf("http://www.example.com"), -1);
  shouldBe(anchorInHostChildren.href.indexOf("http://www.example.com"), -1);
  shouldBe(anchorOutsideOfShadow.href.indexOf("http://www.example.com"), -1);
}
