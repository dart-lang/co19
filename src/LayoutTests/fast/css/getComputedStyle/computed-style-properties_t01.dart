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
  var style = new Element.html('''
      <style>
      #test {
        width: 400px;
        margin: 10px;
      }
      #test > div {
        margin: 1ex;
      }
      #outline {
          outline: 2px solid red;
          outline-offset: 5px;
      }
      #content:before {
          content: 'text';
      }
      #content:after {
        content: 'test ' url(data:image/gif;base64,R0lGODlhAQABAJAAAP8AAAAAACwAAAAAAQABAAACAgQBADs=);
      }
      #counter {
          counter-reset: section;
      }
      #counter > div {
          counter-reset: subsection 0 anothercounter 5;
      }
      #counter > h1:before {
          counter-increment: section;
          content: counter(section) '. ';
      }
      #counter > div > h2:before {
          counter-increment: subsection;
          content: counter(section) '.' counter(subsection) '. ';
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="test">
          <div id="outline">outline</div>
          <div id="content">content</div>
          <div id="counter">
              counter
              <h1 id="counter1">Heading A</h1>
              <div id="subcounter">
                  <h2 id="subcounter1">Subheading A</h2>
                  <h2 id="subcounter2">Subheading B</h2>
              </div>
              <h1>Heading B</h1>
              </div>
          </div>
          <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());
  
  computedStyleFor(id, pseudo, property)
  {
    var element = document.getElementById(id);
    var style = getComputedStyle(element, pseudo);
    return style.getPropertyValue(property);
  }

  shouldBe(computedStyleFor('outline', null, 'outline-offset'), '5px');
  shouldBe(computedStyleFor('content', 'before', 'content'), 'text');
  shouldBe(computedStyleFor('content', 'after', 'content'), "'test ' url(data:image/gif;base64,R0lGODlhAQABAJAAAP8AAAAAACwAAAAAAQABAAACAgQBADs=)");
  shouldBe(computedStyleFor('counter', null, 'counter-reset'), 'section 0');
  var str = computedStyleFor('subcounter', null, 'counter-reset');
  shouldBe(str.indexOf('subsection 0') != -1, true);
  shouldBe(str.indexOf('anothercounter 5') != -1, true);
  shouldBe(computedStyleFor('counter1', 'before', 'counter-increment'), 'section 1');
  shouldBe(computedStyleFor('subcounter2', 'before', 'counter-increment'), 'subsection 1');
  shouldBe(computedStyleFor('subcounter2', 'before', 'content'), "counter(section) '.' counter(subsection) '. '");
}
