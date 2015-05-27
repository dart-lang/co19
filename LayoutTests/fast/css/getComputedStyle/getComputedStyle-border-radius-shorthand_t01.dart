/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test to make sure border-radius shorthand property returns
 * CSSValueList properly.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var testContainer = document.createElement("div");
  testContainer.contentEditable = 'true';
  document.body.append(testContainer);

  testContainer.innerHtml = '<div style="width:100px;height:100px"><div id="test">hello</div></div>';

  var e = document.getElementById('test');
  var computedStyle = getComputedStyle(e, null);

  checkComputedStyleValue() {
    var before = getComputedStyle(e, null).getPropertyValue('border-radius');
    e.style.background = 'none';
    e.style.background = before;
    return (getComputedStyle(e, null).getPropertyValue('border-radius') == before);
  }

  e.style.borderRadius = "4em";
  shouldBe(computedStyle.getPropertyValue('border-radius'), '64px');
  shouldBe(computedStyle.getPropertyValue('border-top-left-radius'), '64px');
  shouldBe(computedStyle.getPropertyValue('border-top-right-radius'), '64px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-right-radius'), '64px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-left-radius'), '64px');
  shouldBe(checkComputedStyleValue(), true);

  e.style.borderRadius = "2em 1em 4em / 0.5em 3em";
  shouldBe(computedStyle.getPropertyValue('border-radius'), '32px 16px 64px / 8px 48px');
  shouldBe(computedStyle.getPropertyValue('border-radius'), '32px 16px 64px / 8px 48px');
  shouldBe(computedStyle.getPropertyValue('border-top-left-radius'), '32px 8px');
  shouldBe(computedStyle.getPropertyValue('border-top-right-radius'), '16px 48px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-right-radius'), '64px 8px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-left-radius'), '16px 48px');
  shouldBe(checkComputedStyleValue(), true);

  e.style.borderRadius = "";
  e.style.borderTopLeftRadius = "4em";
  e.style.borderTopRightRadius = "4em";
  e.style.borderBottomLeftRadius = "4em";
  e.style.borderBottomRightRadius = "4em";
  shouldBe(computedStyle.getPropertyValue('border-radius'), '64px');
  shouldBe(computedStyle.getPropertyValue('border-top-left-radius'), '64px');
  shouldBe(computedStyle.getPropertyValue('border-top-right-radius'), '64px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-right-radius'), '64px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-left-radius'), '64px');
  shouldBe(checkComputedStyleValue(), true);

  e.style.borderRadius = "1px 2px";
  shouldBe(computedStyle.getPropertyValue('border-radius'), '1px 2px');
  shouldBe(computedStyle.getPropertyValue('border-top-left-radius'), '1px');
  shouldBe(computedStyle.getPropertyValue('border-top-right-radius'), '2px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-right-radius'), '1px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-left-radius'), '2px');
  shouldBe(checkComputedStyleValue(), true);

  e.style.borderRadius = "1px 2px 4px";
  shouldBe(computedStyle.getPropertyValue('border-radius'), '1px 2px 4px');
  shouldBe(computedStyle.getPropertyValue('border-top-left-radius'), '1px');
  shouldBe(computedStyle.getPropertyValue('border-top-right-radius'), '2px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-right-radius'), '4px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-left-radius'), '2px');
  shouldBe(checkComputedStyleValue(), true);

  e.style.borderRadius = "1px 2px 4px 6px";
  shouldBe(computedStyle.getPropertyValue('border-radius'), '1px 2px 4px 6px');
  shouldBe(computedStyle.getPropertyValue('border-top-left-radius'), '1px');
  shouldBe(computedStyle.getPropertyValue('border-top-right-radius'), '2px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-right-radius'), '4px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-left-radius'), '6px');
  shouldBe(checkComputedStyleValue(), true);

  e.style.borderRadius = "1px 2px 4px 6px / 4em";
  shouldBe(computedStyle.getPropertyValue('border-radius'), '1px 2px 4px 6px / 64px');
  shouldBe(computedStyle.getPropertyValue('border-top-left-radius'), '1px 64px');
  shouldBe(computedStyle.getPropertyValue('border-top-right-radius'), '2px 64px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-right-radius'), '4px 64px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-left-radius'), '6px 64px');
  shouldBe(checkComputedStyleValue(), true);

  e.style.borderRadius = "1px 2px 4px 6px / 4em 3px";
  shouldBe(computedStyle.getPropertyValue('border-radius'), '1px 2px 4px 6px / 64px 3px');
  shouldBe(computedStyle.getPropertyValue('border-top-left-radius'), '1px 64px');
  shouldBe(computedStyle.getPropertyValue('border-top-right-radius'), '2px 3px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-right-radius'), '4px 64px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-left-radius'), '6px 3px');
  shouldBe(checkComputedStyleValue(), true);

  e.style.borderRadius = "1px 2px 4px 6px / 4em 3px 7px";
  shouldBe(computedStyle.getPropertyValue('border-radius'), '1px 2px 4px 6px / 64px 3px 7px');
  shouldBe(computedStyle.getPropertyValue('border-top-left-radius'), '1px 64px');
  shouldBe(computedStyle.getPropertyValue('border-top-right-radius'), '2px 3px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-right-radius'), '4px 7px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-left-radius'), '6px 3px');
  shouldBe(checkComputedStyleValue(), true);

  e.style.borderRadius = "1px 2px 4px 6px / 4em 3px 7px 8px";
  shouldBe(computedStyle.getPropertyValue('border-radius'), '1px 2px 4px 6px / 64px 3px 7px 8px');
  shouldBe(computedStyle.getPropertyValue('border-top-left-radius'), '1px 64px');
  shouldBe(computedStyle.getPropertyValue('border-top-right-radius'), '2px 3px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-right-radius'), '4px 7px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-left-radius'), '6px 8px');
  shouldBe(checkComputedStyleValue(), true);

  e.style.borderRadius = "10px 20px 30px 40px / 15px 25px 35px 45px";
  shouldBe(computedStyle.getPropertyValue('border-radius'), '10px 20px 30px 40px / 15px 25px 35px 45px');
  shouldBe(computedStyle.getPropertyValue('border-top-left-radius'), '10px 15px');
  shouldBe(computedStyle.getPropertyValue('border-top-right-radius'), '20px 25px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-right-radius'), '30px 35px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-left-radius'), '40px 45px');
  shouldBe(checkComputedStyleValue(), true);

  e.style.borderRadius = "10px 20px 30px 40px / 10px 25px 35px 45px";
  shouldBe(computedStyle.getPropertyValue('border-radius'), '10px 20px 30px 40px / 10px 25px 35px 45px');
  shouldBe(computedStyle.getPropertyValue('border-top-left-radius'), '10px');
  shouldBe(computedStyle.getPropertyValue('border-top-right-radius'), '20px 25px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-right-radius'), '30px 35px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-left-radius'), '40px 45px');
  shouldBe(checkComputedStyleValue(), true);

  e.style.borderRadius = "10px 20px 30px 40px / 10px 20px 35px 45px";
  shouldBe(computedStyle.getPropertyValue('border-radius'), '10px 20px 30px 40px / 10px 20px 35px 45px');
  shouldBe(computedStyle.getPropertyValue('border-top-left-radius'), '10px');
  shouldBe(computedStyle.getPropertyValue('border-top-right-radius'), '20px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-right-radius'), '30px 35px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-left-radius'), '40px 45px');
  shouldBe(checkComputedStyleValue(), true);

  e.style.borderRadius = "10px 20px 30px 40px / 10px 20px 30px 45px";
  shouldBe(computedStyle.getPropertyValue('border-radius'), '10px 20px 30px 40px / 10px 20px 30px 45px');
  shouldBe(computedStyle.getPropertyValue('border-top-left-radius'), '10px');
  shouldBe(computedStyle.getPropertyValue('border-top-right-radius'), '20px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-right-radius'), '30px');
  shouldBe(computedStyle.getPropertyValue('border-bottom-left-radius'), '40px 45px');
  shouldBe(checkComputedStyleValue(), true);
}
