/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for Bug 34529 - [CSSOM] issues with cssText and selectorText
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic style = new Element.html(r'''
      <style type="text/css">
      /* Control characters */
      .\01_class {
          color:green;
      }
      .\1f_class {
          color:green;
      }
      .\30_class {
          color:green;
      }
      .\39_class {
          color:green;
      }
      /* Characters following '-' */
      .-\30_class {
          color:green;
      }
      .-\39_class {
          color:green;
      }
      .-\2d_class {
          color:green;
      }
      /* non-ASCII characters */
      .\81_class {
          color:green;
      }
      /* unicode characters */
      .日本語_class {
          color:green;
      }
      /* unicode supplementary characters (surrogate pairs) */
      .𐐀_class {
          color:green;
      }
      /* plain characters */
      .azAZ09_-_class {
          color:green;
      }
      .\(\/\:\@\[\~_class {
          color:green;
      }
      /* ID */
      #a\.external\:visited {
          color:green;
      }
      /* String */
      li[myattr="my\"value\\"] {
          color:green;
      }

      li {
          color:red;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml(r'''
      <p id="description"></p>

      List items must be green. Otherwise some selectors are invalid.
      <ul>
      <li class="&#001;_class">class="&amp;#001;_class"</li>
      <li class="&#031;_class">class="&amp;#031;_class"</li>
      <li class="0_class">class="0_class"</li>
      <li class="9_class">class="9_class"</li>
      <li class="-0_class">class="-0_class"</li>
      <li class="-9_class">class="-9_class"</li>
      <li class="--_class">class="--_class"</li>
      <li class="&#129;_class">class="&amp;#129;_class"</li>
      <li class="日本語_class">class="日本語_class"</li>
      <li class="&#66560;_class">class="&#66560;_class"</li>
      <li class="azAZ09_-_class">class="azAZ09_-_class"</li>
      <li class="(/:@[~_class">class="(/:@[~_class"</li>
      <li id="a.external:visited">id="a.external:visited"</li>
      <li myattr="my&#034;value&#092;">myattr="my&#034;value&#092;"</li>
      </ul>

      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var expectedTexts = [
    ".\\1 _class",
    ".\\1f _class",
    ".\\30 _class",
    ".\\39 _class",
    ".-\\30 _class",
    ".-\\39 _class",
    ".--_class",
    ".\x81_class",
    ".日本語_class",
    ".𐐀_class",
    ".azAZ09_-_class",
    ".\\(\\/\\:\\@\\[\\~_class",
    "#a\\.external\\:visited",
    'li[myattr="my\\"value\\\\"]'
  ];

  var rules = style.sheet.cssRules;
  for (var i = 0; i < expectedTexts.length; i++) {
    debug('test #$i');
    shouldBe(rules[i].selectorText, expectedTexts[i]);
    shouldBe(rules[i].cssText, expectedTexts[i] + ' { color: green; }');
  }
}
