//
//  StartViewController.swift
//  UIKits
//
//  Created by minsong kim on 10/11/24.
//

import UIKit

class StartViewController: UIViewController {
    private lazy var flowLayout = self.createFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Start"
        view.backgroundColor = .white
        
        configureCollectionView()
    }

    func createFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: (view.frame.width / 2) - 29, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 24, bottom: 50, right: 24)
        
        return layout
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DetailCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension StartViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Model.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DetailCell
        else {
            return UICollectionViewCell()
        }
        
        cell.configureTitleText(Model.allCases[indexPath.row].title)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = Model.allCases[indexPath.row].NextViewController
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

//#Preview {
//    let vc = StartViewController()
//    
//    return vc
//}
