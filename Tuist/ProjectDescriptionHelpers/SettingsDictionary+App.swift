//
//  SettingsDictionary+App.swift
//  ProjectDescriptionHelpers
//
//  Created by Chang Woo Son on 6/4/24.
//

import ProjectDescription


public extension SettingsDictionary {
    struct App {
        static let base: SettingsDictionary = .base.merging([
            "DEVELOPMENT_TEAM": "$(COMMON_DEVELOPMENT_TEAM)",
            "CURRENT_PROJECT_VERSION": "$(COMMON_BUNDLE_VERSION)",
            "MARKETING_VERSION": "$(COMMON_BUNDLE_SHORT_VERSION)",
            "CODE_SIGN_STYLE": "Automatic",
            "ENABLE_PREVIEWS": true,
            "ENABLE_BITCODE": false,
            "GENERATE_INFOPLIST_FILE": false,
            "SWIFT_EMIT_LOC_STRINGS": true
        ])

        static let debugMode: SettingsDictionary = [
            "COPY_PHASE_STRIP": false,
            "DEBUG_INFORMATION_FORMAT": "dwarf",
            "ENABLE_TESTABILITY": true,
            "GCC_DYNAMIC_NO_PIC": false,
            "GCC_OPTIMIZATION_LEVEL": "0",
            "GCC_PREPROCESSOR_DEFINITIONS": "$(inherited) DEBUG=1 BUILD_FOR_DEV=1 LOGGING_LEVEL_DEBUG=1",
            "INFOPLIST_KEY_WKRunsIndependentlyOfCompanionApp": false,
            "LD_RUNPATH_SEARCH_PATHS": "$(inherited) @executable_path/Frameworks",
            "LIBRARY_SEARCH_PATHS": "$(inherited)",
            "LLVM_LTO": false,
            "MTL_ENABLE_DEBUG_INFO": "INCLUDE_SOURCE",
            "ONLY_ACTIVE_ARCH": true,
            "OTHER_CFLAGS": "-ftrapv",
            "STRIP_INSTALLED_PRODUCT": false,
            "SWIFT_OPTIMIZATION_LEVEL": "-Onone",
            "OTHER_SWIFT_FLAGS": "$(inherited) -D BUILD_FOR_DEV"
        ]

        static let releaseMode: SettingsDictionary = [
            "COPY_PHASE_STRIP": true,
            "DEBUG_INFORMATION_FORMAT": "dwarf-with-dsym",
            "ENABLE_NS_ASSERTIONS": false,
            "FRAMEWORK_SEARCH_PATHS": "$(inherited) $(PROJECT_DIR)",
            "GCC_OPTIMIZATION_LEVEL": "s",
            "GCC_PREPROCESSOR_DEFINITIONS": "NDEBUG=1",
            "LD_RUNPATH_SEARCH_PATHS": "$(inherited) @executable_path/Frameworks",
            "LIBRARY_SEARCH_PATHS": "$(inherited)",
            "LLVM_LTO": false,
            "MTL_ENABLE_DEBUG_INFO": false,
            "ONLY_ACTIVE_ARCH": false,
            "STRIP_INSTALLED_PRODUCT": true,
            "SWIFT_OPTIMIZATION_LEVEL": "-O",
            "CODE_SIGN_STYLE": "Automatic",
            "VALIDATE_PRODUCT": true
        ]

        static let common: SettingsDictionary = [
            "EXCLUDED_SOURCE_FILE_NAMES": "FLEX*",
        ]

        static let commonDebug: SettingsDictionary = App.common.merging([
            "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "DEBUG",
            "PRODUCT_NAME": "$(TARGET_NAME).debug",
        ])

        static let commonQA: SettingsDictionary = App.common.merging([
            "OTHER_SWIFT_FLAGS": "-D QA",
            "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "QA",
            "PRODUCT_NAME": "$(TARGET_NAME).qa",
        ])

        static let commonRelease: SettingsDictionary = App.common.merging([
            "OTHER_SWIFT_FLAGS": "-D RELEASE",
            "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "RELEASE",
            "PRODUCT_NAME": "$(TARGET_NAME)"
        ])
    }

    struct iOS {
        static let debug: SettingsDictionary = App.commonDebug.merging([
            "PRODUCT_BUNDLE_IDENTIFIER": "$(COMMON_PRODUCT_BUNDLE_IDENTIFIER).debug",
            "ASSETCATALOG_COMPILER_APPICON_NAME": "$(COMMON_ASSETCATALOG_COMPILER_APPICON_NAME).debug"
        ])

        static let qa: SettingsDictionary = App.commonQA.merging([
            "PRODUCT_BUNDLE_IDENTIFIER": "$(COMMON_PRODUCT_BUNDLE_IDENTIFIER).qa",
            "ASSETCATALOG_COMPILER_APPICON_NAME": "$(COMMON_ASSETCATALOG_COMPILER_APPICON_NAME).qa",
        ])

        static let release: SettingsDictionary = App.commonRelease.merging([
            "PRODUCT_BUNDLE_IDENTIFIER": "$(COMMON_PRODUCT_BUNDLE_IDENTIFIER)",
            "ASSETCATALOG_COMPILER_APPICON_NAME": "$(COMMON_ASSETCATALOG_COMPILER_APPICON_NAME)",
        ])
    }
}
