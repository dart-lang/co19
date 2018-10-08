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
  document.body.setInnerHtml('''
      <p>This adds and removes lots of input elements, to test the behavior of ListHashSet when it has more elements than will fit in its pool.</p>

      <p id="complete">IF YOU CAN SEE THIS, THE TEST DID NOT RUN.</p>

      <div id="a"></div><div id="b"></div><div id="c"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test() {
    var inputs = "";
    for (var i = 0; i != 500; ++i)
      inputs += "<input>";

    document.getElementById("a").innerHtml = inputs;
    document.getElementById("b").innerHtml = inputs;
    document.getElementById("a").innerHtml = "";
    document.getElementById("c").innerHtml = inputs;

    document.getElementById("a").innerHtml = "";
    document.getElementById("b").innerHtml = "";
    document.getElementById("c").innerHtml = "";

    document.getElementById("a").innerHtml = inputs;
    document.getElementById("b").innerHtml = inputs;
    document.getElementById("a").innerHtml = "";
    document.getElementById("c").innerHtml = inputs;

    document.getElementById("a").innerHtml = "";
    document.getElementById("b").innerHtml = "";
    document.getElementById("c").innerHtml = "";

    document.getElementById("a").innerHtml = inputs;
    document.getElementById("b").innerHtml = inputs;
    document.getElementById("a").innerHtml = "";
    document.getElementById("c").innerHtml = inputs;

    document.getElementById("complete").innerHtml = "The test was run. If it failed you would have seen an assertion failure or crash. "
      + "In some cases the crash won't occur until you move on to the next page.";
    document.getElementById("b").innerHtml = "";
    document.getElementById("c").innerHtml = "";
  }

  test();
}
