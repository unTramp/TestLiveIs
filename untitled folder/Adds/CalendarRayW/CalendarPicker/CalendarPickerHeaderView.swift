/// Copyright (c) 2020 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class CalendarPickerHeaderView: UIView {
  lazy var monthLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name:"Rubik-Medium", size: 17.0)
    label.textColor = .black//UIColor(hexString: "42556B")
    label.text = "Month"
    label.accessibilityTraits = .header
    label.isAccessibilityElement = true
    return label
  }()

  lazy var closeButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false

    let configuration = UIImage.SymbolConfiguration(scale: .medium)
    let image = UIImage(systemName: "xmark.circle.fill", withConfiguration: configuration)
    button.setImage(image, for: .normal)

    button.tintColor = .secondaryLabel
    button.contentMode = .scaleAspectFill
    button.isUserInteractionEnabled = true
    button.isAccessibilityElement = true
    button.accessibilityLabel = "Close Picker"
    return button
  }()

  lazy var dayOfWeekStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.distribution = .fillEqually
    return stackView
  }()

  lazy var separatorView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor.label.withAlphaComponent(0.2)
    return view
  }()

  private lazy var dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar(identifier: .gregorian)
    dateFormatter.locale = Locale.autoupdatingCurrent
    dateFormatter.setLocalizedDateFormatFromTemplate("MMMM y")
    return dateFormatter
  }()

  var baseDate = Date() {
    didSet {
      monthLabel.text = dateFormatter.string(from: baseDate)
    }
  }

  var exitButtonTappedCompletionHandler: (() -> Void)

  init(exitButtonTappedCompletionHandler: @escaping (() -> Void)) {
    self.exitButtonTappedCompletionHandler = exitButtonTappedCompletionHandler

    super.init(frame: CGRect.zero)

    translatesAutoresizingMaskIntoConstraints = false

    backgroundColor = .systemGroupedBackground

    layer.maskedCorners = [
      .layerMinXMinYCorner,
      .layerMaxXMinYCorner
    ]
    layer.cornerCurve = .continuous
    layer.cornerRadius = 15

    addSubview(monthLabel)
    addSubview(closeButton)
    addSubview(dayOfWeekStackView)
    addSubview(separatorView)

    for dayNumber in 1...7 {
      let dayLabel = UILabel()
      dayLabel.font = UIFont(name:"Rubik-Bold", size: 12.0)
      dayLabel.textColor = UIColor(hexString: "42556B")//.secondaryLabel
      dayLabel.textAlignment = .center
      dayLabel.text = dayOfWeekLetter(for: dayNumber)

      // VoiceOver users don't need to hear these days of the week read to them, nor do SwitchControl or Voice Control users need to select them
      // If fact, they get in the way!
      // When a VoiceOver user highlights a day of the month, the day of the week is read to them.
      // That method provides the same amount of context as this stack view does to visual users
      dayLabel.isAccessibilityElement = false
      dayOfWeekStackView.addArrangedSubview(dayLabel)
    }

    closeButton.addTarget(self, action: #selector(didTapExitButton), for: .touchUpInside)
  }

  @objc func didTapExitButton() {
    exitButtonTappedCompletionHandler()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func dayOfWeekLetter(for dayNumber: Int) -> String {
    switch dayNumber {
    case 1:
      return "Вс" //"S"
    case 2:
      return "Пн"//"M"
    case 3:
      return "Вт" //"T"
    case 4:
      return "Ср" //"W"
    case 5:
      return "Чт" //"T"
    case 6:
      return "Пт" //"F"
    case 7:
      return "Сб" //"S"
    default:
      return "Вс" //"S"
    }
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    NSLayoutConstraint.activate([
      monthLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
      monthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      monthLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: 5),

      closeButton.centerYAnchor.constraint(equalTo: monthLabel.centerYAnchor),
      closeButton.heightAnchor.constraint(equalToConstant: 28),
      closeButton.widthAnchor.constraint(equalToConstant: 28),
      closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),

      dayOfWeekStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      dayOfWeekStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      dayOfWeekStackView.bottomAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: -5),

      separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
      separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
      separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
      separatorView.heightAnchor.constraint(equalToConstant: 1)
    ])
  }
}
