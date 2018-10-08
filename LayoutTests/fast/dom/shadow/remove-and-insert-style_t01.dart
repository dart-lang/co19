/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for Issue: 246300: Styles in nested shadows are not 
 * recalculated correctly on insertion.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <!-- crbug.com/246300 -->
    <!-- #host shadow root -->
    <template id="t">
      <style>
        #host {
          height: 50px;
          width: 50px;
          background: lightgray;
        }
      </style>
      <div id="container"></div>
    </template>

    <!-- #container shadow root -->
    <template id="t2">
      <style>
        div {
          background: black;
          height: 40px;
          width: 40px;
        }
        #green {
          background: green;
        }
      </style>
      <div id="green"></div>
    </template>

    <div id="host"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var backgroundColor;

  shouldHaveBackgroundColor(element, bg)
  {
    backgroundColor = element.getComputedStyle().backgroundColor;
    shouldBeEqualToString(backgroundColor, bg);
  }

  var host = document.getElementById('host');
  TemplateElement t = document.getElementById('t');
  TemplateElement t2 = document.getElementById('t2');
  ShadowRoot sr = host.createShadowRoot();
  sr.append(t.content.clone(true));
  var container = sr.querySelector('#container');
  ShadowRoot sr2 = container.createShadowRoot();
  sr2.append(t2.content.clone(true));

  asyncStart();
  setTimeout(() {
    container.remove();
    sr.append(container);

    shouldHaveBackgroundColor(sr2.getElementById('green'), 'rgb(0, 128, 0)');
    asyncEnd();
  }, 0);
}
