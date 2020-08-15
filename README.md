# How to change layout for UICollectionViewCell when user selects and deselects a cell. 

1. On your custom cell class create a method that would perform the change

2. Call appropriate method on func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) and func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
