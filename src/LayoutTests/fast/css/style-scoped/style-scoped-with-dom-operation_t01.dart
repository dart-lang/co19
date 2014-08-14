/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that <style scoped> is correctly applied after DOM
 * operations, i.e. insertBefore, append, and removeChild.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      span {
          background-color: green;     
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div>
        <div>
          <style id="existingStyle" scoped>
            .target { background-color: red; }
          </style>
          <span id="target" class="target">Hello, World!</span>
        </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var target = document.getElementById('target');

  var existingStyle = document.getElementById('existingStyle');
  var newStyle = document.createElement('style');
  
  newStyle.setAttribute('scoped', 'scoped');
  newStyle.append(new Text(".target { background-color: blue; }"));

  debug("Insert a new scoped style before an existing scoped style.");
  existingStyle.parentNode.insertBefore(newStyle, existingStyle);
  shouldBe(getComputedStyle(target).backgroundColor, 'rgb(255, 0, 0)');

  debug("Move an inserted scoped style after an existing scoped style.");
  existingStyle.parentNode.append(newStyle);
  shouldBe(getComputedStyle(target).backgroundColor, 'rgb(0, 0, 255)');

  debug("Move an inserted scoped style into grandparent of an existing scoped style.");
  document.body.children[0].append(newStyle);
  shouldBe(getComputedStyle(target).backgroundColor, 'rgb(255, 0, 0)');

  debug("Remove an inserted scoped style.");
  newStyle.remove();
  shouldBe(getComputedStyle(target).backgroundColor, 'rgb(255, 0, 0)');

  debug("Remove an existing scoped style.");
  existingStyle.remove();
  shouldBe(getComputedStyle(target).backgroundColor, 'rgb(0, 128, 0)');
}
