//
//  CustomAnnotationView.swift
//
//
//  Created by Artem Bilyi on 11.06.2024.
//

import MapKit

final class CustomAnnotationView: MKAnnotationView {
    static let identifier = String(describing: CustomAnnotationView.self)

    private enum Style {
        enum Constant {
            static let containerViewWidth: CGFloat = 34
            static let containerViewHeight: CGFloat = 40
            static let flagLabelFontSize: CGFloat = 20
            static let flagLabelTopPadding: CGFloat = 6
            static let checkmarkTopPadding: CGFloat = -3
            static let checkmarkTrailingPadding: CGFloat = 3
            static let cornerRadius: CGFloat = 4.0
            static let shadowOpacity: Float = 0.35
            static let shadowOffsetWidth: CGFloat = 0
            static let shadowOffsetHeight: CGFloat = 4
            static let shadowRadius: CGFloat = 4
        }

        enum Image {
            static let imageView = UIImage(resource: .pin)
            static let checkmark = UIImage(resource: .circle)
        }
    }

    private let imageView = UIImageView(image: Style.Image.imageView)
    private let checkmark = UIImageView(image: Style.Image.checkmark)
    private let flagLabel = UILabel()

    var flag: String? {
        get { flagLabel.text }
        set { flagLabel.text = newValue }
    }

    var hasVisited: Bool {
        get { !checkmark.isHidden }
        set { checkmark.isHidden = !newValue }
    }

    private lazy var containerView: UIView = {
        let view = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: Style.Constant.containerViewWidth,
            height: Style.Constant.containerViewHeight
        ))
        return view
    }()

    private lazy var bottomCornerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.layer.cornerRadius = Style.Constant.cornerRadius
        return $0
    }(UIView())

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupView()
        setupShadow()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        selfAppearance(completion: super.didMoveToSuperview())
    }

    private func setupShadow() {
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = Style.Constant.shadowOpacity
        containerView.layer.shadowOffset = CGSize(
            width: Style.Constant.shadowOffsetWidth,
            height: Style.Constant.shadowOffsetHeight)
        containerView.layer.shadowRadius = Style.Constant.shadowRadius
        containerView.layer.masksToBounds = false
    }

    private func setupView() {
        alpha = 0
        flagLabel.font = UIFont.systemFont(ofSize: Style.Constant.flagLabelFontSize)

        addSubview(containerView)

        for view in [imageView, flagLabel, checkmark] {
            containerView.addSubview(view)
        }

        setupConstraints()
    }

    private func selfAppearance(completion: Void) {
        transform = CGAffineTransform(translationX: 0, y: -30)

        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0,
            animations: {
                self.transform = .identity
                self.alpha = 1
            },
            completion: { _ in
                completion
            }
        )
    }

    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageViewConstraints = [
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ]

        flagLabel.translatesAutoresizingMaskIntoConstraints = false
        let flagLabelConstraints = [
            flagLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Style.Constant.flagLabelTopPadding),
            flagLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ]

        checkmark.translatesAutoresizingMaskIntoConstraints = false
        let checkmarkConstraints = [
            checkmark.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: Style.Constant.checkmarkTopPadding
            ),
            checkmark.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: Style.Constant.checkmarkTrailingPadding
            ),
        ]

        NSLayoutConstraint.activate(
            imageViewConstraints
                + flagLabelConstraints
                + checkmarkConstraints
        )
    }
}
