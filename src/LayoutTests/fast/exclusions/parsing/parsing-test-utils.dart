library parsing_test_utils;

import "dart:html";
import "../../../testcommon.dart";

getCSSText(property, value)
{
  var element = document.createElement("div");
  element.style.cssText = property + ": " + value;
  return element.style.getPropertyValue(property);
}

getComputedStyleValue(property, value)
{
  var element = document.createElement("div");
  document.body.append(element);
  element.style.setProperty(property, value);
  var computedValue = getComputedStyle(element).getPropertyValue(property);
  element.remove();
  return computedValue;
}

class ParentAndChild {
  var parent;
  var child;
  ParentAndChild({parent, child}) {
    this.parent = parent;
    this.child = child;
  }
}

getParentAndChildComputedStyles(property, parentValue, childValue)
{
  var parentElement = document.createElement("div");
  document.body.append(parentElement);
  parentElement.style.setProperty(property, parentValue);
  var childElement = document.createElement("div");
  parentElement.append(childElement);
  childElement.style.setProperty(property, childValue);
  var parentComputedValue = getComputedStyle(parentElement).getPropertyValue(property);
  var childComputedValue = getComputedStyle(childElement).getPropertyValue(property);
  childElement.remove();
  parentElement.remove();
  return new ParentAndChild(parent: parentComputedValue, child: childComputedValue);
}

getParentAndChildComputedStylesString(property, parentValue, childValue)
{
  var styles = getParentAndChildComputedStyles(property, parentValue, childValue);
  return "parent: " + styles.parent + ", child: " + styles.child;
}

getChildComputedStyle(property, parentValue, childValue)
{
  var styles = getParentAndChildComputedStyles(property, parentValue, childValue);
  return styles.child;
}

testExclusionSpecifiedProperty(property, value, expectedValue)
{
  shouldBeEqualToString(getCSSText(property, value), expectedValue);
}

testExclusionComputedProperty(property, value, expectedValue)
{
  shouldBeEqualToString(getComputedStyleValue(property, value), expectedValue);
}

testNotInheritedExclusionChildProperty(property, parentValue, childValue, expectedChildValue)
{
  shouldBeEqualToString(getChildComputedStyle(property, parentValue, childValue), expectedChildValue);
}

testNotInheritedExclusionProperty(property, parentValue, childValue, expectedValue)
{
  shouldBeEqualToString(getParentAndChildComputedStylesString(property, parentValue, childValue), expectedValue);
}

applyToEachArglist(testFunction, arglists)
{
  arglists.forEach((arglist) {
    debug('Calling $testFunction with args: $arglist');
    Function.apply(testFunction, arglist);
  });
}
