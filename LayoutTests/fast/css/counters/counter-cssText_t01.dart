/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test the cssText output of counter-valued CSSPrimitiveValues
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      body {
          counter-reset: section;
      }
      h1 {
          counter-increment: section;
      }
      h2:before {
          content: counter(section);
      }
      h2:after {
          content: counters(section, ":", decimal);
      }
      h3:before {
          content: counter(section, lower-roman);
      }
      h3:after {
          content: counters(section, ",", upper-roman);
      }
      h4:before {
          content: counter(section, none);
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  var rules = style.sheet.cssRules;
  shouldBeEqualToString(rules[2].style.cssText, "content: counter(section, decimal);");
  shouldBeEqualToString(rules[3].style.cssText, "content: counters(section, ':', decimal);");
  shouldBeEqualToString(rules[4].style.cssText, "content: counter(section, lower-roman);");
  shouldBeEqualToString(rules[5].style.cssText, "content: counters(section, ',', upper-roman);");
  shouldBeEqualToString(rules[6].style.cssText, "content: counter(section, none);");
}
