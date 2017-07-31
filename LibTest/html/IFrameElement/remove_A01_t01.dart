/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void remove()
 * Removes this node from the DOM
 * @description Checks expected dom after removal
 */
import "dart:html";
import "../../../Utils/expect.dart";

void printEl(String name, var x) {
  if (x is HtmlElement) {
    print("$name=${x.runtimeType} ${x.toString()} innerHtml=${x.innerHtml}");
  } else {
    print("$name=${x.runtimeType} ${x.toString()}");
  }
}

main() {
  IFrameElement x = new Element.html('<iframe>Content</iframe>');

  var y = x.firstChild;
  printEl("y", y);
  y.remove();
  Expect.isNull(x.firstChild, 'removal of the only child');

  //-------
  x = new Element.html('<iframe>Content</iframe>');
  x.insertBefore(new DivElement(), x.firstChild);
  var div = x.firstChild;
  div.remove();
  Expect.isTrue(x.firstChild is Text, 'removal of one of children');

  //-------
  x = new Element.html('<iframe>Content</iframe>');
  x.insertBefore(
      new Element.html('<iframe><div><h1></h1></div><pre></pre></iframe>'),
      x.firstChild);
  div = x.firstChild;

  div.remove();
  Expect.isTrue(x.firstChild is Text, 'removal of subtree');
}
