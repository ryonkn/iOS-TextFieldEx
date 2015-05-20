//
//  ViewController.swift
//  TextFieldEx
//
//  Created by Ryo Nakano on 2015/05/20.
//  Copyright (c) 2015年 Peppermint Club. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // 定数
    let BTN_SHOW = 0
    
    // 変数
    var _textField: UITextField?
    

    //-------------------------
    //UI
    //-------------------------
    
    // ロード完了時に呼ばれる
    override func viewDidLoad() {
        super.viewDidLoad()
        let dx: CGFloat = (UIScreen.mainScreen().bounds.size.width-320)/2
        
        // テキストフィールドの生成
        _textField = makeTextField(CGRectMake(dx+10, 20, 300, 32),
            text: "これはテストです。")
        self.view.addSubview(_textField!)
        
        // ボタンの生成
        let btnShow = makeButton(CGRectMake(dx+110, 62, 100, 40),
            text: "表示", tag: BTN_SHOW)
        self.view.addSubview(btnShow)
    }

    func onClick(sender: UIButton) {
        if sender.tag == BTN_SHOW {
            showAlert(nil, text: "テキストフィールドの文字列\n\(_textField!.text)")
        }
    }
    
    //テキストフィールドの初期化
    func makeTextField(frame: CGRect, text: String) -> UITextField {
        let textField = UITextField()
        textField.frame = frame
        textField.text = text
        textField.borderStyle = UITextBorderStyle.RoundedRect
        textField.keyboardType = UIKeyboardType.Default
        textField.returnKeyType = UIReturnKeyType.Done
        textField.delegate = self
        return textField
    }
    
    // テキストボタンの初期化
    func makeButton(frame: CGRect, text: NSString, tag: Int) -> UIButton {
        let button = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.frame = frame
        button.setTitle(text as String, forState: UIControlState.Normal)
        button.tag = tag
        button.addTarget(self, action: "onClick:",
            forControlEvents: UIControlEvents.TouchUpInside)
        return button
    }
    
    // アラートの表示
    func showAlert(title: NSString?, text: NSString?) {
        let alert = UIAlertController(title: title as? String, message: text as? String,
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    //--------------------------
    //UITextFieldDelegate
    //--------------------------

    //　改行ボタン押下時に呼ばれる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // キーボードを閉じる
        self.view.endEditing(true)
        return true
    }
}

