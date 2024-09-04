//
//  SettingsDictionary+.swift
//  ProjectDescriptionHelpers
//
//  Created by Chang Woo Son on 3/28/24.
//

import Foundation
import ProjectDescription

public extension SettingsDictionary {
    static let base: Self = [
        "SWIFT_VERSION": "5.0",
        "TARGETED_DEVICE_FAMILY": ["1", "2"],
        "COMMON_DEVELOPMENT_TEAM": "N9724JM723",
        "COMMON_BUNDLE_VERSION": "1",
        "COMMON_BUNDLE_SHORT_VERSION": "1.0.0",
        "COMMON_PRODUCT_BUNDLE_IDENTIFIER": "com.delightroom.assignment",
        "COMMON_ASSETCATALOG_COMPILER_APPICON_NAME": "AppIcon",
    ]

    static let debug: Self = [
        "DEBUG_INFORMATION_FORMAT": "dwarf",
        "ENABLE_TESTABILITY": true,
        "GCC_DYNAMIC_NO_PIC": false,
        "GCC_OPTIMIZATION_LEVEL": "0",
        "GCC_PREPROCESSOR_DEFINITIONS": "DEBUG=1 $(inherited)",
        "MTL_ENABLE_DEBUG_INFO": "INCLUDE_SOURCE",
        "ONLY_ACTIVE_ARCH": true,
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "$(inherited) DEBUG",
        "SWIFT_OPTIMIZATION_LEVEL": "-Onone",
        "VALID_ARCHS": "$(ARCHS_STANDARD)",
    ]

    static let qa: Self = [
        "DEBUG_INFORMATION_FORMAT": "dwarf",
        "ENABLE_TESTABILITY": true,
        "GCC_DYNAMIC_NO_PIC": false,
        "GCC_OPTIMIZATION_LEVEL": "0",
        "GCC_PREPROCESSOR_DEFINITIONS": "QA=1 $(inherited)",
        "MTL_ENABLE_DEBUG_INFO": "INCLUDE_SOURCE",
        "ONLY_ACTIVE_ARCH": true,
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "$(inherited) QA",
        "SWIFT_OPTIMIZATION_LEVEL": "-Onone",
        "VALID_ARCHS": "$(ARCHS_STANDARD)",
    ]

    static let release: Self = [
        "DEBUG_INFORMATION_FORMAT": "dwarf-with-dsym",
        "ENABLE_NS_ASSERTIONS": false,
        "MTL_ENABLE_DEBUG_INFO": false,
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "$(inherited) RELEASE",
        "SWIFT_COMPILATION_MODE": "wholemodule",
        "SWIFT_OPTIMIZATION_LEVEL": "-O",
        "VALIDATE_PRODUCT": true,
    ]

    static let dynamicFramework: Self = [
        "APPLICATION_EXTENSION_API_ONLY": false,
        "CODE_SIGNING_REQUIRED": false,
        "CODE_SIGN_IDENTITY": "",
        "DEAD_CODE_STRIPPING": true,
        "DEFINES_MODULE": false,
        "GCC_DYNAMIC_NO_PIC": false,
        "INSTALL_PATH": "@rpath",
        "LD_DYLIB_INSTALL_NAME": "@rpath/$(PRODUCT_NAME).$(WRAPPER_EXTENSION)/$(PRODUCT_NAME)",
        "LD_RUNPATH_SEARCH_PATHS": "$(inherited) @loader_path/..",
        "SKIP_INSTALL": true,
        "OTHER_LDFLAGS": "$(inherited) -all_load -ObjC",
    ]

    static let staticLibrary: Self = [
        "APPLICATION_EXTENSION_API_ONLY": false,
        "DEAD_CODE_STRIPPING": true,
        "DEFINES_MODULE": false,
        "GCC_DYNAMIC_NO_PIC": false,
        "PUBLIC_HEADERS_FOLDER_PATH": "include/$PRODUCT_NAME",
        "SKIP_INSTALL": true,
        "OTHER_LDFLAGS": "$(inherited) -all_load -ObjC",
    ]

    static let test: Self = [
        "DEVELOPMENT_TEAM": "$(COMMON_DEVELOPMENT_TEAM)",
        "CODE_SIGN_STYLE": "Automatic",
        "HEADER_SEARCH_PATHS": "$(inherited) $(OBJROOT)/UninstalledProducts/include ${SPM_CHECK_OUT}/firebase-ios-sdk/CoreOnly/Sources",
        "LD_RUNPATH_SEARCH_PATHS": "$(inherited) @executable_path/Frameworks @loader_path/Frameworks",
        "OTHER_LDFLAGS": "-ObjC",
        "SWIFT_COMPILATION_MODE": "wholemodule",
        "SWIFT_INCLUDE_PATHS": "$(inherited)",
        "SWIFT_TREAT_WARNINGS_AS_ERRORS": false,
        "SPM_ROOT": "${SRCROOT}/Tuist/Dependencies/SwiftPackageManager",
        "SPM_CHECK_OUT": "${SPM_ROOT}/.build/checkouts"
    ]

    static let example: Self = [
        "ASSETCATALOG_COMPILER_APPICON_NAME": "AppIcon",
        "CODE_SIGN_STYLE": "Automatic",
        "CURRENT_PROJECT_VERSION": "1",
        "DEVELOPMENT_TEAM": "N9724JM723",
        "ENABLE_PREVIEWS": true,
        "GENERATE_INFOPLIST_FILE": true,
        "INFOPLIST_KEY_UIApplicationSceneManifest_Generation": true,
        "INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents": true,
        "INFOPLIST_KEY_UILaunchScreen_Generation": true,
        "INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone": "UIInterfaceOrientationPortrait UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight",
        "INFOPLIST_KEY_WKRunsIndependentlyOfCompanionApp": false,
        "MARKETING_VERSION": "1.0",
        "SWIFT_EMIT_LOC_STRINGS": true,
        "SWIFT_VERSION": "5.0",
        "TARGETED_DEVICE_FAMILY": ["1", "2"]
    ]
}
