# InterestUIs
FirstParty로만 UI들을 Custom해보자.

## 🧡 Toast Alert (UIKit)
### 1. Icon Image
특정 아이콘 이미지를 Toast Message 앞에 넣을 수도 있다고 생각되어 옵셔널 타입으로 UIImageView도 넣어주었다. 파라미터로 받는 UIImage의 값이 nil이면 message만 나오고, image가 있으면 해당 이미지를 message 앞에 표시해준다. 

| With Icon | Without Icon | 
|:--------:|:--------:|
|<img src="https://github.com/user-attachments/assets/b8e25d25-cfd3-491e-9ef0-59f334c2ce85" alt="diary_scroll" width="300">|<img src="https://github.com/user-attachments/assets/9bf4e8d7-cf8b-4c01-90a8-d95d1362a25d" alt="diary_scroll" width="300">|

### 2. ToastProtocol
ToastView와 ToastProtocol을 분리해, ToastProtocol을 ViewController에서 채택하면 ToastAlert을 window위에 띄울 수 있도록 구현하였다.
```swift
protocol ToastProtocol where Self: UIViewController {
    var window: UIWindow? { get set }
}

extension ToastProtocol {
    func showToast(icon: UIImage?, message: String) {
        let toastLabel = ToastView(icon: icon, text: message)
        toastLabel.frame = CGRect(x: Int(self.view.frame.minX) + 16, y: Int(self.view.frame.midY), width: Int(self.view.frame.width) - 32, height: 50)
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        window = UIWindow(windowScene: windowScene)
        window?.windowLevel = .alert
        window?.isUserInteractionEnabled = false
        window?.addSubview(toastLabel)
        
        self.window?.isHidden = false
        UIView.animate(withDuration: 1.0, delay: 1.5, options: .curveEaseOut, animations: {
            self.window?.alpha = 0.0
        }) { _ in
            self.window?.alpha = 1.0
            self.window?.isHidden = true
        }
    }
}
```

## Pinterest Layout (UIKit)


## Card Swipe Interection
