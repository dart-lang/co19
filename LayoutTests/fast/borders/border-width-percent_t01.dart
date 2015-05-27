/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests the border width property with percent values for
 * HTML elements.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <p></p>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  elementBorderWidth(_element, [borderValue, style=""])
  {
    var element = document.createElement(_element);
    if (borderValue != null)
      element.setAttribute("border", borderValue.toString());
    element.setAttribute("style", style);
    element.setAttribute("width", "0");
    document.body.append(element);
    var borderBoxWidth = element.offsetWidth;
    element.remove();
    return borderBoxWidth / 2;
  }

  inputElementBorderWidth(elementType, [borderValue, style=""])
  {
    var inputElement = document.createElement("input");
    inputElement.setAttribute("type", elementType);
    if (borderValue != null)
      inputElement.setAttribute("border", borderValue.toString());
    inputElement.setAttribute("style", style);
    inputElement.setAttribute("width", "0");
    document.body.append(inputElement);
    var borderBoxWidth = inputElement.offsetWidth;
    inputElement.remove();
    return borderBoxWidth / 2;
  }

  shouldBe(elementBorderWidth('img', '10%'), 10);
  shouldBe(elementBorderWidth('img', '-10%'), 0);
  shouldBe(elementBorderWidth('img', ' +10%'), 10);

  shouldBe(elementBorderWidth('img', 0, 'border-width: 10%'), 0);
  shouldBe(elementBorderWidth('img', 0, 'border-width: -10%'), 0);

  shouldBe(elementBorderWidth('object', '10%'), 10);
  shouldBe(elementBorderWidth('object', '-10%'), 0);
  shouldBe(elementBorderWidth('object', ' +10%'), 10);

  shouldBe(elementBorderWidth('object', 0, 'border-width: 10%'), 0);
  shouldBe(elementBorderWidth('object', 0, 'border-width: -10%'), 0);

  shouldBe(inputElementBorderWidth('image', '10%'), 10);
  shouldBe(inputElementBorderWidth('image', '-10%'), 0);
  shouldBe(inputElementBorderWidth('image', ' +10%'), 10);

  shouldBe(inputElementBorderWidth('image', 0, 'border-width: 10%'), 0);
  shouldBe(inputElementBorderWidth('image', 0, 'border-width: -10%'), 0);
}
