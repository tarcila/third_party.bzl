# SPDX-License-Identifier: BSD-3-Clause
# Copyright (c) Contributors to the OpenEXR Project.

load("@rules_cc//cc:defs.bzl", "cc_library")

# generate "ImathConfig.h"
IMATH_CONFIG_H = """\r
// SPDX-License-Identifier: BSD-3-Clause\r
// Copyright Contributors to the OpenEXR Project.\r
\r
// This file is auto-generated by Bazel\r
\r
#ifndef INCLUDED_IMATH_CONFIG_H\r
#define INCLUDED_IMATH_CONFIG_H 1\r
\r
#pragma once\r
\r
//\r
// Options / configuration based on O.S. / compiler\r
/////////////////////\r
\r
//\r
// Define if the target system has support for large\r
// stack sizes.\r
//\r
/* #undef IMATH_HAVE_LARGE_STACK */\r
\r
//////////////////////\r
//\r
// C++ namespace configuration / options\r
\r
// Current (internal) library namepace name and corresponding public\r
// client namespaces.\r
#define IMATH_INTERNAL_NAMESPACE_CUSTOM 0\r
#define IMATH_INTERNAL_NAMESPACE Imath_3_0\r
\r
\r
#define IMATH_NAMESPACE_CUSTOM 0\r
#define IMATH_NAMESPACE Imath\r
\r
\r
//\r
// Version information\r
//\r
#define IMATH_VERSION_STRING "3.0.1"\r
#define IMATH_PACKAGE_STRING "Imath 3.0.1"\r
\r
#define IMATH_VERSION_MAJOR 3\r
#define IMATH_VERSION_MINOR 0\r
#define IMATH_VERSION_PATCH 1\r
\r
#define IMATH_VERSION_HEX ((uint32_t(IMATH_VERSION_MAJOR) << 24) | \\\r
                             (uint32_t(IMATH_VERSION_MINOR) << 16) | \\\r
                             (uint32_t(IMATH_VERSION_PATCH) <<  8))\r
\r
\r
//\r
// By default, opt into the interoparability constructors and assignments.\r
// If this causes problems, it can be disabled by defining this symbol to\r
// be 0 prior to including any Imath headers.\r
//\r
// If no such definition is found, we enable automatically unless we are\r
// using gcc 4.x, which appears to have bugs that prevent the interop\r
// templates from compiling correctly.\r
//\r
#ifndef IMATH_FOREIGN_VECTOR_INTEROP\r
#  if defined(__GNUC__) && __GNUC__ == 4 && !defined(__clang__)\r
#    define IMATH_FOREIGN_VECTOR_INTEROP 0\r
#  else\r
#    define IMATH_FOREIGN_VECTOR_INTEROP 1\r
#  endif\r
#endif\r
\r
\r
//\r
// Decorator that makes a function available for both CPU and GPU, when\r
// compiling for Cuda.\r
//\r
#ifdef __CUDACC__\r
  #define IMATH_HOSTDEVICE __host__ __device__\r
#else\r
  #define IMATH_HOSTDEVICE\r
#endif\r
\r
\r
//\r
// Some compilers define a special intrinsic to use in conditionals that can\r
// speed up extremely performance-critical spots if the conditional is\r
// usually (or rarely) is true.  You use it by replacing\r
//     if (x) ...\r
// with\r
//     if (IMATH_LIKELY(x)) ...     // if you think x will usually be true\r
// or\r
//     if (IMATH_UNLIKELY(x)) ...   // if you think x will rarely be true\r
//\r
// Caveat: Programmers are notoriously bad at guessing this, so it should be\r
// used only with thorough benchmarking.\r
//\r
#if defined(__GNUC__) || defined(__clang__) || defined(__INTEL_COMPILER)\r
#    define IMATH_LIKELY(x) (__builtin_expect(bool(x), true))\r
#    define IMATH_UNLIKELY(x) (__builtin_expect(bool(x), false))\r
#else\r
#    define IMATH_LIKELY(x) (x)\r
#    define IMATH_UNLIKELY(x) (x)\r
#endif\r
\r
\r
//\r
// Simple way to mark things as deprecated.\r
// When we are sure that C++14 is our true minimum, then we can just\r
// directly use [[deprecated(msg)]].\r
//\r
#if defined(_MSC_VER)\r
# define IMATH_DEPRECATED(msg) __declspec(deprecated(msg))\r
#elif __cplusplus >= 201402L\r
# define IMATH_DEPRECATED(msg) [[deprecated(msg)]]\r
#elif defined(__GNUC__) || defined(__clang__)\r
# define IMATH_DEPRECATED(msg) __attribute__((deprecated(msg)))\r
#else\r
# define IMATH_DEPRECATED(msg) /* unsupported on this platform */\r
#endif\r
\r
// Whether the user configured the library to have symbol visibility\r
// tagged\r
#define IMATH_ENABLE_API_VISIBILITY\r
\r
// MSVC does not do the same visibility attributes, and when we are\r
// compiling a static library we won't be in DLL mode, but just don't\r
// define these and the export headers will work out\r
#if ! defined(_MSC_VER) && defined(IMATH_ENABLE_API_VISIBILITY)\r
#  define IMATH_PUBLIC_SYMBOL_ATTRIBUTE __attribute__ ((__visibility__ ("default")))\r
#  define IMATH_PRIVATE_SYMBOL_ATTRIBUTE __attribute__ ((__visibility__ ("hidden")))\r
// clang differs from gcc and has type visibility which is needed for enums and templates\r
#  if __has_attribute(__type_visibility__)\r
#    define IMATH_PUBLIC_TYPE_VISIBILITY_ATTRIBUTE __attribute__ ((__type_visibility__ ("default")))\r
#  endif\r
#endif\r
\r
#endif // INCLUDED_IMATH_CONFIG_H\r
"""

genrule(
    name = "generate_ImathConfig_h",
    outs = ["//:ImathConfig.h"],
    cmd = ("echo '%s' > $(OUTS)" % IMATH_CONFIG_H),
    visibility = ["//visibility:private"],
)

cc_library(
    name = "Imath",
    srcs = [
        "src/Imath/ImathColorAlgo.cpp",
        "src/Imath/ImathFun.cpp",
        "src/Imath/ImathMatrixAlgo.cpp",
        "src/Imath/ImathRandom.cpp",
        "src/Imath/eLut.h",
        "src/Imath/half.cpp",
        "src/Imath/toFloat.h",
        "//:ImathConfig.h",
    ],
    hdrs = [
        "src/Imath/ImathBox.h",
        "src/Imath/ImathBoxAlgo.h",
        "src/Imath/ImathColor.h",
        "src/Imath/ImathColorAlgo.h",
        "src/Imath/ImathEuler.h",
        "src/Imath/ImathExport.h",
        "src/Imath/ImathForward.h",
        "src/Imath/ImathFrame.h",
        "src/Imath/ImathFrustum.h",
        "src/Imath/ImathFrustumTest.h",
        "src/Imath/ImathFun.h",
        "src/Imath/ImathGL.h",
        "src/Imath/ImathGLU.h",
        "src/Imath/ImathInt64.h",
        "src/Imath/ImathInterval.h",
        "src/Imath/ImathLine.h",
        "src/Imath/ImathLineAlgo.h",
        "src/Imath/ImathMath.h",
        "src/Imath/ImathMatrix.h",
        "src/Imath/ImathMatrixAlgo.h",
        "src/Imath/ImathNamespace.h",
        "src/Imath/ImathPlane.h",
        "src/Imath/ImathPlatform.h",
        "src/Imath/ImathQuat.h",
        "src/Imath/ImathRandom.h",
        "src/Imath/ImathRoots.h",
        "src/Imath/ImathShear.h",
        "src/Imath/ImathSphere.h",
        "src/Imath/ImathTypeTraits.h",
        "src/Imath/ImathVec.h",
        "src/Imath/ImathVecAlgo.h",
        "src/Imath/half.h",
        "src/Imath/halfFunction.h",
        "src/Imath/halfLimits.h",
    ],
    includes = ["src/", "src/Imath"],
    visibility = ["//visibility:public"],
)
