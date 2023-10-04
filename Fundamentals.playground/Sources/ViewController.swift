import UIKit

public class ViewControllerPlayGround: UIViewController {
    let customeComponent: CustomeComponent = {
        let label = CustomeComponent()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    func layout() {
        view.addSubview(customeComponent);
        NSLayoutConstraint.activate([
            customeComponent.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customeComponent.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}


class CustomeComponent: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}


// Percobaan
// 1. tarok di tengah x dan tengan y, tanpa diberikan ukuran frame
// hasil: => 
