ResQ Cat Club is a MVP  test project

it Consist of two main sections, private and pubic gallery.
* Public gallery reads images directly from https://placekitten.com/300/500?image=INDEX and based on an internal counter, replaces the INDEX with the counter value.For more smooth experience image caching feature is added too.
```dart
image: CachedNetworkImageProvider(
'https://placekitten.com/300/500?image=${publicGallaryCats.index}')

```
* Private gallery is a bit different because it reads from File in which user had uploaded from his private device gallery.
* images would be saved in local storage and add up to the gallary automatically on app initialization.
```dart
  image: () {
    if (privateGallaryCats.images.isNotEmpty) {
        return DecorationImage(
                  fit: BoxFit.fill,image: FileImage(privateGallaryCats.images[privateGallaryCats.index]))
                                              }
          }()
```

