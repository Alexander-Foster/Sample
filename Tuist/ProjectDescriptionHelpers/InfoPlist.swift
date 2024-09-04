//
//  InfoPlist.swift
//  ProjectDescriptionHelpers
//
//  Created by woody on 2022/02/18.
//

import ProjectDescription


extension InfoPlist {
    public static var delightroom: Self {
        .extendingDefault(with: [
            "CFBundleDevelopmentRegion": "$(DEVELOPMENT_LANGUAGE)",
            "CFBundleDisplayName": "$(DISPLAY_NAME)",
            "CFBundleExecutable": "$(EXECUTABLE_NAME)",
            "CFBundleIdentifier": "$(PRODUCT_BUNDLE_IDENTIFIER)",
            "CFBundleInfoDictionaryVersion": "6.0",
            "CFBundleName": "$(PRODUCT_NAME)",
            "CFBundlePackageType": "$(PRODUCT_BUNDLE_PACKAGE_TYPE)",
            "CFBundleShortVersionString": "$(MARKETING_VERSION)",
            "LSApplicationCategoryType": "public.app-category.utilities",
            "CFBundleVersion": "$(CURRENT_PROJECT_VERSION)",
            "FacebookAdvertiserIDCollectionEnabled": true,
            "FacebookAutoLogAppEventsEnabled": true,
            "FirebaseAppDelegateProxyEnabled": false,
            "ITSAppUsesNonExemptEncryption": false,
            "LSRequiresIPhoneOS": true,
            "NSAppTransportSecurity": [
                "NSAllowsArbitraryLoads": true,
                "NSAllowsArbitraryLoadsForMedia": true,
                "NSAllowsArbitraryLoadsInWebContent": true
            ],
            "NSPhotoLibraryUsageDescription": "You need permission to take photos for bug reports and inquiries.",
            "NSUserTrackingUsageDescription": "This identifier will be used to deliver personalized ads to you.",
            "NSLocationWhenInUseUsageDescription": "We need your location to provide better service.",
            "NSLocationAlwaysUsageDescription": "We need your location to provide better service.",
            "NSAppleMusicUsageDescription": "음악 라이브러리에 접근합니다.",
            "UIBackgroundModes": ["fetch", "remote-notification"],
            "UILaunchStoryboardName": "LaunchScreen",
            "UIRequiredDeviceCapabilities": ["armv7"],
            "UISupportedInterfaceOrientations": [
                "UIInterfaceOrientationPortrait",
                "UIInterfaceOrientationPortraitUpsideDown",
                "UIInterfaceOrientationLandscapeLeft",
                "UIInterfaceOrientationLandscapeRight"
            ],
            "UISupportedInterfaceOrientations~ipad": [
                "UIInterfaceOrientationPortrait",
                "UIInterfaceOrientationPortraitUpsideDown",
                "UIInterfaceOrientationLandscapeLeft",
                "UIInterfaceOrientationLandscapeRight"
            ]
        ])
    }
}
