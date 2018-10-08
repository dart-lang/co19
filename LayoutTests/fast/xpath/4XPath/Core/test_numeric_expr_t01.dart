/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Core/test_numeric_expr.html
 * @description 
 */
import "dart:html";
import "../../xpath-test-pre.dart";
import "test.dart";

void main() {
/*
     IEEE 754 says:
    
       +-double.infinity * +-double.infinity = +-double.infinity
       +-double.infinity * 0 = double.nan
    
       n div +-double.infinity = 0
       +-nonzero div 0 = +-double.infinity
       +-double.infinity div +-double.infinity = double.nan
       +-0 div +-0 = double.nan
    
       double.infinity + double.infinity = double.infinity
       double.infinity - double.infinity = double.nan
*/
    XPathEvaluator evaluator=new XPathEvaluator();

    shouldBe(evaluator.evaluate("-5 * 2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -10);
    shouldBe(evaluator.evaluate("-4 * -2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 8);
    shouldBe(evaluator.evaluate("0 * 2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 0);
    shouldBe(evaluator.evaluate("(1 div 0) * (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.infinity);
    shouldBe(evaluator.evaluate("(-1 div 0) * (-1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.infinity);
    shouldBe(evaluator.evaluate("(1 div 0) * (-1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -double.infinity);
    shouldBe(evaluator.evaluate("0 div 2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 0);
    shouldBe(evaluator.evaluate("-5 div 2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -2.5);
    shouldBe(evaluator.evaluate("-4 div -2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 2);
    shouldBe(evaluator.evaluate("0 div 0", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("1 div 0", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.infinity);
    shouldBe(evaluator.evaluate("-1 div 0", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -double.infinity);
    shouldBe(evaluator.evaluate("0 div (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 0);
    shouldBe(evaluator.evaluate("1 div (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 0);
    shouldBe(evaluator.evaluate("-1 div (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -0);
    shouldBe(evaluator.evaluate("0 div (-1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -0);
    shouldBe(evaluator.evaluate("1 div (-1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -0);
    shouldBe(evaluator.evaluate("-1 div (-1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 0);
    shouldBe(evaluator.evaluate("(1 div 0) div (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("(1 div 0) div (-1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("(-1 div 0) div (-1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("(-1 div 0) div (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("0 mod 2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 0);
    shouldBe(evaluator.evaluate("5 mod 2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 1);
    shouldBe(evaluator.evaluate("5 mod -2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 1);
    shouldBe(evaluator.evaluate("-5 mod 2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -1);
    shouldBe(evaluator.evaluate("-5 mod -2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -1);
    shouldBe(evaluator.evaluate("1 mod 0", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("0 mod 0", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("(0 div 0) mod 2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("2 mod (0 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("(1 div 0) mod 2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("(1 div 0) mod 0", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("(1 div 0) mod (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("42 mod (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 42);
    shouldBe(evaluator.evaluate("0.5 mod 2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 0.5);
    shouldBe(evaluator.evaluate("-0.5 mod 2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -0.5);
    shouldBe(evaluator.evaluate("2.5 mod 2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 0.5);
    shouldBe(evaluator.evaluate("-2.5 mod 2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -0.5);
    shouldBe(evaluator.evaluate("5 mod 3", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 2);
    shouldBe(evaluator.evaluate("5 mod -3", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 2);
    shouldBe(evaluator.evaluate("-5 mod 3", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -2);
    shouldBe(evaluator.evaluate("-5 mod -3", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -2);

    shouldBe(evaluator.evaluate("5 + 2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 7);
    shouldBe(evaluator.evaluate("3 + -2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 1);
    shouldBe(evaluator.evaluate("(1 div 0) + (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.infinity);
    shouldBe(evaluator.evaluate("5 - 2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 3);
    shouldBe(evaluator.evaluate("3 - -2", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 5);
    shouldBe(evaluator.evaluate("(1 div 0) - (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);

    shouldBe(evaluator.evaluate("- 5", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -5);
    shouldBe(evaluator.evaluate("- (- 2)", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 2);

    shouldBe(evaluator.evaluate("5 = 5", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 = -5", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("-5 = -5", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("0 = 0", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("(1 div 0) = (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("(-1 div 0) = (-1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 = (-1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 = number(\'double.nan\')", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("number(\'double.nan\') = number(\'double.nan\')", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 = @attr31", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("31 = @attr31", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);

    shouldBe(evaluator.evaluate("5 != 5", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 != -5", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("-5 != -5", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("0 != 0", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("(1 div 0) != (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("(-1 div 0) != (-1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 != (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 != number(\'double.nan\')", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("number(\'double.nan\') != number(\'double.nan\')", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 != @attr31", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("31 != @attr31", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);

    shouldBe(evaluator.evaluate("5 < 5", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 <= 5", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 > 5", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 >= 5", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 < -5", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 <= -5", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 > -5", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 >= -5", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 < 0", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 <= 0", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 > 0", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 >= 0", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 < (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 <= (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 > (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 >= (1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 < (-1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 <= (-1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 > (-1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 >= (-1 div 0)", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 < number(\'double.nan\')", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 <= number(\'double.nan\')", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 > number(\'double.nan\')", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 >= number(\'double.nan\')", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 < @attr31", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 <= @attr31", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 > @attr31", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 >= @attr31", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);

    shouldBe(evaluator.evaluate("\'-5\' * \'2\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -10);
    shouldBe(evaluator.evaluate("\'-4\' * \'-2\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 8);
    shouldBe(evaluator.evaluate("\'0\' * \'2\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 0);
    shouldBe(evaluator.evaluate("\'1\' * \'1\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 1);
    shouldBe(evaluator.evaluate("\'3.1415926535\' * \'1\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 3.1415926535);
    shouldBe(evaluator.evaluate("\'\' * \'1\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("\'Hi\' * \'1\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("\'double.nan\' * \'1\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("\'\u2022 = middle dot\' * \'1\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("\'0\' div \'2\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 0);
    shouldBe(evaluator.evaluate("\'1\' div \'1\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 1);
    shouldBe(evaluator.evaluate("\'-5\' div \'2\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -2.5);
    shouldBe(evaluator.evaluate("\'-4\' div \'-2\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 2);
    shouldBe(evaluator.evaluate("\'0\' div \'0\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.nan);
    shouldBe(evaluator.evaluate("\'1\' div \'0\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, double.infinity);
    shouldBe(evaluator.evaluate("\'-1\' div \'0\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -double.infinity);
    shouldBe(evaluator.evaluate("\'0\' mod \'2\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 0);
    shouldBe(evaluator.evaluate("\'5\' mod \'2\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 1);
    shouldBe(evaluator.evaluate("\'5\' mod \'-2\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 1);
    shouldBe(evaluator.evaluate("\'-5\' mod \'2\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -1);
    shouldBe(evaluator.evaluate("\'-5\' mod \'-2\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -1);

    shouldBe(evaluator.evaluate("\'5\' + \'2\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 7);
    shouldBe(evaluator.evaluate("\'3\' + \'-2\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 1);
    shouldBe(evaluator.evaluate("\'5\' - \'2\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 3);
    shouldBe(evaluator.evaluate("\'3\' - \'-2\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 5);

    shouldBe(evaluator.evaluate("-\'5\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, -5);
    shouldBe(evaluator.evaluate("-\'-2\'", CHILD1, null, XPathResult.ANY_TYPE, null).numberValue, 2);

    shouldBe(evaluator.evaluate("\'5\' = \'5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("\'5\' = \'-5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'-5\' = \'-5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("\'0\' = \'0\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("\'Hi\' = \'Hi\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("\'5\' = \'Hi\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'5\' = \'double.nan\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'double.nan\' = \'double.nan\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("\'5\' = @attr31", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'31\' = @attr31", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);

    shouldBe(evaluator.evaluate("\'5\' != \'5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'5\' != \'-5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("\'-5\' != \'-5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'0\' != \'0\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'5\' != \'Hi\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("\'5\' != number(\'double.nan\')", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("\'double.nan\' != \'double.nan\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'5\' != @attr31", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("\'31\' != @attr31", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);

    shouldBe(evaluator.evaluate("5 < \'5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("31 < \'5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'5\' < \'5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'31\' < \'5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 <= \'5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("31 <= \'5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'5\' <= \'5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("\'31\' <= \'5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 > \'5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("31 > \'5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("\'5\' > \'5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'31\' > \'5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("5 < \'-5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("31 < \'-5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'5\' < \'-5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'31\' < \'-5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 <= \'-5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("31 <= \'-5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'5\' <= \'-5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'31\' <= \'-5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("5 > \'-5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("31 > \'-5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("\'5\' > \'-5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("\'31\' > \'-5\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("\'5\' < \'Hi\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'5\' <= \'Hi\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'5\' > \'Hi\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'5\' >= \'Hi\'", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'5\' < @attr31", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("\'5\' <= @attr31", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, true);
    shouldBe(evaluator.evaluate("\'5\' > @attr31", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
    shouldBe(evaluator.evaluate("\'5\' >= @attr31", CHILD1, null, XPathResult.ANY_TYPE, null).booleanValue, false);
 
    checkTestFailures();    
}