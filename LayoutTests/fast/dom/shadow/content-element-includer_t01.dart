/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests the correctness of includers of forwarded children.
 */
import "dart:html";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="container"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  includerFor(element) {
    var insertionPoints = element.getDestinationInsertionPoints();
    if (insertionPoints.length == 0)
      return null;
    return insertionPoints[insertionPoints.length - 1];
  }
  var container = document.getElementById("container");

  var shadowRoot = null;

  var elementWithoutShadow = document.createElement("div");
  container.append(elementWithoutShadow);
  var childOfElementWithoutShadow = document.createElement("span");
  elementWithoutShadow.append(childOfElementWithoutShadow);
  container.offsetLeft;
  shouldBe(includerFor(childOfElementWithoutShadow), null);

  var elementWithShadow = document.createElement("div");
  container.append(elementWithShadow);
  var shadowRootOfElementWithShadow = elementWithShadow.createShadowRoot();
  shadowRootOfElementWithShadow.append(document.createElement("div")); // Gives non-content child.
  var childOfElementWithShadow = document.createElement("span");
  elementWithShadow.append(childOfElementWithShadow);
  container.offsetLeft;
  shouldBe(includerFor(childOfElementWithShadow), null);

  var elementWithShadowContent = document.createElement("div");
  container.append(elementWithShadowContent);
  var shadowRootOfElementWithShadowContent = elementWithShadowContent.createShadowRoot();
  var shadowContentOfElementWithShadowContent = document.createElement('content');
  shadowRootOfElementWithShadowContent.append(shadowContentOfElementWithShadowContent);
  var childOfElementWithShadowContent = document.createElement("span");
  elementWithShadowContent.append(childOfElementWithShadowContent);
  container.offsetLeft;
  shouldBe(includerFor(childOfElementWithShadowContent), shadowContentOfElementWithShadowContent);

  //
  // Testing dynamic change
  //
  var movingChild = childOfElementWithShadowContent;

  // Removing
  movingChild.remove();
  shouldBe(includerFor(movingChild), null);

  // Moving to content-less tree
  elementWithShadow.append(movingChild);
  shouldBe(includerFor(movingChild), null);
  movingChild.remove();

  // Moving to another content-full tree
  var anotherElementWithShadowContent = document.createElement("div");
  container.append(anotherElementWithShadowContent);
  var anotherShadowRootOfElementWithShadowContent = anotherElementWithShadowContent.createShadowRoot();
  var anotherShadowContentOfElementWithShadowContent = document.createElement('content');
  anotherShadowRootOfElementWithShadowContent.append(anotherShadowContentOfElementWithShadowContent);

  anotherElementWithShadowContent.append(movingChild);
  container.offsetLeft;
  shouldBe(includerFor(movingChild), anotherShadowContentOfElementWithShadowContent);
}
