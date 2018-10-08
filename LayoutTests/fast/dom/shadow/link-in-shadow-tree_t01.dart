/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests to ensure ShadowRoot.getElementById works after complex
 * DOM manipulation.
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
    <div id="container"><span id="in-host-children" class="kotori" href="/">tehepero</span></div>
    <div><span id="outside-of-shadow" class="kotori" href="/">tehepero</span></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  computedBackgroundColor(elem)
    => elem.getComputedStyle().backgroundColor;

  var container = document.getElementById('container');

  var shadowRoot = container.createShadowRoot();

  var link = document.createElement('link');
  link.setAttribute('rel', 'stylesheet');
  link.setAttribute('href', '$root/resources/link-in-shadow-style.css');

  var spanInShadow = document.createElement('span');
  spanInShadow.innerHtml = 'tehepero';
  spanInShadow.className = 'kotori';

  shadowRoot.append(link);
  shadowRoot.append(spanInShadow);
  shadowRoot.append(document.createElement('content'));

  var spanInHostChildren = document.getElementById('in-host-children');
  var spanOutsideOfShadow = document.getElementById('outside-of-shadow');

  asyncStart();
  window.onLoad.first.then((_) {
    shouldBe(computedBackgroundColor(spanInShadow), "rgba(0, 0, 0, 0)");
    shouldBe(computedBackgroundColor(spanInHostChildren), "rgba(0, 0, 0, 0)");
    shouldBe(computedBackgroundColor(spanOutsideOfShadow), "rgba(0, 0, 0, 0)");
    asyncEnd();
  });
}
