/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
        p { background-color: red; width: 100px; height: 100px; }
        p:empty { display: none; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p id="test1"><a></a></p>
      <p></p>
      <p id="test2">&#09;</p>
      <p></p>
      <p id="test3"> </p>
      ''', treeSanitizer: new NullTreeSanitizer());

  allElementsHaveDisplayNone(elements)
  {
    var styles = "";
    for (var i = 0; i < elements.length; ++i)
      styles += getComputedStyle(elements[i], null).display + ",";
    return new RegExp('none').allMatches(styles).length == elements.length;
  }

  var elements = document.body.queryAll("p");
  for (var i = 0; i < elements.length; ++i) {
    var element = elements[i];
    if (element.id == '')
      continue;
    debug('initial-width (${element.id}) $i');
    shouldBe(element.offsetWidth, 100);
    element.text = "";
  }

  shouldBeTrue(allElementsHaveDisplayNone(elements));
}
