/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test dynamically changing sibling rule matches in ShadowRoots
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="sandbox"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var sandbox = document.getElementById("sandbox");

  cleanUp() {
    sandbox.innerHtml = "";
  }

  debug("Dynamically change the :first-child");
  var host = sandbox.append(document.createElement("div"));
  var root = host.createShadowRoot();
  root.innerHtml = "<span>Black</span><style>:first-child { color: red; }</style>";
  document.body.offsetTop;
  var second = firstElementChild(root);
  var first = root.insertBefore(document.createElement("span"), second);
  first.text = "Red";
  shouldBeEqualToString(first.getComputedStyle().color, "rgb(255, 0, 0)");
  shouldBeEqualToString(second.getComputedStyle().color, "rgb(0, 0, 0)");

  cleanUp();

  debug("Dynamically change the :last-child");
  host = sandbox.append(document.createElement("div"));
  root = host.createShadowRoot();
  root.innerHtml = "<style>:last-child { color: red; }</style><span>Black</span>";
  document.body.offsetTop;
  var secondToLast = lastElementChild(root);
  var last = root.append(document.createElement("span"));
  last.text = "Red";
  shouldBeEqualToString(last.getComputedStyle().color, "rgb(255, 0, 0)");
  shouldBeEqualToString(secondToLast.getComputedStyle().color, "rgb(0, 0, 0)");

  cleanUp();

  debug("Dynamically change what a + combinator matches");
  host = sandbox.append(document.createElement("div"));
  root = host.createShadowRoot();
  root.innerHtml = "<div></div><span>Black</span><style>div + span { color: red; }</style>";
  document.body.offsetTop;
  var div = firstElementChild(root);
  var span = div.nextElementSibling;
  div.remove();
  shouldBeEqualToString(span.getComputedStyle().color, "rgb(0, 0, 0)");

  cleanUp();

  debug("Dynamically change what a ~ combinator matches");
  host = sandbox.append(document.createElement("div"));
  root = host.createShadowRoot();
  root.innerHtml = "<div></div><span>Black</span><style>div ~ span { color: red; }</style>";
  document.body.offsetTop;
  div = firstElementChild(root);
  span = div.nextElementSibling;
  div.remove();
  shouldBeEqualToString(span.getComputedStyle().color, "rgb(0, 0, 0)");

  cleanUp();
}
