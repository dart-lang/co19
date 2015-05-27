/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for ShadowRoot JS APIs.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="console"></div>
    <!-- These elements should not be selected in ShadowRoot's querySelector. -->
    <div id="foo"></div>
    <div class="foo"></div>
    <foo></foo>
    <div>PASS</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  // (which is always enabled in testing).
  shouldBeDefined(ShadowRoot);
  shouldThrow(() => new ShadowRoot(document.createElement('div')));

  var shadowHost = document.createElement('div');
  document.body.append(shadowHost);
  var shadowRoot = shadowHost.createShadowRoot();

  shouldBeTrue(shadowRoot is ShadowRoot);

  var div1 = document.createElement("div");
  div1.setAttribute("id", "div1");
  shadowRoot.append(div1);

  var div2 = document.createElement("div");
  div2.setAttribute("id", "div2");
  div2.classes.add("class2");
  shadowRoot.append(div2);

  // Tests for Document should cover most cases for the following APIs.
  // We have basic tests here. More tests are welcome, but we should avoid unnecssary duplications.
  shouldBe(shadowRoot.getElementById('div1'), div1);
  shouldBeNull(shadowRoot.getElementById('foo'));

  shouldBeList(shadowRoot.getElementsByClassName('class2'), [div2]);
  shouldBeList(shadowRoot.getElementsByClassName('foo'), []);

  shouldBeList(shadowRoot.getElementsByTagName('div'), [div1, div2]);
  shouldBeList(shadowRoot.getElementsByTagName('foo'), []);

  // FIXME: Add more tests using XML documents.
  /* no getElementsByTagNameNS in dart */
  //shouldBeList(shadowRoot.getElementsByTagNameNS('*', 'div'), [div1, div2]);
  //shouldBeList(shadowRoot.getElementsByTagNameNS('', 'div'), []);
  //shouldBeList(shadowRoot.getElementsByTagNameNS('*', 'foo'), []);

  shouldBe(shadowRoot.querySelector('#div1'), div1);
  shouldBeNull(shadowRoot.querySelector('#foo'));
  shouldBe(shadowRoot.querySelector('.class2'), div2);
  shouldBeNull(shadowRoot.querySelector('.foo'));
  shouldBeList(shadowRoot.querySelectorAll('div'), [div1, div2]);
  shouldBeList(shadowRoot.querySelectorAll('foo'), []);

  var youngerShadowRoot = shadowHost.createShadowRoot();
  shouldNotBe(youngerShadowRoot, shadowRoot);
}
