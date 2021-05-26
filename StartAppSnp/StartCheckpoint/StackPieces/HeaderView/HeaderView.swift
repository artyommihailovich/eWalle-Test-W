//
//  HeaderView.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 5/1/21.
//

import UIKit
import SnapKit
import CoreLocation

final class HeaderView: UIView {
    
    let viewModel: HeaderViewModel
    
    private lazy var timeLabel = UILabel().do {
        $0.font = .with(weight: .regular, size: .number)
    }
    
    private lazy var dateDescriptionLabel = UILabel().do {
        $0.text = viewModel.date + " | " + viewModel.dayOfWeek
        $0.font = .with(weight: .regular, size: .subDate)
        $0.textColor = .purpleText
    }
    
    private lazy var weatherIcon = UIImageView().do {
        $0.image = UI.WeatherIcons.cloudFill
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var weatherLabel = UILabel().do {
        $0.text = viewModel.weather
        $0.font = .with(weight: .regular, size: .subDate)
    }
    
    private lazy var weatherHStack = UIStackView().do {
        $0.axis = .horizontal
        $0.spacing = 5
        $0.distribution = .fill
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        $0.addArrangedSubviews(weatherIcon,
                               weatherLabel)
    }
    
    private lazy var timeAndWeatherHStack = UIStackView().do {
        $0.axis = .horizontal
        $0.spacing = 2
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        $0.addArrangedSubviews(timeLabel,
                               weatherHStack)
    }
    
    private lazy var headerVStackView = UIStackView().do {
        $0.axis = .vertical
        $0.spacing = 5
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        $0.addArrangedSubviews(timeAndWeatherHStack,
                               dateDescriptionLabel)
    }
    
    required init(viewModel: HeaderViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupSubviews()
        implementTimer()
        getCurrentTime()
        
        viewModel.weatherServicve.onCompletion = { [weak self] weather in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.updateWeatherLabel(weather: weather)
            }
        }
        
        if CLLocationManager.locationServicesEnabled() {
            viewModel.locationManager.requestLocation()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(headerVStackView)
        
        headerVStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func implementTimer() {
        viewModel.timer = Timer(timeInterval: 1.0,
                      target: self,
                      selector: #selector(getCurrentTime),
                      userInfo: nil,
                      repeats: true)
        
        if viewModel.timer !=  nil {
           viewModel.timer!.tolerance = 0.5
           RunLoop.current.add(viewModel.timer!, forMode: .common)
        } else {
           print("ERROR: - HeaderView, Timer nil.")
        }
    }
    
    private func updateWeatherLabel(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.weatherLabel.text = "\(weather.temperatureString)" + " Cº"
        }
    }
    
    @objc
    private func getCurrentTime() {
        timeLabel.text = Date().string(with: .timeAMPM)
    }
}
