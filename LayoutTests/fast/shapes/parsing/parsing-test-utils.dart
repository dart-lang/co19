library parsing_test_utils;

import "../../../testharness.dart";


// Valid values for both shape-inside and shape-outside. Two values are specified when the shape property value
// differs from the specified value. Three values are specified when the computed shape property value differs
// from the specified value.
// eg: "specified value/CSS Text value/computed style value"
// or: ["specified value", "CSS Text value/computed style value"]
// or: ["specified value", "CSS Text value", "Computed style value"]
var validShapeValues = [
    "none",

    "inset(10px)",
    "inset(10px 9px)",
    "inset(10px 9px 8px)",
    "inset(10px 20px 30px 40px)",
    ["inset(10px 20px 30px 20px)", "inset(10px 20px 30px)"],
    ["inset(10px 20px 10px 20px)", "inset(10px 20px)"],
    "inset(10px round 9px)",
    "inset(10px round 0px / 0px 10px)",
    ["inset(10px round 9px / 9px)", "inset(10px round 9px)"],
    "inset(10px round 9px / 8px)",
    "inset(10px round 9px / 8px 7px)",
    "inset(10px round 9px / 8px 7px 6px)",
    "inset(10px round 9px / 8px 7px 6px 5px)",
    "inset(10px round 9px 8px / 7px)",
    "inset(10px round 9px 8px / 7px 6px)",
    "inset(10px round 9px 8px / 7px 6px)",
    "inset(10px round 9px 8px / 7px 6px 5px)",
    "inset(10px round 9px 8px / 7px 6px 5px 4px)",
    "inset(10px round 9px 8px 7px / 6px)",
    "inset(10px round 9px 8px 7px / 6px 5px)",
    "inset(10px round 9px 8px 7px / 6px 5px 4px)",
    "inset(10px round 9px 8px 7px / 6px 5px 4px 3px)",
    "inset(10px round 9px 8px 7px 6px / 5px)",
    "inset(10px round 9px 8px 7px 6px / 5px 4px)",
    "inset(10px round 9px 8px 7px 6px / 5px 4px 3px)",
    "inset(10px round 9px 8px 7px 6px / 5px 4px 3px 2px)",
    ["inset(10px round 10px 20px 30px 20px)", "inset(10px round 10px 20px 30px)"],
    ["inset(10px round 10px 20px 10px 20px)", "inset(10px round 10px 20px)"],
    "inset(10px 20px 30px 40px round 5px 6px)",
    "inset(10px 20px 30px 40px round 5px 6px 7px 8px / 50px 60px 70px 80px)",
    "inset(10px round 0px / 10px)",

    ["inset(calc(25%*3 - 10in) 0 0 0)", "inset(calc(75% - 10in) 0px 0px)", "inset(calc(-960px + 75%) 0px 0px)"],
    ["inset(10px 10px 10px 10px round calc(25%*3 - 10in))", "inset(10px round calc(75% - 10in))", "inset(10px round calc(-960px + 75%))"],

    ["circle()", "circle(at 50% 50%)", "circle(at 50% 50%)"],
    ["circle(farthest-side)", "circle(farthest-side at 50% 50%)"],
    ["circle()", "circle(at 50% 50%)", "circle(at 50% 50%)"],
    ["circle(closest-side at 50px 50px)", "circle(at 50px 50px)", "circle(at 50px 50px)"],
    ["circle(10px)", "circle(10px at 50% 50%)"],
    ["circle(10px at 10px)", "circle(10px at 10px 50%)"],
    "circle(10px at 10px 10px)",
    ["circle(at 10px)", "circle(at 10px 50%)", "circle(at 10px 50%)"],
    ["circle(at 10px 10px)", "circle(at 10px 10px)", "circle(at 10px 10px)"],
    ["circle(at top left)", "circle(at 0% 0%)", "circle(at 0% 0%)"],
    ["circle(at right bottom)", "circle(at 100% 100%)", "circle(at 100% 100%)"],
    ["circle(10px at left top 10px)", "circle(10px at 0% 10px)"],
    ["circle(10px at top 10px left 10px)", "circle(10px at 10px 10px)"],
    ["circle(10px at right 10% bottom 10%)", "circle(10px at 90% 90%)"],
    ["circle(10px at right 0px bottom 0px)", "circle(10px at 100% 100%)"],
    ["circle(10px at right 10px bottom 10px)", "circle(10px at right 10px bottom 10px)"],

    ["ellipse()", "ellipse(at 50% 50%)", "ellipse(at 50% 50%)"],
    ["ellipse(10px)", "ellipse(10px at 50% 50%)", "ellipse(10px at 50% 50%)"],
    ["ellipse(10px 20px)", "ellipse(10px 20px at 50% 50%)"],
    ["ellipse(10px at 10px)", "ellipse(10px at 10px 50%)", "ellipse(10px at 10px 50%)"],
    ["ellipse(10px 20px at 10px)", "ellipse(10px 20px at 10px 50%)"],
    ["ellipse(10px at 10px 10px)", "ellipse(10px at 10px 10px)", "ellipse(10px at 10px 10px)"],
    ["ellipse(at 10px)", "ellipse(at 10px 50%)", "ellipse(at 10px 50%)"],
    ["ellipse(at 10px 10px)", "ellipse(at 10px 10px)", "ellipse(at 10px 10px)"],
    ["ellipse(at top left)", "ellipse(at 0% 0%)", "ellipse(at 0% 0%)"],
    ["ellipse(at right bottom)", "ellipse(at 100% 100%)", "ellipse(at 100% 100%)"],
    ["ellipse(10px at left top 10px)", "ellipse(10px at 0% 10px)", "ellipse(10px at 0% 10px)"],
    ["ellipse(10px at top 10px left 10px)", "ellipse(10px at 10px 10px)", "ellipse(10px at 10px 10px)"],
    ["ellipse(10px at right 10px bottom 10px)", "ellipse(10px at right 10px bottom 10px)", "ellipse(10px at right 10px bottom 10px)"],
    ["ellipse(10px 20px at left top 10px)", "ellipse(10px 20px at 0% 10px)"],
    ["ellipse(10px 20px at top 10px left 10px)", "ellipse(10px 20px at 10px 10px)"],
    ["ellipse(10px 20px at right 10px bottom 10px)", "ellipse(10px 20px at right 10px bottom 10px)"],
    ["ellipse(closest-side closest-side at 50px 50px)", "ellipse(at 50px 50px)", "ellipse(at 50px 50px)"],
    ["ellipse(farthest-side farthest-side at 50px 50px)", "ellipse(farthest-side farthest-side at 50px 50px)", "ellipse(farthest-side farthest-side at 50px 50px)"],
    ["ellipse(closest-side farthest-side at 50px 50px)", "ellipse(closest-side farthest-side at 50px 50px)", "ellipse(closest-side farthest-side at 50px 50px)"],
    ["ellipse(farthest-side closest-side at 50px 50px)", "ellipse(farthest-side at 50px 50px)", "ellipse(farthest-side at 50px 50px)"],

    ["polygon(10px 20px, 30px 40px, 40px 50px)", "polygon(10px 20px, 30px 40px, 40px 50px)"],
    ["polygon(evenodd, 10px 20px, 30px 40px, 40px 50px)", "polygon(evenodd, 10px 20px, 30px 40px, 40px 50px)"],
    ["polygon(nonzero, 10px 20px, 30px 40px, 40px 50px)", "polygon(10px 20px, 30px 40px, 40px 50px)"],
    ["polygon(10px calc(10in))", "polygon(10px calc(10in))", "polygon(10px 960px)"],
    ["polygon(calc(10in) 10px)", "polygon(calc(10in) 10px)", "polygon(960px 10px)"],

    "content-box",
    "padding-box",
    "border-box",
    "margin-box",

    ["polygon(nonzero, 10px 10px, 20px 20px, 30px 30px) content-box", "polygon(10px 10px, 20px 20px, 30px 30px) content-box"],
    ["polygon(nonzero, 10px 10px, 20px 20px, 30px 30px) padding-box", "polygon(10px 10px, 20px 20px, 30px 30px) padding-box"],
    ["polygon(nonzero, 10px 10px, 20px 20px, 30px 30px) border-box",  "polygon(10px 10px, 20px 20px, 30px 30px) border-box"],
    ["polygon(nonzero, 10px 10px, 20px 20px, 30px 30px) margin-box",  "polygon(10px 10px, 20px 20px, 30px 30px) margin-box"],

    ["content-box polygon(nonzero, 10px 10px, 20px 20px, 30px 30px)", "content-box polygon(10px 10px, 20px 20px, 30px 30px)", "polygon(10px 10px, 20px 20px, 30px 30px) content-box"],
    ["padding-box polygon(nonzero, 10px 10px, 20px 20px, 30px 30px)", "padding-box polygon(10px 10px, 20px 20px, 30px 30px)", "polygon(10px 10px, 20px 20px, 30px 30px) padding-box"],
    ["border-box polygon(nonzero, 10px 10px, 20px 20px, 30px 30px)", "border-box polygon(10px 10px, 20px 20px, 30px 30px)", "polygon(10px 10px, 20px 20px, 30px 30px) border-box"],
    ["margin-box polygon(nonzero, 10px 10px, 20px 20px, 30px 30px)", "margin-box polygon(10px 10px, 20px 20px, 30px 30px)", "polygon(10px 10px, 20px 20px, 30px 30px) margin-box"],

     "linear-gradient(to right, red, blue)",
     "radial-gradient(at 10px 20px, red 0%, blue 50%, green 95%)"
];

// Invalid values for both shape-inside and shape-outside. When an invalid shape value is specified, the
// shape property's computed value is the same as its default.
var invalidShapeValues = [
    "calc()",
    "auto",

    "inset()",
    "inset(10px, 10px)",
    "inset(10px 20px, 30px)",
    "inset(10px, 20px 30px 40px)",
    "inset(10px 20px 30px 40px 50px 60px)",
    "inset(round)",
    "inset(round 10px)",
    "inset(10px round)",
    "inset(10px round 10px /)",
    "inset(10px round 20px 30px 40px 50px 60px)",
    "inset(10px round /)",
    "inset(10px round / 10px)",
    "inset(/)",
    "inset(/ 10px)",
    "inset(round /)",

    "circle(10px 20px)",
    "circle(10px at 10px 10px 10px)",
    "circle(10px at 10px 10px at center)",
    "circle(10px at center center 10px)",
    "circle(at 10px 10px 10px)",
    "circle(at 10px 10px at center)",
    "circle(at center center 10px)",

    "circle(at 10px 10px closest-side)",
    "circle(10px at)",
    "circle(at)",

    "ellipse(10px 20px 30px)",
    "ellipse(10px at 10px 10px 10px)",
    "ellipse(10px at 10px 10px at center)",
    "ellipse(10px at center center 10px)",
    "ellipse(10px 20px 30px at center center 10px)",
    "ellipse(at 10px 10px 10px)",
    "ellipse(at 10px 10px at center)",
    "ellipse(at center center 10px)",
    "ellipse(10px 20px at)",
    "ellipse(at)",

    "polygon()",
    "polygon(evenodd 10px 20px, 30px 40px, 40px 50px)",
    "polygon(nonzero 10px 20px, 30px 40px, 40px 50px)",
    "polygon(nonzero)",
    "polygon(evenodd)",
    "polygon(10px)",
    "polygon(nonzero,10px)",
    "polygon(evenodd,12px)",
    "polygon(10px, 20px, 30px, 40px, 40px, 50px)",

    "content-box content-box",
    "polygon(nonzero, 0 0 ,10px 10px, 10px 0) polygon(nonzero, 0 0, 10px 10px, 10px 0)",
    "none content-box",
    "content-box none",
    "polygon(none) content-box",
    "content-box polygon(none)",
    "circle(50px) none",
    "none circle(50px)",
    "url('shape.svg') content-box",
    "url('shape.svg') polygon(nonzero, 0 0, 10px 10px, 10px 0)"
];

// Valid length values for shape-margin and shape-padding.
var validShapeLengths = [
    "1.5ex",
    "2em",
    "2.5in",
    "3cm",
    "3.5mm",
    "4pt",
    "4.5pc",
    "5px",
    "120%"
];

// Invalid length values for shape-margin and shape-padding.
var invalidShapeLengths = [
    "-5px",
    "none",
    "\'string\'"
];

String getCSSText(property, value) {
    Element element = document.createElement("div");
    element.style.cssText = "$property : $value";
    return element.style.getPropertyValue(property);
}

String getComputedStyleValue(property, value) {
    var element = document.createElement("div");
    document.body.append(element);
    element.style.setProperty(property, value);
    String computedValue = element.getComputedStyle().getPropertyValue(property);
    element.remove();
    return computedValue;
}

List getParentAndChildComputedStyles(property, parentValue, childValue) {
    var parentElement = document.createElement("div");
    document.body.append(parentElement);
    parentElement.style.setProperty(property, parentValue);
    var childElement = document.createElement("div");
    parentElement.append(childElement);
    childElement.style.setProperty(property, childValue);
    String parentComputedValue = parentElement.getComputedStyle().getPropertyValue(property);
    String childComputedValue = childElement.getComputedStyle().getPropertyValue(property);
    childElement.remove();
    parentElement.remove();
    return [parentComputedValue, childComputedValue];
}

String getParentAndChildComputedStylesString(property, parentValue, childValue) {
    List styles = getParentAndChildComputedStyles(property, parentValue, childValue);
    return "parent: ${styles[0]}, child: ${styles[1]}";
}

void getChildComputedStyle(property, parentValue, childValue) {
    var styles = getParentAndChildComputedStyles(property, parentValue, childValue);
    return styles[1];
}

void testShapeSpecifiedProperty(property, value, expectedValue) {
    shouldBe(getCSSText(property, value), expectedValue);
}

void testShapeComputedProperty(property, value, expectedValue) {
    shouldBe(getComputedStyleValue(property, value), expectedValue);
}

void testNotInheritedShapeChildProperty(property, parentValue, childValue, expectedChildValue) {
    shouldBe(getChildComputedStyle(property, parentValue, childValue), expectedChildValue);
}

// Need to remove the base URL to avoid having local paths in the expected results.
void removeBaseURL(String src) {
    var urlRegexp = new RegExp("url\(([^\)]*)\)");
    var replaced= src.replaceAllMapped(urlRegexp, (match) {
       String url=match[1];
       String last=url.substring(url.lastIndexOf('/') + 1);
//       String res="url($last)";  // this is how it should be, but does not work 
       String res="url($last"; // workaround
       return res;
    });
    return replaced;
}

void testLocalURLShapeProperty(property, value, expected) {
    shouldBe(removeBaseURL(getCSSText(property, value)), expected, 
        "getCSSText($property, $value)");
    shouldBe(removeBaseURL(getComputedStyleValue(property, value)), expected,
        "getComputedStyleValue($property, $value)");
}

void testShapePropertyParsingFailure(property, value, defaultComputedStyle) {
    shouldBe(getCSSText(property, value), '');
    shouldBe(getComputedStyleValue(property, value), defaultComputedStyle);
}

void testNotInheritedShapeProperty(property, parentValue, childValue, expectedValue) {
    shouldBe(getParentAndChildComputedStylesString(property, parentValue, childValue), expectedValue);
}

void applyToEachArglist(testFunction, arglists) {
    arglists.forEach((arglist) {Function.apply(testFunction, arglist);});
}

