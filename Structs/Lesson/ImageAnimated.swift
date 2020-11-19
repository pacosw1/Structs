import SwiftUI

struct ImageAnimated: UIViewRepresentable {
    //let imageSize: CGSize
    let animationNamespace: String
    let duration: Int

    func makeUIView(context: Self.Context) -> UIView {
        let image = UIImage(named: animationNamespace + "/0")!
        
        let width = image.size.width
        let height = image.size.height
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        if width > height {
            // Landscape image
            // Use screen width if < than image width
            newWidth = width > UIScreen.main.bounds.width ? UIScreen.main.bounds.width : width
            // Scale height
            newHeight = newWidth/width * height
        } else {
            // Portrait
            print(UIScreen.main.bounds.height)
            newHeight = height > UIScreen.main.bounds.height / 3 ? UIScreen.main.bounds.height / 3 : height
            print(newHeight)
            // Scale width
            newWidth = newHeight/height * width
        }
        print(newWidth, newHeight)
        let containerView = UIView(frame: CGRect(x: 0, y: 0 , width: newWidth * 0.9, height: newHeight * 0.9))

        let animationImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: newWidth * 0.8, height: newHeight * 0.8))

        animationImageView.clipsToBounds = true
        animationImageView.layer.cornerRadius = 5
        animationImageView.autoresizesSubviews = true
        animationImageView.contentMode = UIView.ContentMode.scaleAspectFill

        var i = 0
        var images = [UIImage]()
        while let image = UIImage(named: "\(animationNamespace)/\(i)") {
            images.append(image)
            i += 1
        }
        animationImageView.image = UIImage.animatedImage(with: images, duration: Double(duration))

        containerView.addSubview(animationImageView)

        return containerView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<ImageAnimated>) {

    }
}
