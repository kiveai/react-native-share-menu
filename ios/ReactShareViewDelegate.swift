//
//  ReactShareViewDelegate.swift
//  RNShareMenu
//
//  Created by Gustavo Parreira on 29/07/2020.
//
import Firebase

public protocol ReactShareViewDelegate {
    func loadExtensionContext() -> NSExtensionContext

    func openApp()

    func continueInApp(with items: [NSExtensionItem], and extraData: [String:Any]?)
}

func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    setupFirebase()
    return true
}


func setupFirebase () {
    let env = ReactNativeConfig.env(for: "ENVIRONMENT")
    var firebasePlistFileName = "GoogleService-Info"
    if (env == "Dev") {
      firebasePlistFileName = "GoogleService-Info-Dev"
    }
    let filePath = Bundle.main.path(forResource: firebasePlistFileName, ofType: "plist")
    let fileopts = FirebaseOptions.init(contentsOfFile: filePath!)!

    FirebaseApp.configure(options: fileopts)
  }
