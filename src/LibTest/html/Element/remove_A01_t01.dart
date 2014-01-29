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

main() {
  //-------
  var x = new Element.html('<span><div></div></span>');
  var div = x.firstChild;

  div.remove();
  Expect.isNull(x.firstChild, 'removal of the only child');

  //-------
  x = new Element.html('<span><div></div><pre></pre></span>');
  div = x.firstChild;

  div.remove();
  Expect.isTrue(x.firstChild is PreElement, 'removal of one of children');

  //-------
  x = new Element.html('<span><div><h1></h1></div><pre></pre></span>');
  div = x.firstChild;

  div.remove();
  Expect.isTrue(x.firstChild is PreElement, 'removal of subtree');
}
